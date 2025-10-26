return {
    "nvim-lua/plenary.nvim", -- lua helper library
    "MunifTanjim/nui.nvim", -- UI library
    { "nvim-lualine/lualine.nvim", opts = { options = { theme = "catppuccin" } } }, -- better status bar

    "mbbill/undotree", -- better undo, i :heart_hands: vimscript
    { "nvim-mini/mini.pairs", version = false, opts = {} },
    { "nvim-mini/mini.trailspace", version = false, opts = {} }, -- highlight trailing spaces
    "rcarriga/nvim-notify",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "NeogitOrg/neogit",
        dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" },
        opts = { graph_stype = "kitty" },
    },
    "nvim-tree/nvim-web-devicons", -- nerd font tings
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-treesitter/nvim-treesitter-context", -- shows current function at top of buf
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    { "MeanderingProgrammer/render-markdown.nvim" },
    { "tadmccorkle/markdown.nvim", event = "VeryLazy", opts = {} },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            image = {},
        },
    },
    -- nudges when you use unoptimal movement
    { "m4xshen/hardtime.nvim", lazy = false, dependencies = { "MunifTanjim/nui.nvim" }, opts = {} },
    "unblevable/quick-scope", -- 'f' helper
    -- typing trainer
    { "nvzone/typr", dependencies = "nvzone/volt", opts = {}, cmd = { "Typr", "TyprStats" } },
    "neovim/nvim-lspconfig", -- LSP defaults
}
