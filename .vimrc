" Zoltan's vim config
" http://dougblack.io/words/a-good-vimrc.html
"
" initialize pathogen
execute pathogen#infect()

" The leader key
let mapleader=","

" vim-scriptease - https://github.com/tpope/vim-scriptease
" vim-sensible - https://github.com/tpope/vim-sensible
" emmet.vim
runtime bundle/emmet-vim/plugin/emmet.vim
runtime bundle/vim-scriptease/plugin/scriptease.vim
runtime bundle/vim-sensible/plugin/sensible.vim

" Load plugin files and turn on indentation:
" Sensible implements
filetype plugin indent on

" Color - sensible implements
syntax enable
" colorscheme Tomorrow-Night
" https://github.com/sjl/badwolf/
colorscheme badwolf
" colorscheme goodwolf

" Guifont
if has('gui_running')
  set guifont=Menlo\ Regular:h16
  set guioptions+=c "Stop opening dialogs
endif

" Default size - don't really need this, because limit the lines
" set lines=40 columns=90
" A colored column
set colorcolumn=90
set cursorline " highlight current line
" Show line numbers
set number

set showcmd " show command in bottom bar

set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to

" Mouse activated
set mouse=a
" Save file when focus lost
:au FocusLost * :wa

set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=2 " number of spaces inserted indentation

set noerrorbells
set nobackup
set noswapfile

" Default split is right and below.
set splitright
set splitbelow

" Reload vim configuration
" map <leader>s :source ~/.vimrc<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

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
" turn off search highligh
nnoremap <Leader><Space> :nohlsearch<CR>

" switch between two files
nnoremap <Leader><Leader> :e#<CR>

" Show matching parenthesis
set showmatch

" xml files will be formatted with xmllint
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" Folding
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent " fold based on indent level

" Remap :
nnoremap ; :
" jk is escape
inoremap jk <esc>

" move to beginning/end of line
nnoremap B ^
nnoremap E $
" Changing cursor shape in different modes
" iTerm2
if $TERM_PROGRAM =~ "iTerm"
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" highlight last inserted text
nnoremap gV `[v`]

" Jumping between parenthesis, use %
" Use [{ for jumping back
" Use gd for local declaration.

" CTRL-N auto compleat.
" Record macro: qa -> record in register 'a', finish with type q again.
" Repeate macro: @a

" Install silver searcher
" https://github.com/ggreer/the_silver_searcher
" brew install the_silver_searcher
" Download ag.vim
" cd ~/.vim/bundle && git clone https://github.com/rking/ag.vim ag && echo
" "set runtimepath^=~/.vim/bundle/ag" >> ~/.vimrc
set runtimepath^=~/.vim/bundle/ag
nnoremap <leader>a :Ag<space>

" Load ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

let g:ctrlp_prompt_mappings = {
      \ 'PrtBS()':              ['<bs>', '<c-]>'],
      \ 'PrtDelete()':          ['<del>'],
      \ 'PrtDeleteWord()':      ['<c-w>'],
      \ 'PrtClear()':           ['<c-u>'],
      \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
      \ 'PrtSelectMove("k")':   ['<c-i>', '<up>'],
      \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
      \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
      \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
      \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
      \ 'PrtHistory(-1)':       ['<c-n>'],
      \ 'PrtHistory(1)':        ['<c-p>'],
      \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
      \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
      \ 'AcceptSelection("t")': ['<c-t>'],
      \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
      \ 'ToggleFocus()':        ['<s-tab>'],
      \ 'ToggleRegex()':        ['<c-r>'],
      \ 'ToggleByFname()':      ['<c-d>'],
      \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
      \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
      \ 'PrtExpandDir()':       ['<tab>'],
      \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
      \ 'PrtInsert()':          ['<c-\>'],
      \ 'PrtCurStart()':        ['<c-a>'],
      \ 'PrtCurEnd()':          ['<c-e>'],
      \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
      \ 'PrtCurRight()':        ['<c-l>', '<right>'],
      \ 'PrtClearCache()':      ['<F5>'],
      \ 'PrtDeleteEnt()':       ['<F7>'],
      \ 'CreateNewFile()':      ['<c-y>'],
      \ 'MarkToOpen()':         ['<c-z>'],
      \ 'OpenMulti()':          ['<c-o>'],
      \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
      \ }

" toggle between number and relativenumber
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

" strips trailing whitespace at the end of files.
function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call
  cursor(l, c)
endfunction

" NERDTree
map <leader>n :NERDTreeFind<cr>
map <leader>nn :NERDTreeToggle<cr>
" Show hidden file as default
let g:NERDTreeShowHidden=1
"

" Setup shortcuts for jumping between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-i> <C-w>k
map <C-l> <C-w>l

" vim-javascript https://github.com/pangloss/vim-javascript

" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1


" Handlebar, mustache support
" git clone git://github.com/mustache/vim-mustache-handlebars.git bundle/mustache
" mustache abbreviation on
let g:mustache_abbreviations = 1

" Polyglot - syntax highlighting
" https://github.com/sheerun/vim-polyglot

" Fugitive.vim
" https://github.com/tpope/vim-fugitive

" HTML5
" https://github.com/othree/html5.vim

" Surround
" https://github.com/tpope/vim-surround

" Syntastic
" https://github.com/scrooloose/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline
" https://github.com/bling/vim-airline
" https://github.com/vim-airline/vim-airline-themes
let g:airline#extensions#tabline#enabled = 1

" EditorConfig vim https://github.com/editorconfig/editorconfig-vim.git
"
" TODO:
" - VIM for Javascript: vim-javascript
" - Handlebar
" - Ruby on Rails
" - Git support
"
" Great link: http://vimawesome.com/
"
" vim:foldmethod=marker:foldlevel=0
