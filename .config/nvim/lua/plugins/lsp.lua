return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'nvimtools/none-ls.nvim',
    'jay-babu/mason-null-ls.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup()

    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {}
      end
    }

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      update_in_insert = false,
      virtual_text = {
        format = function(diagnostic)
          return string.format("%s (%s: %s)", diagnostic.message, diagnostic.source, diagnostic.code)
        end,
      },
    })
  end
}
