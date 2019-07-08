"------------------------------------------------------------
" Plugins
filetype off
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
" Plug 'editorconfig/editorconfig-vim'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'sheerun/vim-polyglot'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'w0rp/ale'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Plug 'OmniSharp/omnisharp-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim'
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 10
" let g:deoplete#auto_complete_start_length = 1
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

Plug 'junegunn/goyo.vim'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'

call plug#end()

"------------------------------------------------------------
" Code linting / fixing / language support
let g:jsx_ext_required = 0
let g:ale_fixers = {
	\ 'javascript': ['eslint', 'flow', 'prettier'],
	\ 'typescript': ['tslint', 'tsserver'],
	\ 'rust': ['rls', 'rustc', 'cargo'],
	\ 'python': ['autopep8'],
	\ 'css': ['stylelint'],
  \ 'scss': ['stylelint']
\}
" let g:ale_linters = {
" 	\ 'javascript': ['eslint', 'flow'],
" 	\ 'cs': ['Omnisharp'],
" 	\ 'python': ['autopep8']
" \}
" let g:ale_completion_enable = 1
" let g:ale_statusline_format = ['X %d', '? %d', '']
" let g:ale_echo_msg_format = '%linter% says %s'
" let g:javascript_plugin_flow = 1
" let g:OmniSharp_server_path = '/mnt/c/Users/fabie/.omnisharp/omnisharp-roslyn/OmniSharp.exe'
" let g:OmniSharp_translate_cygwin_wsl = 1
" let g:OmniSharp_port = 2000


"------------------------------------------------------------
" Gutentags
" set statusline+=%{gutentags#statusline()}
" let g:gutentags_project_root = ['Makefile', 'Pipfile', 'package.json']

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"------------------------------------------------------------
" Sexiness

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
syntax enable
set termguicolors
let base16colorspace=256
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE
set number

" ------------------------------------------------------------

" Statusline



" Function: display errors from Ale in statusline
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
" set statusline+=\ %{strftime('%R', getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*





" ------------------------------------------------------------
"  Buffers
set hidden

"------------------------------------------------------------
" Search options {{{1
set ignorecase
set smartcase

"------------------------------------------------------------
" Indentation options {{{1
set shiftwidth=4
set tabstop=4
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0

" python-specific indentation
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"------------------------------------------------------------
" Netrw
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 15

" automatically refresh on change
set autoread

" autoreload vimrc
autocmd! BufWritePost init.vim,.vimrc source %

"-----------------------------------------------------------
" fuck it options......................
set backspace=indent,eol,start
set encoding=UTF-8
