-- stuffs
local notify = require("notify")
local builtin = require("telescope.builtin")
local function current_buf_dir() vim.fn.expand('%:p:h') end
local function change_working_dir() vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h')) end

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
vim.keymap.set("n", "<leader>d", notify.dismiss, { desc = "Dismiss notifications" })
vim.keymap.set("n", "<leader>cd", change_working_dir, { desc = "Change dir" })
vim.keymap.set("n", "<leader>(", function()
  vim.g.minipairs_disable = not vim.g.minipairs_disable
  if not vim.g.minipairs_disable then
    require("mini.pairs").setup()
  end
end, { desc = "Toggle auto-pairing" })




-- TELESCOPE
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>F", function() builtin.find_files({ search_dirs = { current_buf_dir() } }) end,
    { desc = "Search files (bufdir)" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Search file contents" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Search buffers" })

-- LSP servers are set up in lsp/cmp.lua
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic window" })
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count = -1, float = true}) end, { desc = "Go to prev diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count = 1, float = true}) end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {desc = "list diagnostics"})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        --vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Show hover info" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "List all implementations" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Show signature info" })
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder,
            { buffer = ev.buf, desc = "Add workspace folder" })
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder,
            { buffer = ev.buf, desc = "Remove workspace folder" })
        vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go to type definition" })
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename variable" })
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action,
            { buffer = ev.buf, desc = "List code actions" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "List all references" })
        vim.keymap.set("n", "<space>n",
            function() require("conform").format({async = true}) end,
            { buffer = ev.buf, desc = "Format buffer" })
    end,
})
