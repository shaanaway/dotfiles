require("settings.pretty")
require("settings.keybinds")
vim.opt.number = true         -- line number
vim.opt.relativenumber = true -- distance from current line
vim.opt.hlsearch = false      -- no highlight on search
vim.opt.incsearch = true      -- highlight while typing query
vim.opt.ignorecase = true     -- case insensitive
vim.opt.smartcase = true      -- case sensitive if search has capitals
vim.opt.expandtab = true      -- spaces clears
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false              -- no wrapping text
vim.opt.clipboard = "unnamedplus" -- sys clipboard
vim.opt.foldenable = false        -- disables folding on file open, still possible manually
vim.opt.winborder = "rounded"
vim.opt.mouse = "nvi"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line,number"

vim.opt.scrolloff = 10            -- dont have to go all the way up/down to scroll
--vim.opt.colorcolumn = "80" -- shows when you're close to 80 chars



















