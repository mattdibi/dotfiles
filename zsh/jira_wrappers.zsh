# Atlassian CLI wrappers/helpers
# Install with `source path/to/jira_wrappers.zsh`

# Path to the acli executable used by all functions below.
JIRA_ACLI="$HOME/Desktop/atlassian-cli/acli"

jira_update() {
    # Done" status omitted because we need to populate the "Resolution status"
    # which can only be selected via UI -..-
    local statuses=("TO DO" "In Progress" "In Review")
    local key="$1" choice

    if [[ -z "$key" ]]; then
        key=$(jira_select) || return 1
    fi

    if (( ! $+commands[fzf] )); then
        echo "jira_update: fzf not found in PATH" >&2
        return 1
    fi

    choice=$(printf '%s\n' "${statuses[@]}" | fzf \
        --prompt="Status for $key > " \
        --header="Enter to select, Esc to cancel" \
        --height=40% \
        --layout=reverse \
        --border \
        --no-multi)

    if [[ -z "$choice" ]]; then
        echo "Cancelled." >&2
        return 1
    fi

    "$JIRA_ACLI" jira workitem transition --key "$key" --status "$choice"
    echo "Link: https://<OMISSIS>/browse/$key"
}

jira_comment() {
    # $1: (optional) work item key — picked with jira_select when omitted
    # $2: (optional) comment body — must be a single quoted string
    local key="$1" body="$2"

    if [ $# -gt 2 ]; then
        echo "jira_comment: too many arguments (${#} given)." >&2
        echo "  The comment body must be a single quoted string:" >&2
        echo "    jira_comment $1 \"$*\"" >&2
        return 2
    fi

    if [ -z "$key" ]; then
        key=$(jira_select) || return 1
    fi

    if [ -z "$body" ]; then
        "$JIRA_ACLI" jira workitem comment create --key "$key" --editor
    else
        "$JIRA_ACLI" jira workitem comment create --key "$key" --body "$body"
    fi
    echo "Link: https://<OMISSIS>/browse/$key"
}

jira_link_pr() {
    # $1: PR link (required)
    # $2: (optional) work item key — picked with jira_select when omitted
    local url="$1" key="$2" adf

    if [ $# -lt 1 ] || [ $# -gt 2 ]; then
        echo "usage: jira_pr_comment <pr-url> [work-item-key]" >&2
        return 2
    fi

    case "$url" in
        http://*|https://*) ;;
        *) echo "jira_pr_comment: '$url' is not a valid URL." >&2; return 2 ;;
    esac

    if ! command -v jq >/dev/null 2>&1; then
        echo "jira_pr_comment: jq is required to build the ADF body." >&2
        return 1
    fi

    if [ -z "$key" ]; then
        key=$(jira_select) || return 1
    fi

    # Note: `gh pr view` with no argument resolves the PR associated with the current branch in the current repository
    # Therefore we don't need to specify the url:
    # url=$(gh pr view --json url --jq .url 2>/dev/null)
    # We'll update this in the future, let's try it as-is for now

    adf=$(jq -nc --arg url "$url" '{
        version: 1,
        type: "doc",
        content: [
            {
                type: "paragraph",
                content: [
                    { type: "text", text: "Implemented in " },
                    {
                        type: "text",
                        text: $url,
                        marks: [ { type: "link", attrs: { href: $url } } ]
                    }
                ]
            }
        ]
    }') || return 1

    "$JIRA_ACLI" jira workitem comment create --key "$key" --body "$adf"

    echo "Link: https://<OMISSIS>/browse/$key"
}

# jira_select — pick one of your workitems in the current sprint(s) and copy its key.
#
#   jira_select          -> project KEY (default)
#   jira_select OTHER    -> another project key
#
# Requires: acli, jq, fzf, pbcopy.
# Type to filter, Enter to pick, Esc to abort, Ctrl-/ to toggle the preview.
# Source this file from ~/.zshrc, or paste the function into it.

jira_select() {
  local project="${1:-KEY}"
  local jql="assignee = currentUser() AND project = ${project} AND sprint in openSprints()"

  local raw
  raw=$("$JIRA_ACLI" jira workitem search \
          --jql "$jql" \
          --limit 50 \
          --fields "key,issuetype,status,summary" \
          --json) || {
    print -u2 "jira_select: acli search failed"
    return 1
  }

  # Normalise the payload: tolerate a bare array or a wrapper object, and
  # fields either flattened or nested under .fields.
  local -a rows
  rows=("${(@f)$(printf '%s' "$raw" | jq -r '
      (if type == "array" then . else (.issues // .workitems // .results // .values // []) end)
      | .[]
      | [ (.key // .fields.key // "?"                                        | tostring),
          (.fields.issuetype.name? // .issuetype.name? //
           .fields.issuetype?      // .issuetype?      // "-"                | tostring),
          (.fields.status.name?    // .status.name?    //
           .fields.status?         // .status?         // "-"                | tostring),
          (.fields.summary         // .summary         // ""                 | tostring) ]
      | @tsv
  ')}") || return 1

  rows=(${rows:#})   # drop empty lines
  if (( ${#rows} == 0 )); then
    print -u2 "jira_select: no workitems assigned to you in the open sprints of $project"
    return 1
  fi

  # Build pipe-separated, column-aligned lines. `column -o` is util-linux only,
  # so pad by hand to stay portable on macOS.
  local -a display fields
  local -i kw=0 tw=0 sw=0
  local row
  for row in "${rows[@]}"; do
    fields=("${(@ps:\t:)row}")
    (( ${#fields[1]} > kw )) && kw=${#fields[1]}
    (( ${#fields[2]} > tw )) && tw=${#fields[2]}
    (( ${#fields[3]} > sw )) && sw=${#fields[3]}
  done
  for row in "${rows[@]}"; do
    fields=("${(@ps:\t:)row}")
    display+=("$(printf '%-*s | %-*s | %-*s | %s' \
                 $kw "$fields[1]" $tw "$fields[2]" $sw "$fields[3]" "$fields[4]")")
  done

  # Header padded the same way so it lines up with the rows.
  local header
  header=$(printf '%-*s | %-*s | %-*s | %s' \
             $kw "KEY" $tw "TYPE" $sw "STATUS" "SUMMARY")

  # --nth=1,4 restricts fuzzy matching to key + summary, so typing "bug" or
  # "done" doesn't match the type/status columns of every row.
  local choice
  choice=$(print -l -- "${display[@]}" |
           fzf --height=60% \
               --reverse \
               --header="$header" \
               --header-first \
               --prompt="${project} > " \
               --delimiter=' *\| *' \
               --nth=1,4 \
               --preview="$JIRA_ACLI jira workitem view {1}" \
               --preview-window='right:50%:wrap:hidden' \
               --bind='ctrl-/:toggle-preview') || return 1
  [[ -n "$choice" ]] || return 1

  local key=${choice%% *}

  # Only advertise the key when picked straight from the CLI; wrappers such as
  # jira_comment / jira_update just consume it on stdout and print their own link.
  if (( ${#funcstack} == 1 )); then
    printf '%s' "$key" | pbcopy && print -u2 "Copied ${key} to clipboard"
    print -u2 "Link: https://<OMISSIS>/browse/$key"
  fi
  print -r -- "$key"          # stdout carries only the key, for $(jira_select)
}

