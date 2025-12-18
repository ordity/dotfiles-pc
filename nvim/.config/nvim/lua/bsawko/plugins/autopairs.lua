return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
    opts = {
        check_ts = true,
        ts_config = {
            lua = { "string" },
            javascript = { "tempate_string" },
            java = false
        }
    }
}
