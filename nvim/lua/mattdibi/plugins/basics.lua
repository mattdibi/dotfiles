return {
    "ntpeters/vim-better-whitespace",
    "tpope/vim-vinegar",
    "tpope/vim-surround",
    "tpope/vim-repeat",
    "tpope/vim-commentary",
    {
        "MunsMan/kitty-navigator.nvim",
        build = {
            "cp navigate_kitty.py ~/.config/kitty",
            "cp pass_keys.py ~/.config/kitty",
        },
        opts = {
            keybindings = {
                left = "<C-h>",
                down = "<C-j>",
                up = "<C-k>",
                right = "<C-l>",
            },
        },
    }
}
