return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
    vim.keymap.set("n", "<leader>bt", "<cmd>ToggleTerm<CR>", { desc = "turn the terminal on" }),
    vim.keymap.set(
        "t",
        "<esc>",
        [[<C-\><C-n>]], --{buffer = 0},
        { desc = "going back to insert mode" }
    ),
    --    vim.keymap.set(
    --        "t",
    --        "jk",
    --        [[<C-\><C-n>]], -- {buffer = 0},
    --        { desc = "" }
    --    ),
    vim.keymap.set(
        "t",
        "<C-h>",
        [[<Cmd>wincmd h<CR>]], -- {buffer = 0},
        { desc = "move to the left" }
    ),
    vim.keymap.set(
        "t",
        "<C-j>",
        [[<Cmd>wincmd j<CR>]], -- {buffer = 0},
        { desc = "move down" }
    ),
    vim.keymap.set(
        "t",
        "<C-k>",
        [[<Cmd>wincmd k<CR>]], -- {buffer = 0},
        { desc = "move up" }
    ),
    vim.keymap.set(
        "t",
        "<C-l>",
        [[<Cmd>wincmd l<CR>]], -- {buffer = 0},
        { desc = "move right" }
    ),
    vim.keymap.set(
        "t",
        "<C-w>",
        [[<C-\><C-n><C-w>]], -- {buffer = 0},
        { desc = "" }
    ),
    --vim.keymap.set("t", "<C-w>"),
}
