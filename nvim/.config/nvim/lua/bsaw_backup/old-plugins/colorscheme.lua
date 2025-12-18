return {
    -- currently not using any color scheme
    -- however, if i were to use one, it should go something like this:
    --
    -- priority = 1000
    -- config = function()
    --  local bg = "#______"
    --  local bg_highlight = "#______"
    --  local bg_search = "#______"
    --  local bg_visual = "#______"
    --  local fg = "#______"
    --  local fg_dark = "#______"
    --  local fg_gutter = "#______"
    --  local border = "#______"
    --
    --  require("__NAME_OF_COLORSCHEME__").setup({
    --      style = "__NAME_OF_STYLE__"
    --      on_colors = function(colors)
    --          colors.bg = bg
    --          colors.bg_highlight = bg_highlight
    --          colors.bg_search = bg_search
    --          colors.bg_visual = bg_visual
    --          colors.fg = fg
    --          colors.fg_dark = fg_dark
    --          colors.fg_gutter = fg_gutter
    --          colors.border = border
    --
    --
    --  })
    --  vim.cmd("colorscheme __NAME_OF_COLORSCHEME__)
    -- end
    --

    --[[
    "dylanaraps/wal.vim",
    priority = 1000,

    config = function()
        vim.cmd("colorscheme wal")
    end,
    --]]

    -- "nyoom-engineering/oxocarbon.nvim",
    -- priority = 1000,
    -- config = function()
    -- vim.cmd("colorscheme oxocarbon")
    -- end,
}
