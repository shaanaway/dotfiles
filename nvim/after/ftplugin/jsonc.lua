vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = (vim.env.XDG_CONFIG_HOME or (vim.fn.expand("~") .. "/.config")) .. "/waybar/*",
    desc = "Reload waybar when changing config",
    command = "silent exec '!killall -SIGUSR2 waybar'",
})
