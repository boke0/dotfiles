return {
  {
    'lambdalisue/fern.vim',
    opts = {},
    config = function()
      vim.g['fern#disable_default_mappings'] = 1
      vim.g['fern#default_hidden'] = 1

      vim.api.nvim_create_augroup('my-fern', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        group = 'my-fern',
        pattern = 'fern',
        callback = function ()
          vim.keymap.set('n', 'r', '<Plug>(fern-action-reload)', { buffer = true })
          vim.keymap.set('n', 'l', '<Plug>(fern-action-open-or-expand)', { buffer = true })
          vim.keymap.set('n', '<expr>', '<Plug>(fern-open-or-expand) fern#smart#leaf("<Plug>(fern-action-open)", "<Plug>(fern-action-expand)", "<Plug>(fern-action-enter)")', { buffer = true })
          vim.keymap.set('n', '<Space>', '<Plug>(fern-action-collapse)', { buffer = true })
          vim.keymap.set('n', 'h', '<Plug>(fern-action-focus:parent)', { buffer = true })
          vim.keymap.set('n', 'H', '<Plug>(fern-action-leave)', { buffer = true })
          vim.keymap.set('n', 'Nf', '<Plug>(fern-action-new-file)', { buffer = true })
          vim.keymap.set('n', 'Nd', '<Plug>(fern-action-new-dir)', { buffer = true })
          vim.keymap.set('n', 'c', '<Plug>(fern-action-copy)', { buffer = true })
          vim.keymap.set('n', 'm', '<Plug>(fern-action-move)', { buffer = true })
          vim.keymap.set('n', 'd', '<Plug>(fern-action-remove)', { buffer = true })
        end
      })
    end
  },
  {
    'junegunn/fzf',
    dependencies = {
      'junegunn/fzf.vim',
    },
    config = function()
			if vim.fn.exists('fzf#run') == 0 then
				vim.fn['fzf#install']()
			end
    end
  },
}
