return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    build = ':TSUpdate',

    config = function()
        local treesitter = require("nvim-treesitter")

        treesitter.setup({
            highlight = { enable=true },
            indent = { enable = true },
            autotag = { enable = true },

            sync_install = false,
            auto_install = true,

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    spoce_incremental = false,
                    node_decremental = "<bs>",
                },
            },

            modules = {},

            ensure_installed = {
                "json",
                "javascript",
                "typescript",
                "tsx",
                "yaml",
                "html",
                "css",
                "prisma",
                "markdown",
                "markdown_inline",
                "svelte",
                "graphql",
                "bash",
                "lua",
                "vim",
                "dockerfile",
                "gitignore",
                "query",
                "vimdoc",
                "c",
                "python",
                "java",
                "qml",
            },

            ignore_install = {},
        })
    end,
}
