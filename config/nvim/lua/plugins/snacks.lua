---@type LazySpec
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false, -- for dashboard
    keys = {
        { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart search files" },
        { "<leader>fs", function() Snacks.picker.pickers() end, desc = "Select pickers" },
        { "<leader>ff", function() Snacks.picker.files() end, desc = "Search files" },
        { "<leader>fF", function() Snacks.picker.git_files() end, desc = "Search files (repo)" },
        { "<leader>fg", function() Snacks.picker.grep() end, desc = "Search file contents" },
        { "<leader>fG", function() Snacks.picker.git_grep() end, desc = "Search file contents (repo)" },
        { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Search buffers" },
        { "<leader>fh", function() Snacks.picker.help() end, desc = "Search help pages" },
        { "<leader>fe", function() Snacks.picker.diagnostics() end, desc = "Search diagnostics (buffer)" },
        { "<leader>fE", function() Snacks.picker.diagnostics_buffer() end, desc = "Search diagnostics (global)" },
        { "<leader>fr", function() Snacks.picker.recent() end, desc = "Search recent files" },
        { "<leader>qf", function() Snacks.picker.qflist() end, desc = "Search quickfix" },
        { "<leader>g", function() Snacks.lazygit() end, desc = "Open Lazygit" },
    },
    ---@type snacks.Config
    opts = {
        dashboard = {
            example = "doom",
            preset = {
                header = {
                    [[
███████╗██╗  ██╗ █████╗  █████╗ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
██╔════╝██║  ██║██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
███████╗███████║███████║███████║██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
╚════██║██╔══██║██╔══██║██╔══██║██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
███████║██║  ██║██║  ██║██║  ██║██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                    hl = "SnacksDashboardHeader",
                },
            },
        },
        explorer = {},
        indent = {},
        lazygit = {},
        picker = {},
        scroll = {},
        statuscolumn = {},
    },
}
