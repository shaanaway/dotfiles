local opt = vim.opt

opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "bash", "lua", "python", "vim", "rust", "zathurarc", "make", "gdscript" },
})
