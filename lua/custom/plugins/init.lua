-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        '<CR>',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      -- { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>xs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>xl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'chrisgrieser/nvim-rip-substitute',
    cmd = 'RipSubstitute',
    opts = {},
    keys = {
      {
        '<leader>rs',
        function()
          require('rip-substitute').sub()
        end,
        mode = { 'n', 'x' },
        desc = 'rip substitute',
      },
    },
  },
  {
    'cameron-wags/rainbow_csv.nvim',
    ft = { 'csv', 'tsv', 'csv_semicolon', 'csv_whitespace', 'csv_pipe', 'rfc_csv', 'rfc_semicolon' },
    config = true, -- uses default config
  },
  {
    'esmuellert/vscode-diff.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
  },
  {
    'chrisgrieser/nvim-spider',
    keys = {
      { 'W', "<cmd>lua require('spider').motion('w')<CR>", mode = { 'n', 'o', 'x' } },
      { 'E', "<cmd>lua require('spider').motion('e')<CR>", mode = { 'n', 'o', 'x' } },
      { 'B', "<cmd>lua require('spider').motion('b')<CR>", mode = { 'n', 'o', 'x' } },
    },
  },
}
