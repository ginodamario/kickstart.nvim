vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.colorcolumn = '100'
vim.o.wrap = false

vim.keymap.set('n', '<leader>qq', '<cmd>qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>wa', '<cmd>wa<CR>', { desc = 'Write all' })
vim.keymap.set('n', '<leader>ww', '<cmd>w<CR>', { desc = 'Write file' })
vim.keymap.set('n', '<leader>wv', '<cmd>vs<CR>', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>ws', '<cmd>sp<CR>', { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>wc', '<cmd>q<CR>', { desc = 'Window close' })
vim.keymap.set('n', 'go', '<cmd>LspClangdSwitchSourceHeader<CR>', { desc = 'Switch source header' })
vim.keymap.set('n', 'gl', '$', { desc = 'Goto end of line' })
vim.keymap.set('n', 'gh', '0', { desc = 'Goto start of line' })
vim.keymap.set('n', 'gs', '^', { desc = 'Goto first non-blank line' })

vim.keymap.set('n', '<leader>v', '`[v`]', { desc = 'Select last paste/change' })

-- Close the buffer without closing the split.
vim.keymap.set('n', '<leader>c', function()
  require('mini.bufremove').delete(0)
end, { desc = 'Close buffer' })

-- Toggle the diagnostic text on and off that is at the end of the line.
vim.keymap.set('n', '<leader>td', function()
  local current = vim.diagnostic.config().virtual_text
  vim.diagnostic.config { virtual_text = not current }
end, { desc = 'Toggle diagnostics' })

-- Trim white spaces at end of the line
local function trim_trailing_whitespace()
  local view = vim.fn.winsaveview()
  vim.cmd [[%s/\s\+$//e]]
  vim.fn.winrestview(view)
end

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = trim_trailing_whitespace,
})

vim.keymap.set('n', '<leader>sm', function()
  require('telescope.builtin').lsp_document_symbols {
    symbols = { 'function', 'method' },
    symbol_width = 50,
  }
end, { desc = 'Search Functions/Methods' })

vim.keymap.set('n', '<leader>tt', function()
  local file = vim.fn.expand '%:p' -- full path of current file
  local line = tostring(vim.fn.line '.')

  -- fire and forget (doesn't block Neovim)
  vim.fn.jobstart({ 'blame2', file, line }, {
    detach = true,
  })
end, { desc = 'Launch tig blame' })
