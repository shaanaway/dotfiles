require("settings.lazy")
require("settings.keybinds")
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- distance from current line
vim.opt.hlsearch = false -- no highlight on search
vim.opt.incsearch = true -- highlight while typing query
vim.opt.ignorecase = true -- case insensitive
vim.opt.smartcase = true -- case sensitive if search has capitals
vim.opt.expandtab = true -- spaces clears
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false -- no wrapping text
vim.opt.clipboard = "unnamedplus" -- sys clipboard
vim.opt.foldenable = false -- disables folding on file open, still possible manually
vim.opt.mouse = "nvi"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line,number"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"

vim.opt.scrolloff = 5
--vim.opt.colorcolumn = "80" -- shows when you're close to 80 chars
vim.cmd.colorscheme("catppuccin")
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = MiniTrailspace.trim,
})
require("telescope").load_extension("fzf")
