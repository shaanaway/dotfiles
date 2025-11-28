---@type LazySpec
return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                "lazy.nvim",
                "snacks.nvim",
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "saghen/blink.cmp",
        dependencies = { { "L3MON4D3/LuaSnip", version = "2.x" }, "archie-judd/blink-cmp-words" },

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
                per_filetype = {
                    markdown = { "dictionary" },
                    typst = { inherit_defaults = true, "dictionary" },
                    -- tex = { "dictionary" },
                },
                providers = {
                    lazydev = {
                        name = "LazyDev",
                        module = "lazydev.integrations.blink",
                        score_offset = 100,
                    },

                    dictionary = {
                        name = "blink-cmp-words",
                        module = "blink-cmp-words.dictionary",
                        -- All available options
                        opts = {
                            -- The number of characters required to trigger completion.
                            -- Set this higher if completion is slow, 3 is default.
                            dictionary_search_threshold = 1,

                            -- See above
                            score_offset = 0,

                            -- See above
                            definition_pointers = { "!", "&", "^" },
                        },
                    },
                },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            signature = { enabled = true },
        },
    },
}
