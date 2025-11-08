---@type LazySpec
return {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
        vim.g.vimtex_view_method = "zathura_simple"
        vim.g.vimtex_quickfix_ignore_filters = { "Underfull", "Overfull" }
        vim.g.vimtex_compiler_latexmk = {
            out_dir = ".",
        }
    end,
}
