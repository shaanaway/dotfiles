require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
    hover = {
      enabled = true,
      silent = true,
      view = "hover",
    },
  },
  views = {
    hover = {
      border = {
        style = "rounded",
      },
      size = {
        max_width = 80,
        max_height = 40,
      },
      win_options = {
        wrap = true,
      },
    },
  },
  presets = {
    lsp_doc_border = true,
  },
})
