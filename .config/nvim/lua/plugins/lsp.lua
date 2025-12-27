return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'mason-org/mason.nvim', version="^2.1.0"},
      {'mason-org/mason-lspconfig.nvim', version="^2.1.0"},
      'nvimtools/none-ls.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
		config = function()
			require('mason').setup()
			require('mason-lspconfig').setup()
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
