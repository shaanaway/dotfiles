local function get_server_names(files)
    local names = {}
    for file, type in files do
        if type ~= "file" or file == "*.lua" then
            goto continue
        end
        local name = vim.fs.basename(file):gsub(".lua$", "")
        names[#names + 1] = name
        ::continue::
    end
    return names
end
local function conf_servers()
    local servers = {}
    local user_conf_paths = { vim.fn.stdpath("config"), vim.fn.stdpath("config") .. "/after" }
    for _, path in ipairs(user_conf_paths) do
        local files = vim.fs.dir(path .. "/lsp")
        local lsps = get_server_names(files)
        for i = 1, #lsps do
            servers[#servers + 1] = lsps[i]
        end
    end
    return servers
end

vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- append to this list for servers that don't need extra config but do need to be enabled
local servers = conf_servers()
vim.lsp.enable(servers)
