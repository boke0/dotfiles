vim.o.laststatus = 2
vim.o.ambiwidth = "double"
vim.o.wildmenu = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.matchtime = 1
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.showmatch = true
vim.o.number = true
vim.o.title = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = false
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.wrap = false
vim.o.list = true
vim.o.autoread = true
vim.o.expandtab = true
vim.o.listchars = "tab:>-,trail:-,eol:$,extends:#,precedes:#,nbsp:%"
vim.o.clipboard = "unnamedplus"

require('config.lazy')

if not vim.fn.has('gui_running') then
  vim.o.t_Co = 256
end

if vim.fn.has('mac') then
  vim.o.clipboard = vim.o.clipboard .. "unnamed"
end

vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_var('mapleader', " ")
