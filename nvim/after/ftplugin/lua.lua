vim.api.nvim_create_user_command("Love", function()
    vim.fn.jobstart("/Applications/love.app/Contents/MacOS/love .", { detach = true })
end, {})
