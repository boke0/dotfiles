set laststatus=2
set virtualedit=onemore
set ambiwidth=double
set wildmenu
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
set showmatch matchtime=1
set shiftwidth=2
set softtabstop=2
set tabstop=2
set showmatch
set number
set title
set noswapfile
set nobackup
set noundofile
set autoindent
set smartindent
set smarttab
set nowrap
set list
set autoread
set listchars=tab:>-,trail:-,eol:$,extends:#,precedes:#,nbsp:%

if !has('gui_running')
	set t_Co=256
endif

if has('mac')
	set clipboard+=unnamed
else
	set clipboard^=unnamedplus
endif

filetype plugin on
syntax on

"nnoremap k h
"nnoremap t j
"nnoremap n k
"nnoremap s l
"vnoremap k h
"vnoremap t j
"vnoremap n k
"vnoremap s l
"nnoremap ik <C-w>h
"nnoremap it <C-w>j
"nnoremap in <C-w>k
"nnoremap is <C-w>l
"nnoremap K H
"nnoremap T J
"nnoremap N K
"nnoremap S L

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

call plug#begin()

Plug 'lambdalisue/fern.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'itchyny/lightline.vim'
Plug 'zivyangll/git-blame.vim'
Plug 'github/copilot.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

let mapleader = "\<Space>"
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>u <c-r><CR>
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

"vim-fzfをripgrepと連携させるコード

let g:which_key_map = {}

let g:which_key_map['d'] = {
	\ 'name' : '+diagnosis',
	\ 'D' : [':LspDeclaration', 'Go to declaration'],
	\ 'd' : [':LspDefinition', 'Go to definition'],
	\ 'r' : [':LspReferences', 'Go to references'],
	\ 'h' : [':LspHover', 'Hover expression'],
	\ 'f' : [':LspDocumentFormat', 'Format entire document'],
  \ 's' : [':LspDocumentDiagnostics', 'Show diagnostics'],
	\ }

let g:which_key_map['f'] = {
	\ 'name' : '+find',
	\ 'f' : [':Fern %:h', 'Open finder'],
	\ 'z' : [':Files', 'Open FZF'],
	\ 'r' : [':RG', 'Open FZF+RipGrep'],
	\ }

let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_echo_delay = 50
let g:lsp_diagnostics_highlights_enabled = 1
let g:lsp_diagnostics_highlights_delay = 50
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_delay = 50
let g:lsp_completion_documentation_delay = 40
let g:lsp_document_highlight_delay = 100
let g:lsp_document_code_action_signs_delay = 100
let g:lsp_fold_enabled = 0

let g:fern#disable_default_mappings = 1
let g:fern#default_hidden = 1

function s:init_fern() abort
	nmap <buffer> r <Plug>(fern-action-reload)
	nmap <buffer> l <Plug>(fern-my-open-or-expand)
	nmap <buffer><expr> <Plug>(fern-my-open-or-expand) fern#smart#leaf("<Plug>(fern-action-open)", "<Plug>(fern-action-expand)", "<Plug>(fern-action-enter)")
	nmap <buffer> <Space> <Plug>(fern-action-collapse)
	nmap <buffer> h <Plug>(fern-action-focus:parent)
	nmap <buffer> h <Plug>(fern-action-focus:parent)
	nmap <buffer> H <Plug>(fern-action-leave)
	nmap <buffer> Nf <Plug>(fern-action-new-file)
	nmap <buffer> Nd <Plug>(fern-action-new-dir)
	nmap <buffer> c <Plug>(fern-action-copy)
	nmap <buffer> m <Plug>(fern-action-move)
	nmap <buffer> d <Plug>(fern-action-remove)
endfunction

augroup my-fern
	autocmd! *
	autocmd FileType fern call s:init_fern()
augroup END

call which_key#register('<Space>', "g:which_key_map")
