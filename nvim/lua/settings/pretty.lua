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
            CursorLine = { bg = "#313245" }, -- surface 0, hack in kitty to make this col transparent
        }
    end,
    integrations = {
        which_key = true,
        noice = true,
        notify = true,
        treesitter_context = true,
    },
})
vim.cmd.colorscheme("catppuccin")
require("lualine").setup({
    options = { theme = "catppuccin" },
})
vim.opt.termguicolors = true
require("notify").setup({
    background_colour = "#1e1e2e",
})
