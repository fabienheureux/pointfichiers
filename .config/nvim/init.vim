"------------------------------------------------------------
" Plugins

filetype off
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
"
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'

Plug 'ayu-theme/ayu-vim'
" Plug 'arcticicestudio/nord-vim'

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:flow#flowpath = '~/.config/fnm/bin/flow'

" Code
let g:jsx_ext_required = 0
let g:ale_fixers = { 'javascript': ['eslint', 'flow', 'prettier'], 'typescript': ['tslint'], 'rust': ['rls', 'rustc', 'cargo'], 'css': ['stylelint'] }

" Limit linters used for JavaScript.
let g:ale_linters = { 'javascript': ['eslint', 'flow'] }
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✕'
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says %s'
let g:javascript_plugin_flow = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Style
syntax on
set t_Co=256
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

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
set number

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

"------------------------------------------------------------
" Netrw
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 15

"------------------------------------------------------------
" fzf
" fzf location
let $FZF_DEFAULT_COMMAND= 'fd --type f --color=always'
let $FZF_DEFAULT_OPTS="--ansi"
set rtp+=/usr/local/opt/fzf
map <C-f> :Files<CR>
map <C-t> :Tags<CR>

"-----------------------------------------------------------
" fuck it options......................
set backspace=indent,eol,start
set encoding=utf-8
