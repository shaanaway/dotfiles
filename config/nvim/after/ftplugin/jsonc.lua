vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = "*/waybar/*.jsonc",
    desc = "Reload waybar when changing config",
    callback = function()
        vim.fn.jobstart({ "killall", "-USR2", "waybar" })
    end,
})
