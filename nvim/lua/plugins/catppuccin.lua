return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
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
        custom_highlights = function(colors)
            return {
                CursorLine = { bg = "#313244" },
            }
        end,
        auto_integrations = true,
    },
}
