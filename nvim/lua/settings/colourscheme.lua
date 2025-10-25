require("catppuccin").setup({
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    styles = {
        comments = { "italic" },
    },
    custom_highlights = function(colors)
        return {
            CursorLine = { bg = "#313244" },
        }
    end,
    auto_integrations = true,
})
vim.cmd.colorscheme("catppuccin")
require("lualine").setup({
    options = { theme = "catppuccin" },
})
vim.opt.termguicolors = true
require("notify").setup({
    background_colour = "#1e1e2e",
})
