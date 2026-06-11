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
        's',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').jump()
        end,
        desc = 'Flash',
      },
      {
        'S',
        mode = { 'n', 'x', 'o' },
        function()
          require('flash').treesitter()
        end,
        desc = 'Flash Treesitter',
      },
      -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      -- {
      --   'R',
      --   mode = { 'o', 'x' },
      --   function()
      --     require('flash').treesitter_search()
      --   end,
      --   desc = 'Treesitter Search',
      -- },
      -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xx',
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
    config = function()
      require('codediff').setup {
        -- Keymaps in diff view
        keymaps = {
          view = {
            quit = 'q', -- Close diff tab
            toggle_explorer = '<leader>b', -- Toggle explorer visibility (explorer mode only)
            next_hunk = ']c', -- Jump to next change
            prev_hunk = '[c', -- Jump to previous change
            next_file = '<tab>', -- Next file in explorer mode
            prev_file = '<s-tab>', -- Previous file in explorer mode
          },
          explorer = {
            select = '<CR>', -- Open diff for selected file
            hover = 'K', -- Show file diff preview
            refresh = 'R', -- Refresh git status
          },
        },
      }
    end,
  },
  {
    -- Diff against clipboard. Uses vscode diff if available.
    'jake-stewart/diff.nvim',
    cmd = 'Diff',
    opts = {
      -- show a unified diff (single pane)
      unified = false,

      -- either "tab", "above", "below", "left", or "right"
      position = 'below',

      -- show the cursorline within the diff windows
      cursorline = false,
    },
  },
  {
    'chrisgrieser/nvim-spider',
    keys = {
      { 'W', "<cmd>lua require('spider').motion('w')<CR>", mode = { 'n', 'o', 'x' } },
      { 'E', "<cmd>lua require('spider').motion('e')<CR>", mode = { 'n', 'o', 'x' } },
      { 'B', "<cmd>lua require('spider').motion('b')<CR>", mode = { 'n', 'o', 'x' } },
    },
  },
  {
    -- Colorize color code.
    -- :ColorizeAttachToBuffer
    'norcalli/nvim-colorizer.lua',
  },
  {
    -- Enable coloring for logs.
    -- :AnsiEnable
    '0xferrous/ansi.nvim',
    config = function()
      require('ansi').setup {
        auto_enable = true, -- Auto-enable for configured filetypes
        filetypes = { 'log', 'ansi' }, -- Filetypes to auto-enable
      }
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^9', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  -- {
  --   'hat0uma/csvview.nvim',
  --   ---@module "csvview"
  --   ---@type CsvView.Options
  --   opts = {
  --     parser = { comments = { '#', '//' } },
  --     keymaps = {
  --       -- Text objects for selecting fields
  --       textobject_field_inner = { 'if', mode = { 'o', 'x' } },
  --       textobject_field_outer = { 'af', mode = { 'o', 'x' } },
  --       -- Excel-like navigation:
  --       -- Use <Tab> and <S-Tab> to move horizontally between fields.
  --       -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
  --       -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
  --       jump_next_field_end = { '<Tab>', mode = { 'n', 'v' } },
  --       jump_prev_field_end = { '<S-Tab>', mode = { 'n', 'v' } },
  --       jump_next_row = { '<Enter>', mode = { 'n', 'v' } },
  --       jump_prev_row = { '<S-Enter>', mode = { 'n', 'v' } },
  --     },
  --   },
  --   cmd = { 'CsvViewEnable', 'CsvViewDisable', 'CsvViewToggle' },
  -- },
}
