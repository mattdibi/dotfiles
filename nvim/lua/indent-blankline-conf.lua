-- Indent-blankline configuration

require("indent_blankline").setup {
    char = "▏",
    buftype_exclude = {
        "terminal",
        "nofile"
    },
    filetype_exclude = {
        "yaml",
        'dashboard',
        'git',
        'markdown',
        'text',
        'terminal',
        'lspinfo',
        'packer',
        'NvimTree'
    },
    show_first_indent_level = false,
    show_trailing_blankline_indent = false
}
