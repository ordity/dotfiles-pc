local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "bsaw.plugins" },
    { import = "bsaw.plugins.lsp" },
}, {
    checker = { enabled = true, notify = false },
    change_detection = { notify = false },
})

vim.lsp.config("rust_analyzer", {
    -- Server-specific settings. See `:help lsp-quickstart`
    settings = {
        autoformat = false,
    },
})

--vim.cmd[[colorscheme no-clown-fiesta]]
