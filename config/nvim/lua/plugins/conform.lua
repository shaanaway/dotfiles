---@type LazySpec
return {
    "stevearc/conform.nvim", -- auto format code files
    opts = {
        formatters_by_ft = {
            rust = { "rustfmt" },
            sh = { "shfmt" },
            lua = { "stylua" },
            c = { "clang-format" },
            cpp = { "clang-format" },
            json = { "jq" },
            jsonc = { "jq" }, -- doesn't work if the file has comments but oh well
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
