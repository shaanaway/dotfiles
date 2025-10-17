require("conform").setup({
    formatters_by_ft = {
        rust = { "rustfmt" },
        sh = { "shfmt" },
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})
