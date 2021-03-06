" based on sensible.vim
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'chriskempson/base16-vim'

"Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
"Plugin 'rodjek/vim-puppet'

Plugin 'vimwiki/vimwiki'

Plugin 'godlygeek/tabular'

"Plugin 'davidhalter/jedi-vim'
"Plugin 'ternjs/tern_for_vim'

"Plugin 'mrtazz/DoxygenToolkit.vim'
"Plugin 'heavenshell/vim-pydocstring'
"Plugin 'tell-k/vim-autopep8'
Plugin 'w0rp/ale'

Plugin 'tpope/vim-sleuth'
Plugin 'majutsushi/tagbar'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
  " Plugin 'gabrielelana/vim-markdown'
  " Plugin 'Shougo/deoplete.nvim'
  " Plugin 'roxma/nvim-yarp'
  " Plugin 'roxma/vim-hug-neovim-rpc'
  " Plugin 'zchee/deoplete-jedi'
"  Plugin 'scrooloose/syntastic'

call vundle#end()

" Use :help 'option' to see the documentation for the given option.

let mapleader = "\<space>"

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set ignorecase
set smartcase
set incsearch
set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set scrolloff=3
set sidescrolloff=5
set display+=lastline

set splitright

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set autoread
set fileformats+=mac

set history=1000
set tabpagemax=50
if !has('nvim')
  set viminfo='10,\"100,:20,%,n~/.viminfo
else
  set viminfo='10,\"100,:20,%
endif

set hidden

set number
set cursorline
set colorcolumn=100

set tabstop=4
set shiftwidth=4
set expandtab

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

inoremap <C-U> <C-G>u<C-U>

let base16colorspace=256
colorscheme base16-default-dark
set background=dark

au BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd Filetype mail setlocal textwidth=80
autocmd Filetype text setlocal textwidth=80
autocmd Filetype help setlocal nospell
autocmd Filetype gitcommit setlocal textwidth=72
autocmd Filetype markdown setlocal textwidth=80
au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.vim/bin/diary-template.py '%'

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    normal! z.
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

let g:tex_flavor = "latex"
let g:airline#extensions#tabline#enabled = 1
let g:ctrlp_cmd = 'CtrlPBuffer'



if has('gui_running')
  set statusline+=%#warningmsg#
  set statusline+=%*
  set guioptions-=r
  set guioptions-=L
  set guioptions-=m
  set guioptions-=T
  set guioptions-=e

endif

nmap <C-y> <C-W>W
nmap <Del> :TagbarClose<cr> :bd<cr>
nmap <Leader>t <C-^>
nmap <BS> <C-^>

runtime! ftplugin/man.vim
"nnoremap K :Man <cword><cr>
nmap <F8> :TagbarToggle<CR>

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"


"let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = "2"
"let g:jedi#popup_select_first = 0
"let g:EasyMotion_do_mapping = 0
let g:tagbar_type_javascript = {
    \ 'ctagsbin' : '/home/douwe/node_modules/.bin/jsctags'
    \ }

nnoremap <Leader>o :CtrlPBuffer<CR>
nnoremap <Leader>r "_diwP
"nnoremap <Leader>w :w<CR>
"nnoremap <Leader>b :w<CR> :silent make\|redraw!<CR>
"nnoremap <Leader>f :lnext<CR>
"nnoremap <Leader>F :ll<CR>
nnoremap <Leader>= :%!python -m json.tool<CR>

nmap <leader>s <Plug>(easymotion-s)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

nnoremap <leader>cst :setl tabstop=2 shiftwidth=2 expandtab<cr>
nnoremap <leader>csp :setl tabstop=4 shiftwidth=4 expandtab<cr>
nnoremap <leader>csl :setl tabstop=8 shiftwidth=8 noexpandtab<cr>

"vimwiki
nmap <C-j> <Plug>VimwikiNextLink
nmap <C-k> <Plug>VimwikiPrevLink
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

imap <F5> <C-R>=strftime("%Y%m%d%H%M")<CR>
imap <F6> <C-R>=strftime("%A %d %B %Y")<CR>

set tags=./tags;
let g:ale_sign_column_always = 1

" vim:set ft=vim et sw=2:
