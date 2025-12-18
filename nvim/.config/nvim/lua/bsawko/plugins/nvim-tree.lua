return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup {
            view = { width = 34, relativenumber = false },
            renderer = {
                indent_markers = { enable = true },
                icons = {
                    glyphs = {
                        folder = {
                            arrow_closed = "",
                            arrow_open = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                    },
                }
            },
            actions = {
                open_file = {
                resize_window = true,
                    window_picker = {
                        enable = false
                    }
                }
            },
            git = { ignore = false }
        }

        -- keymaps

        local keymap = vim.keymap
        keymap.set(
            "n", "<leader>ee", "<cmd>NvimTreeToggle<CR>",
            { desc = "Toggle file explorer" }
        )
        keymap.set(
            "n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>",
            { desc = "Collapse file explorer" }
        )
        keymap.set(
            "n", "<leader>er", "<cmd>NvimTreeRefresh<CR>",
            { desc = "Refresh file explorer" }
        )
        keymap.set(
            "n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>",
            { desc = "Toggle file explorer on current file" }
        )
    end,
}
