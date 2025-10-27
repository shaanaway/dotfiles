---@type LazySpec
return {
    "nvim-lua/plenary.nvim", -- lua helper library
    "MunifTanjim/nui.nvim", -- UI library
    { "nvim-lualine/lualine.nvim", opts = { options = { theme = "catppuccin" } } }, -- better status bar

    "mbbill/undotree", -- better undo, i :heart_hands: vimscript
    { "nvim-mini/mini.pairs", version = false, opts = {} },
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
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
    },
    {
        "NeogitOrg/neogit",
        dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" },
        opts = { graph_stype = "kitty" },
    },
    "nvim-tree/nvim-web-devicons", -- nerd font tings
    "nvim-treesitter/nvim-treesitter-context", -- shows current function at top of buf
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        opts = function()
            return { highlights = require("catppuccin.special.bufferline").get_theme() }
        end,
    },
    { "MeanderingProgrammer/render-markdown.nvim" },
    { "tadmccorkle/markdown.nvim", event = "VeryLazy", opts = {} },
    "unblevable/quick-scope", -- 'f' helper
    -- typing trainer
    "neovim/nvim-lspconfig", -- LSP defaults
}
