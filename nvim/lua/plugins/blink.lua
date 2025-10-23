return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    -- use a release tag to download pre-built binaries
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- ctrl+n/p to cycle through list
        keymap = { preset = "enter" },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            documentation = { auto_show = true },
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },

        signature = { enabled = true },
    },
}
