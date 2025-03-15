return {
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>d', group = '+diagnosis' },
        { '<leader>dd', ':lua vim.lsp.buf.definition()<CR>', desc = 'Go to definition' },
        { '<leader>dr', ':lua vim.lsp.buf.references()<CR>', desc = 'Go to references' },
        { '<leader>dh', ':lua vim.lsp.buf.hover()<CR>', desc = 'Hover expression' },
        { '<leader>df', ':lua vim.lsp.buf.format()<CR>', desc = 'Format entire document'},
        { '<leader>ds', ':lua vim.diagnostic.setloclist()<CR>', desc = 'Show diagnostics' },
        { '<leader>f', group = '+find' },
        { '<leader>ff', ':<C-u>Fern %:h<CR>', group = 'Open finder' },
        { '<leader>fz', ':Files<CR>', group = 'Open FZF' },
        { '<leader>fr', ':RG<CR>', group = 'Open FZF+RipGrep' },
        { '<leader>a', group = '+avante' },
        { '<leader>aa', ':AvanteAsk<CR>', desc = 'Ask for Avante' },
        { '<leader>at', ':AvanteToggle<CR>', desc = 'Toggle the Avante sidebar' },
        { '<leader>ar', ':AvanteRefresh<CR>', desc = 'Refresh Avante sidebar' },
        { '<leader>a?', ':AvanteSwitchProvider<CR>', desc = 'Select model for Avante' },
        { '<leader>af', ':AvanteFocus<CR>', desc = 'Switch sidebar focus' },
        { '<leader>ae', ':AvanteEdit<CR>', desc = 'Edit selected blocks' },
        { '<leader>n', ':noh<CR>', desc = 'Clear highlight' },
        { '<leader>u', '<C-r><CR>', desc = 'Redo' }
      })
    end
  }
}
