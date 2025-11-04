-- this just sets the default capabilities with blink.cmp
-- if you need something bigger scroll down
local servers = { "clangd", "rust_analyzer", "teal_ls" }
local capabilities = require("blink.cmp").get_lsp_capabilities()
for _, lsp in ipairs(servers) do
    vim.lsp.config(lsp, {
        capabilities = capabilities,
    })
end

vim.lsp.enable(servers)

-- do custom settings here
-- note to self: consider new file for each new complex lsp config
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath("config")
                and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                version = "LuaJIT",
                path = {
                    "lua/?.lua",
                    "lua/?/init.lua",
                },
            },
            -- Make the server aware of Neovim runtime files
            -- lazydev.nvim for plugin runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                },
            },
        })
    end,
    settings = {
        Lua = {},
    },
})
vim.lsp.enable("lua_ls")
