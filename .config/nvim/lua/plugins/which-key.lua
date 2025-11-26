return {
  {
    'folke/which-key.nvim',
    opts = {},
    config = function()
      local wk = require('which-key')
      wk.add({
        { '<leader>d',   group = '+diagnosis' },
        { '<leader>dd',  ':lua vim.lsp.buf.definition()<CR>',    desc = 'Go to definition' },
        { '<leader>dr',  ':lua vim.lsp.buf.references()<CR>',    desc = 'Go to references' },
        { '<leader>dh',  ':lua vim.lsp.buf.hover()<CR>',         desc = 'Hover expression' },
        { '<leader>df',  ':lua vim.lsp.buf.format()<CR>',        desc = 'Format entire document' },
        { '<leader>ds',  ':lua vim.diagnostic.setloclist()<CR>', desc = 'Show diagnostics' },
        { '<leader>f',   group = '+find' },
        { '<leader>ff',  ':<C-u>Fern %:h<CR>',                   group = 'Open finder' },
        { '<leader>fz',  ':Files<CR>',                           group = 'Open FZF' },
        { '<leader>fr',  ':RG<CR>',                              group = 'Open FZF+RipGrep' },
        { '<leader>n',   ':noh<CR>',                             desc = 'Clear highlight' },
        { '<leader>u',   '<C-r><CR>',                            desc = 'Redo' },
        { '<leader>g', group = '+github' },
        { '<leader>gt', ':CopilotChatToggle<CR>', desc = 'Toggle chat window' },
        { '<leader>gc', ':CopilotChatClose<CR>', desc = 'Close chat window' },
        { '<leader>go', ':CopilotChatOpen<CR>', desc = 'Open chat window' },
        { '<leader>gs', ':CopilotChatStop<CR>', desc = 'Stop current output' },
        { '<leader>gr', ':CopilotChatReset<CR>', desc = 'Reset chat window' },
        { '<leader>gm', ':CopilotChatModels<CR>', desc = 'List available models' },
        { '<leader>ga', ':CopilotChatAgents<CR>', desc = 'List available agents' },
        {
          '<leader>l',
          function()
            vim.lsp.stop_client(vim.lsp.get_active_clients())
            vim.cmd("edit")
          end,
          desc = 'Reload LSP Client'
        }
      })
    end
  }
}
