vim.lsp.config('qmlls', { cmd={ 'qmlls' }})
vim.lsp.enable('qmljs')
vim.lsp.config("rust_analyzer", { settings = { autoformat = false }})
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'qml' },
  callback = function() vim.treesitter.start() end,
})
-- vim.cmd.RustLsp('flyCheck')
-- vim.cmd.RustLsp { 'flyCheck', 'run' }
-- vim.cmd.RustLsp { 'flyCheck', 'clear' }
-- vim.cmd.RustLsp { 'flyCheck', 'cancel' }
