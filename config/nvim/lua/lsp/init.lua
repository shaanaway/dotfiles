-- this just sets the default capabilities with blink.cmp
-- if you need something bigger put it in lsp/{name}.lua
local servers = { "clangd", "rust_analyzer", "lua_ls" }
for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
    })
end
vim.lsp.enable(servers)
