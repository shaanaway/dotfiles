return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            hover = {
                enabled = true,
                silent = true,
            },
            signature = {
                enabled = true,
            },
        },
        presets = {
            bottom_search = true,
            command_palette = true,
            lsp_doc_border = true,
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
