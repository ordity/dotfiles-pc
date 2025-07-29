return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            transparent_mode = true,
            strikethrough = false,
            dim_inactive = false,
            contrast = "soft",
            overrides = {
                ColorColumn = { bg = "#ff9900" },
            },
        })
        vim.cmd("colorscheme gruvbox")
    end,
}
