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
    keys = {
        { "<space>n", function() require("conform").format({ async = true }) end, desc = "Format buffer" },
    },
    lazy = true,
}
