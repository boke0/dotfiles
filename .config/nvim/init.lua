vim.o.fenc="utf-8"
vim.o.backup=false
vim.o.swapfile=false
vim.o.autoread=true
vim.o.hidden=true
vim.o.showcmd=true
vim.o.number=true
vim.o.virtualedit="onemore"
vim.o.smartindent=true
vim.o.showmatch=true
vim.o.laststatus=2
vim.o.wildmode="list:longest"
vim.o.wrap=false


vim.o.listchars="tab:>-"
vim.o.expandtab=true
vim.o.tabstop=4
vim.o.shiftwidth=4
vim.o.ignorecase=true
vim.o.smartcase=true
vim.o.incsearch=true
vim.o.wrapscan=true
vim.o.hlsearch=true
vim.o.clipboard="unnamedplus"
vim.o.background='dark'
vim.o.imdisable=true
vim.o.encoding='UTF-8'
vim.o.mouse=false

vim.g.mapleader=" "

opt_ns = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opt_ns)
vim.api.nvim_set_keymap('n', '<Leader>R', '<cmd>lua vim.lsp.buf.rename()<CR>', opt_ns)
vim.api.nvim_set_keymap('n', '<Leader>N', '<cmd>lua vim.lsp.buf.references<CR>', opt_ns)
vim.api.nvim_set_keymap('n', '<Leader>s', '<cmd>lua vim.diagnostic.open_float()<CR>', opt_ns)
vim.api.nvim_set_keymap('n', '[s', '<cmd>lua vim.lsp.buf.diagnostic.goto_prev()<CR>', opt_ns)
vim.api.nvim_set_keymap('n', ']s', '<cmd>lua vim.lsp.buf.diagnostic.goto_next()<CR>', opt_ns)
vim.api.nvim_set_keymap('n', '<Leader>F', '<cmd>lua vim.lsp.buf.format()<CR>', opt_ns)


vim.api.nvim_set_keymap('n', 'sh', '<C-w>h', opt_ns)
vim.api.nvim_set_keymap('n', 'sj', '<C-w>j', opt_ns)
vim.api.nvim_set_keymap('n', 'sk', '<C-w>k', opt_ns)
vim.api.nvim_set_keymap('n', 'sl', '<C-w>l', opt_ns)
vim.api.nvim_set_keymap('n', '<Leader>u', '<C-r>', opt_ns)

opt_n = { noremap = true, silent = false }

vim.api.nvim_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.declaration()<CR>', opt_n)
vim.api.nvim_set_keymap('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>', opt_n)
vim.api.nvim_set_keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.references()<CR>', opt_n)

vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', opt_n)
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', opt_n)
vim.api.nvim_set_keymap('n', '<Leader>n', ':nohlsearch<CR><ESC>', opt_n)
vim.api.nvim_set_keymap('n', '<Leader>f', ':Fern . -reveal=%<CR>', opt_n)

require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'cocopon/iceberg.vim'
    use 'sheerun/vim-polyglot'
    use 'ryanoasis/vim-devicons'
    use 'vim-airline/vim-airline'
    use 'jiangmiao/auto-pairs'
    use 'terryma/vim-multiple-cursors'
    use 'nvim-lua/plenary.nvim'
    use 'vim-denops/denops.vim'
    use {
        'matsui54/denops-popup-preview.vim',
        config = function()
            vim.cmd("call popup_preview#enable()")
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            vim.api.nvim_set_keymap('n', '<Leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opt_n)
            vim.api.nvim_set_keymap('n', '<Leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opt_n)
            vim.api.nvim_set_keymap('n', '<Leader>fb', '<cmd>lua require("telescope.builtin").buffers()<CR>', opt_n)
            vim.api.nvim_set_keymap('n', '<Leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opt_n)
            vim.api.nvim_set_keymap('n', '<Leader>fd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opt_n)
        end
    }
    use {
        'williamboman/mason.nvim',
        config = function()
            require("mason").setup()
        end
    }
    use {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup()
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config=function()
            require'lspconfig'.tsserver.setup{
                cmd = { "typescript-language-server", "--stdio" }
            }
        end
    }
    use 'dracula/vim'
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                mapping = {
                    ["<C-y>"] = cmp.mapping.complete(),
                    ["<C-c>"] = cmp.mapping.close(),
                    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    })
                },
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                }, {
                    { name = "buffer" },
                })
            })
        end
    }
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/cmp-buffer"

    use "hrsh7th/vim-vsnip"
    
    use {
        "tomtom/tcomment_vim",
        config = function()
        end
    }

    use {
        "mfussenegger/nvim-dap",
        config = function()
            vim.api.nvim_set_keymap('n', '<Leader>b', '<cmd>lua require("dap").toggle_breakpoint()<CR>', opt_n)
            vim.api.nvim_set_keymap('n', '<Leader>dc', '<cmd>lua require("dap").continue()<CR>', opt_n)
            vim.api.nvim_set_keymap('n', '<Leader>dd', '<cmd>lua require("dapui").toggle()<CR>', opt_n)
            vim.api.nvim_set_keymap('n', '<Leader>dgt', '<cmd>lua require("dap-go").debug_test()<CR>', opt_n)
        end
    }
    use "mfussenegger/nvim-dap-ui"
    use "leoluz/nvim-dap-go"
    use "theHamsta/nvim-dap-virtual-text"
    use {
        "ferrine/md-img-paste.vim",
        config = function()
            vim.g['mdip_imgdir_absolute'] = 'public/assets/'
            vim.api.nvim_set_keymap('n', '<Leader>p', ':call mdip#MarkdownClipboardImage()<CR>', opt_n)
        end
    }
    use {
        "onsails/diaglist.nvim",
        config = function()
            require("diaglist").init({
                debug = false,
                debounce_ms = 150,
            })
            vim.api.nvim_set_keymap('n', '<Leader>dw', '<cmd>lua require("diaglist").open_all_diagnostics()<CR>', opt_n)
        end
    }
    use "pantharshit00/vim-prisma"
    use "github/copilot.vim"
    use "lambdalisue/fern.vim"
    use "f-person/git-blame.nvim"

    vim.cmd("colorscheme dracula")
end)

vim.opt.completeopt = "menu,menuone,noselect"
