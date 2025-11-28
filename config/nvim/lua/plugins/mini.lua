---@type LazySpec
return {
    "nvim-mini/mini.nvim",
    version = false,
    opts = {
        pairs = { modes = { insert = true, command = true } },
    },
    config = function(_, opts) require("mini.pairs").setup(opts.pairs) end,
}
