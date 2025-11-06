require("settings.lazy")
require("settings.keybinds")
vim.opt.clipboard = "unnamedplus" -- sys clipboard
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line,number"
vim.opt.expandtab = true -- spaces clears
vim.opt.foldenable = false -- disables folding on file open, still possible manually
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldmethod = "expr"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.hlsearch = false -- no highlight on search
vim.opt.ignorecase = true -- case insensitive
vim.opt.incsearch = true -- highlight while typing query
vim.opt.list = true
vim.opt.listchars = "tab:» ,lead:·,trail:·"
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- distance from current line
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.smartcase = true -- case sensitive if search has capitals
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.wrap = false -- no wrapping text
-- vim.opt.colorcolumn = "80" -- shows when you're close to 80 chars
