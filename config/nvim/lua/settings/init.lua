require("settings.lazy")
require("settings.keybinds")
vim.o.clipboard = "unnamedplus" -- sys clipboard
vim.o.cursorline = true
vim.o.cursorlineopt = "line,number"
vim.o.expandtab = true -- spaces clears
vim.o.foldenable = false -- disables folding on file open, still possible manually
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldmethod = "expr"
vim.o.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.o.hlsearch = false -- no highlight on search
vim.o.ignorecase = true -- case insensitive
vim.o.incsearch = true -- highlight while typing query
vim.o.list = true
vim.o.listchars = "tab:» ,lead:·,trail:·"
vim.o.number = true -- line number
vim.o.relativenumber = true -- distance from current line
vim.o.scrolloff = 5
vim.o.shiftwidth = 4
vim.o.smartcase = true -- case sensitive if search has capitals
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.wrap = false -- no wrapping text
