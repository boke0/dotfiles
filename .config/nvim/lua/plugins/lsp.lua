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

    vim.g.lsp_diagnostics_echo_cursor = 1
    vim.g.lsp_diagnostics_echo_delay = 50
    vim.g.lsp_diagnostics_highlights_enabled = 1
    vim.g.lsp_diagnostics_highlights_delay = 50
    vim.g.lsp_diagnostics_highlights_insert_mode_enabled = 0
    vim.g.lsp_diagnostics_signs_enabled = 1
    vim.g.lsp_diagnostics_signs_insert_mode_enabled = 0
    vim.g.lsp_diagnostics_virtual_text_enabled = 0
    vim.g.lsp_diagnostics_virtual_text_delay = 50
    vim.g.lsp_completion_documentation_delay = 40
    vim.g.lsp_document_highlight_delay = 100
    vim.g.lsp_document_code_action_signs_delay = 100
    vim.g.lsp_fold_enabled = 0
  end
}
