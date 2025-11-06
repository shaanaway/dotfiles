---@type LazySpec
return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                "lazy.nvim",
                "nvim-dap-ui",
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "saghen/blink.cmp",
        dependencies = { "L3MON4D3/LuaSnip", version = "2.x" },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- ctrl+n/p to cycle through list
            keymap = { preset = "enter" },

            appearance = {
                nerd_font_variant = "normal",
            },

            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500 },
            },
            snippets = { preset = "luasnip" },
            sources = {
                -- add lazydev to your completion providers
                default = { "lazydev", "lsp", "path", "snippets" },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },

            signature = { enabled = true },
        },
    },
}
