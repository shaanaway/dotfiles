---@type LazySpec
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
        flavour = "mocha",
        background = {
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true, -- disables setting the background color.
        styles = {
            comments = { "italic" },
        },
        auto_integrations = true,
    },
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
