"------------------------------------------------------------
" Plugins
filetype off
call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'w0rp/ale'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 10
let g:deoplete#auto_complete_start_length = 1
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
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
	\ 'css': ['stylelint']
\}
let g:ale_linters = {
	\ 'javascript': ['eslint', 'flow'],
	\ 'cs': ['Omnisharp'],
	\ 'python': ['autopep8']
\}
let g:ale_completion_enable = 0
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says %s'
let g:javascript_plugin_flow = 1
let g:OmniSharp_server_path = '/mnt/c/Users/fabie/.omnisharp/omnisharp-roslyn/OmniSharp.exe'
let g:OmniSharp_translate_cygwin_wsl = 1
let g:OmniSharp_port = 2000

"------------------------------------------------------------
" Autocompletion
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"------------------------------------------------------------
" Sexiness
" set termguicolors
"  if has('nvim')
"  	 set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" endif

syntax enable
let base16colorspace=256  " Access colors present in 256 colorspace
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
colorscheme base16-default-dark

" ------------------------------------------------------------
"  Buffers
set hidden

" ------------------------------------------------------------
" Statusline

" Function: display errors from Ale in statusline
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? '' : printf(
   \ 'W:%d E:%d',
   \ l:all_non_errors,
   \ l:all_errors
   \)
endfunction
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
set statusline+=\ %{LinterStatus()}
set statusline+=\ ‹‹
" set statusline+=\ %{strftime('%R', getftime(expand('%')))}
set statusline+=\ ::
set statusline+=\ %n
set statusline+=\ ››\ %*


"------------------------------------------------------------
" Search options {{{1
set ignorecase
set smartcase

"------------------------------------------------------------
" Visual options {{{1
set number relativenumber

"------------------------------------------------------------
" Swap files
" set backupdir=~/.config/nvim/backup//
" set directory=~/.config/nvim/swap//
" set undodir=~/.config/nvim/undo//

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

"-----------------------------------------------------------
" Nerdtree-like
map <C-n> :Lexplore<CR>
" Enforce all netrw buffer to close, fucking annoying issue
autocmd FileType netrw setl bufhidden=delete
" map <C-n> :NERDTreeToggle<CR>

"------------------------------------------------------------
" Netrw
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 15

"------------------------------------------------------------
" fzf
" fzf location
" let $FZF_DEFAULT_COMMAND="fd --type file --color=always"
" let $FZF_DEFAULT_OPTS="--ansi"
" let $FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
map <C-f> :Files<CR>
map <C-t> :Tags<CR>

" automatically refresh on change
set autoread

" autoreload vimrc
autocmd! BufWritePost init.vim,.vimrc source %

"-----------------------------------------------------------
" fuck it options......................
set backspace=indent,eol,start
set encoding=UTF-8
