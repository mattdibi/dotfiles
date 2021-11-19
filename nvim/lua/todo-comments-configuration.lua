-- Todo-comments configuration

require'todo-comments'.setup {
    signs = false, -- show icons in the signs column
    -- keywords recognized as todo comments
    keywords = {
        FIXME  = { icon = "? ", color = "error", alt = { "BUG",  "ISSUE" } },
        TODO   = { icon = "? ", color = "info" },
        HACK   = { icon = "? ", color = "warning" },
        WARN   = { icon = "? ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF   = { icon = "? ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE   = { icon = "? ", color = "hint", alt = { "INFO" } },
    },
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "bg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*]], -- pattern used for highlightng (vim regex)
        comments_only = true, -- this applies the pattern only inside comments using `commentstring` option
    },
    -- list of named colors where we try to extract the guifg from the
    -- list of hilight groups or use the hex color if hl not found as a fallback
    colors = {
        error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
        warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
        info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
        hint = { "LspDiagnosticsDefaultHint", "#10B981" },
        default = { "Identifier", "#7C3AED" },
    }
}
