vim.keymap.set("v", "s", ":'<,'>sort<CR>", { noremap = true, silent = true, desc = "Sort selection" })
vim.keymap.set("n", "<M-j>", ":bprev<CR>", { desc = "Previous buffer", silent = true })
vim.keymap.set("n", "<M-k>", ":bnext<CR>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<M-h>", ":tabprev<CR>", { desc = "Previous tab", silent = true })
vim.keymap.set("n", "<M-l>", ":tabnext<CR>", { desc = "Next tab", silent = true })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>cd", function()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
end, { desc = "Change working dir to buffer" })
vim.keymap.set("n", "<leader>(", function()
    vim.g.minipairs_disable = not vim.g.minipairs_disable
    if not vim.g.minipairs_disable then
        require("mini.pairs").setup()
    end
end, { desc = "Toggle auto-pairing" })
vim.keymap.set("n", "<leader>h", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

vim.keymap.set("n", "<leader>md", require("render-markdown").toggle, { desc = "Toggle markdown rendering" })

-- SO much faster than telescope like what
vim.keymap.set("n", "<leader>fs", Snacks.picker.pickers, { desc = "Search files" })
vim.keymap.set("n", "<leader>ff", Snacks.picker.files, { desc = "Search files" })
vim.keymap.set("n", "<leader>fF", Snacks.picker.git_files, { desc = "Search files (repo)" })
vim.keymap.set("n", "<leader>fg", Snacks.picker.grep, { desc = "Search file contents" })
vim.keymap.set("n", "<leader>fG", Snacks.picker.git_grep, { desc = "Search file contents" })
vim.keymap.set("n", "<leader>fb", Snacks.picker.buffers, { desc = "Search buffers" })

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

-- replace #rrggbb with rgb(r, g, b) or vice versa
-- rgba(r, g, b, a) => #rrggbb (lossy)
vim.keymap.set("n", "<leader>cc", function()
    local cword = vim.fn.expand("<cword>")
    local line = vim.api.nvim_get_current_line()

    -- #rrggbb to rgb()
    if #cword == 6 then
        local index = line:find(cword)
        -- should be impossible?
        if index == nil then
            return
        end
        local hex = line:sub(index - 1, index + #cword - 1)

        local match = hex:match("^#(%x%x%x%x%x%x)$")
        if not match then
            return
        end
        local r = tonumber(match:sub(1, 2), 16)
        local g = tonumber(match:sub(3, 4), 16)
        local b = tonumber(match:sub(5, 6), 16)

        local new_line = line:gsub("#" .. match, string.format("rgb(%d, %d, %d)", r, g, b))
        vim.api.nvim_set_current_line(new_line)
    else
        -- #rgb() to #rrggbb
        local index, start = line:find("rgba?%(")
        local ending = line:find("%)", start)
        if index == nil or start == nil or ending == nil then
            return
        end

        local values = line:sub(start + 1, ending - 1)
        local nums = {}
        for num in values:gmatch("%d+") do
            table.insert(nums, string.format("%02x", num))
        end
        local r, g, b = nums[1], nums[2], nums[3]
        local match = line:sub(index, ending):gsub("([^%w])", "%%%1")
        local new_line = line:gsub(match, string.format("#%s%s%s", r, g, b))
        vim.api.nvim_set_current_line(new_line)
    end
end, { desc = "Toggle between hex colour and rgb()", noremap = true, silent = true })

-- LSP servers are set up in lsp/blink.lua
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic window" })
vim.keymap.set("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to prev diagnostic" })
vim.keymap.set("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "list diagnostics" })
vim.keymap.set({ "n" }, "<space>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
vim.keymap.set("n", "<space>n", function()
    require("conform").format({ async = true })
end, { desc = "Format buffer" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Show hover info" })
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "List all implementations" })
        vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Show signature info" })
        vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Go to type definition" })
        vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename variable" })
        vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "List code actions" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "List all references" })
    end,
})
