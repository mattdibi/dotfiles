return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = false,
                theme = 'auto',
                component_separators = { left = '|', right = '|'},
                section_separators = '',
                disabled_filetypes = {},
                always_divide_middle = true,
                always_show_tabline = false,
                globalstatus = false,
            },
            sections = {
                lualine_a = {'filename'},
                lualine_b = {},
                lualine_c = {'branch', 'diff'},
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {
                lualine_a = {
                    {
                        'tabs',
                        mode = 2,
                    },
                },
            },
            extensions = {}
        }

        -- Smarter focus detection
        -- Reference: https://github.com/nvim-lualine/lualine.nvim/issues/498
        local old_is_focused = require'lualine.utils.utils'.is_focused
        require'lualine.utils.utils'.is_focused = function()
            if _G.ForceLualineFocus ~= nil then
                return _G.ForceLualineFocus
            end
            return old_is_focused()
        end

        vim.api.nvim_create_autocmd("FocusGained", {
            callback = function()
                ForceLualineFocus = nil
            end,
        })
        vim.api.nvim_create_autocmd("FocusLost", {
            callback = function()
                ForceLualineFocus = false
            end,
        })

    end
}
