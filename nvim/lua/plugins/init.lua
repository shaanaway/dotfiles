local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- gotta do this here or stuff gets weird
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({
    "nvim-lua/plenary.nvim", -- lua helper library
    "MunifTanjim/nui.nvim", -- UI library
    { "catppuccin/nvim", name = "catppuccin" }, -- best colourscheme
    "nvim-lualine/lualine.nvim", -- better status bar

    "neovim/nvim-lspconfig", -- LSP defaults
    "mbbill/undotree", -- better undo, i :heart_hands: vimscript
    { "nvim-mini/mini.pairs", version = false },
    "rcarriga/nvim-notify",
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any opts here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
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
    },
    "axieax/urlview.nvim", -- view urls
    "nvim-tree/nvim-web-devicons", -- nerd font tings
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-context", -- shows current function at top of buf
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    "MeanderingProgrammer/render-markdown.nvim",
    {
        "tadmccorkle/markdown.nvim",
        event = "VeryLazy",
        opts = {
            -- configuration here or empty for defaults
        },
    },

    "stevearc/conform.nvim", -- auto format code files
    "mfussenegger/nvim-dap", -- debugging
    -- these dudes so damn extra bruh
    require("plugins.blink"),
    require("plugins.vimtex"),
    require("plugins.yazi"),
})

require("ibl").setup()
require("mini.pairs").setup()
require("markdown").setup()

-- most files i put these up top
-- but for plugins they gotta be down low
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.conform")
require("plugins.noice")
require("plugins.neogit")
