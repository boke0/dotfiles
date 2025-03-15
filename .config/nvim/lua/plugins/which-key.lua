return {
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>d', group = '+diagnosis' },
        { '<loeader>dD', ':LspDeclaration<CR>', desc = 'Go to declaration' },
        { '<leader>dd', ':LspDefinition<CR>', desc = 'Go to definition' },
        { '<leader>dr', ':LspReferences<CR>', desc = 'Go to references' },
        { '<leader>dh', ':LspHover<CR>', desc = 'Hover expression' },
        { '<leader>df', ':LspDocumentFormat<CR>', desc = 'Format entire document'},
        { '<leader>ds', ':LspDocumentDiagnostics<CR>', desc = 'Show diagnostics' },
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
