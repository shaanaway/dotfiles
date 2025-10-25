require("settings.lazy")
require("settings")
require("lsp")
-- load snippets
require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua/snippets" })
