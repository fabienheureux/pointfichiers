"------------------------------------------------------------
" Plugins
filetype off
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'danro/rename.vim'
" Plug 'zxqfl/tabnine-vim'

call plug#end()

"--- LEGACY 
" Plug 'editorconfig/editorconfig-vim'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'Shougo/deoplete.nvim'
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 10
" let g:deoplete#auto_complete_start_length = 1
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'airblade/vim-gitgutter'


" set rtp+=~/tabnine-vim

"" Basics
" Disable strange Vi defaults.
set nocompatible

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  filetype plugin indent on
endif

" " Enable syntax highlighting.
" if has('syntax')
"   syntax enable
" endif

" Autoindent when starting new line, or using `o` or `O`.
set autoindent

" Allow backspace in insert mode.
set backspace=indent,eol,start

" Use 'shiftwidth' when using `<Tab>` in front of a line.
" By default it's used only for shift commands (`<`, `>`).
set smarttab

" Disable octal format for number processing.
set nrformats-=octal

" Allow for mappings including `Esc`, while preserving
" zero timeout after pressing it manually.
" (it only nvim needs fixing this)
if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

" Enable highlighted case-insensitive incremential search.
set incsearch

" Indent using two spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" Show the line and column number of the cursor position.
set ruler

" Force utf-8 encoding
set encoding=utf-8

"" Code linting / fixing / language support
let g:jsx_ext_required = 0
let g:ale_fixers = {
	\ 'javascript': ['prettier'],
	\ 'typescript': ['tsserver'],
	\ 'rust': ['rls'],
	\ 'python': ['autopep8'],
	\ 'css': ['stylelint'],
  \ 'scss': ['stylelint']
\}


"" Extras 
" automatically refresh on change
set autoread

" autoreload vimrc
autocmd! BufWritePost init.vim,.vimrc source %

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

syntax enable

set number
set autochdir

" Disable swap to prevent annoying messages.
set noswapfile

" Highlight line under cursor. It helps with navigation.
set cursorline

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" Wrap lines by default
set wrap linebreak
set showbreak=" "

" Do not fold by default. But if, do it up to 3 levels.
set foldmethod=indent
set foldnestmax=3
set nofoldenable

"" Statusline
set laststatus=2
set statusline=
set statusline+=\ %l
set statusline+=\ %*
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ ››
set statusline+=\ %m
set statusline+=\ %F
set statusline+=%=
set statusline+=\ ‹‹
set statusline+=\ %{coc#status()}
" set statusline+=\ %{strftime('%R', getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*

" Enable mouse for scrolling and window resizing.
set mouse=a

"" Buffers
" Hide buffers instead of asking if to save them.
set hidden

"" Search
set ignorecase
set smartcase

"" Copy
vmap <C-Space> "ay
nmap <C-Space> "aP
imap <C-Space> <C-o>"ap
nmap <C-c> "ayiw

" Enable saving by `Ctrl-s`
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

"" fzf
map <C-f> :Files<CR>
map <C-t> :Tags<CR>
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"" Netrw
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 15

"" Colors 
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
set termguicolors
let base16colorspace=256
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE
