" Zoltan's vim config

"
" initialize pathogen
execute pathogen#infect()

" vim-scriptease - https://github.com/tpope/vim-scriptease
" vim-sensible - https://github.com/tpope/vim-sensible
" emmet.vim
runtime bundle/emmet-vim/plugin/emmet.vim
runtime bundle/vim-scriptease/plugin/scriptease.vim
runtime bundle/vim-sensible/plugin/sensible.vim


" Load plugin files and turn on indentation:
" Sensible implements
" filetype plugin indent on

" Color - sensible implements
" syntax on
colorscheme Tomorrow-Night

" Guifont
if has('gui_running')
  set guifont=Menlo\ Regular:h16
  set guioptions+=c "Stop opening dialogs
endif

" Default size - don't really need this, because limit the lines
" set lines=40 columns=90
" A colored column
set colorcolumn=90
" Show line numbers
set number

" The leader key
let mapleader=","
" Remap :
nnoremap ; :

" Mouse activated
set mouse=a
" Save file when focus lost
:au FocusLost * :wa

set tabstop=2
set noerrorbells
set nobackup
set noswapfile

" Reload vim configuration
map <leader>s :source ~/.vimrc<CR>

" Speed up vim
set hidden
" set history=100

" Remove white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Highlight search
set hlsearch
" Turn off highlight :noh
" Show the frist match while still typing
set incsearch


" switch between two files
nnoremap <Leader><Leader> :e#<CR>

" Show matching parenthesis
set showmatch

" xml files will be formatted with xmllint
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Jumping between parenthesis, use %
" Use [{ for jumping back
" Use gd for local declaration.

" CTRL-N auto compleat.
" Record macro: qa -> record in register 'a', finish with type q again.
" Repeate macro: @a
