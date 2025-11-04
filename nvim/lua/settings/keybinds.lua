-- stuffs
local function change_working_dir()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
end

local function project_root()
    local root = vim.fs.find({ ".git", "Makefile", "package.json" }, { upward = true })[1]
    if root then
        return vim.fs.dirname(root)
    else
        return vim.uv.cwd()
    end
end

-- get rid of the cursor centering
vim.keymap.set("n", "<C-d>", "Lzz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "Hzz", { desc = "Scroll up" })
vim.keymap.set("v", "s", ":'<,'>sort<CR>", { noremap = true, silent = true, desc = "Sort selection" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo Tree" })
vim.keymap.set("n", "<M-j>", ":bprev<CR>", { desc = "Previous Buffer", silent = true })
vim.keymap.set("n", "<M-k>", ":bnext<CR>", { desc = "Next Buffer", silent = true })
vim.keymap.set("n", "<M-h>", ":tabprev<CR>", { desc = "Previous Tab", silent = true })
vim.keymap.set("n", "<M-l>", ":tabnext<CR>", { desc = "Next Tab", silent = true })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>cd", change_working_dir, { desc = "Change dir" })
vim.keymap.set("n", "<leader>(", function()
    vim.g.minipairs_disable = not vim.g.minipairs_disable
    if not vim.g.minipairs_disable then
        require("mini.pairs").setup()
    end
end, { desc = "Toggle auto-pairing" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>fF", function()
    builtin.find_files({ cwd = project_root() })
end, { desc = "Search files (repo)" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search file contents" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Search buffers" })
vim.keymap.set("n", "<space>n", function()
    require("conform").format({ async = true })
end, { desc = "Format buffer" })

-- debugging
local dap = require("dap")
local dapui = require("dapui")
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debug" })
vim.keymap.set("n", "<Down>", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<Right>", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<Left>", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>B", function()
    dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint" })
vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open DAP REPL" })
vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Run Last" })
vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle DAP UI" })

-- LSP servers are set up in lsp/blink.lua
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic window" })
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to prev diagnostic" })
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "list diagnostics" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Show hover info" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "List all implementations" })
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Show signature info" })
        vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { buffer = ev.buf, desc = "Add workspace folder" })
        vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf, desc = "Remove workspace folder" })
        vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go to type definition" })
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename variable" })
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "List code actions" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "List all references" })
    end,
})
