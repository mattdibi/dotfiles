---
description: Jira agent
mode: subagent
model: github-copilot/claude-opus-4.6
temperature: 0.1
tools:
  write: true
  edit: true
  bash: false
---

When connected to atlassian-rovo-mcp:

- **MUST** use Jira project key = <PROJECT-KEY>
- **MUST** use cloudId = "<CLOUD-URL>" (do NOT call getAccessibleAtlassianResources)
- **MUST** use Confluence spaceId = "<COUNFLUENCE-ID>"
- **MUST** use `maxResults: 10` or `limit: 10` for ALL Jira JQL and Confluence CQL search operations.
