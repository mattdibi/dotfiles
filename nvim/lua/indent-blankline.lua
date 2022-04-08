-- Indent-blankline configuration

require("indent_blankline").setup {
    char = "▏",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"help", "text", "yaml"},
    show_first_indent_level = false,
    show_trailing_blankline_indent = false
}
