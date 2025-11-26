return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'williamboman/mason.nvim', version="^1.0.0"},
      {'williamboman/mason-lspconfig.nvim', version="^1.0.0"},
      'nvimtools/none-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
		event = { "BufReadPre", "BufNewFile" },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup()

      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,
        ['eslint'] = function()
          require('lspconfig').eslint.setup {
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end,
            settings = {
              workingDirectory = { mode = 'auto' },
              useESLintClass = true,
            },
          }
        end,
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
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      'hrsh7th/vim-vsnip',
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          -- { name = "buffer" },
          -- { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ['<C-l>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
        }),
        experimental = {
          ghost_text = true,
        },
      })
    end
  }
}
