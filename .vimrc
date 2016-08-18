" vim: set sw=4 ts=4 sts=4 et tw=78
" Zoltan's vim config

set nocompatible          " Must be first line
execute pathogen#infect()

let mapleader=","


filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"""""""""
" LEADER
"""""""""

" Update ctags
noremap <Leader>T :!tag-generator<CR>
" Switch between two files
nnoremap <Leader>g :e#<CR>
" Save file
noremap <Leader>s :update<CR>

"""""""""
" THEME
"""""""""

" Color - sensible implements
syntax enable
set background=dark
" Need this for iTerm, otherwise colors would be mixed
let g:solarized_termcolors=256
colorscheme solarized

set list " Shows a dot when typed

" Guifont
if has('gui_running')
    set guifont=Meslo\ LG\ S\ for\ Powerline:h17
    set guioptions+=c "Stop opening dialogs
endif

function! s:initialize_powerline() abort
  if !has('nvim')
    let major_version = pyenv#python#get_internal_major_version()
    python3 from powerline.vim import setup as powerline_setup
    python3 powerline_setup()
    python3 del powerline_setup
  endif
endfunction

augroup vim_pyenv_custom_augroup
  autocmd! *
  autocmd User vim-pyenv-activate-post   call s:initialize_powerline()
  autocmd User vim-pyenv-deactivate-post call s:jedi_auto_force_py_version()
augroup END

set cursorline " Highlight current line
set number     " Show line numbers
set relativenumber
set showcmd    " Show command in bottom bar
set wildmenu   " Visual autocomplete for command menu
set lazyredraw " Redraw only when we need to

" Mouse activated
set mouse=a
set mousehide
set ttymouse=xterm2

scriptencoding utf-8

" Save file when focus lost
augroup auto_save
  " autocmd! *
  au FocusLost * :wa
  au CursorHoldI * :wa
  au CursorHold,InsertLeave * :wa
augroup END

set autoread

"markdown
"https://github.com/suan/vim-instant-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" autosave when switch to a tmux pane
let g:tmux_navigator_save_on_switch = 1

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

set autowrite " Automatically write when leaving a buffer

set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=2 " number of spaces inserted indentation

set noerrorbells
set nobackup
set noswapfile

set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character

set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" Restore cursor position
function! ResCur()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" Default split is right and below.
set splitright
set splitbelow

set showmode

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp .zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Speed up vim
set hidden
set history=100

" Remove white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" =============
"     SEARCH
" =============

" Highlight search
set hlsearch
" Turn off highlight :noh
" Show the frist match while still typing
set incsearch
" turn off search highligh
nnoremap <Leader><Space> :nohlsearch<CR>

" small is case insensitive
set smartcase
set ignorecase

" Show matching parenthesis
set showmatch

" Setup ack as the default grep
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

" ================
"   FILE FORMATS
" ================
" xml files will be formatted with xmllint
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

" =============
"    FOLDING
" =============
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent " fold based on indent level

" Set list shows invisible chars
" set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" Remap :
nnoremap ; :
" jk is escape
inoremap jk <esc>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" ===============
"   CURSOR SHAPE
" ===============
" Changing cursor shape in different modes

" Good for Putty and MobaXterm
" let &t_SI .= "\e[=1c"
" let &t_EI .= "\e[=2c"

:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Change cursorline highlight when enter insert mode
au InsertEnter,InsertLeave * set cul!

" iTerm2
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" gnome-terminal v2
if $TERM_PROGRAM =~ "gnome"
  if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  endif
endif

if &term =~ '^xterm\\|rxvt'
    " solid underscore
    let &t_SI .= "\<Esc>[4 q"
    " solid block
    let &t_EI .= "\<Esc>[2 q"
    " 1 or 0 -> blinking block
    " 3 -> blinking underscore
    " Recent versions of xterm (282 or above) also support
    " 5 -> blinking vertical bar
    " 6 -> solid vertical bar
endif

" highlight last inserted text
nnoremap gV `[v`]

" duplicate the actual line, keeping the cursor position
" nnoremap <C-d> mzyyp`z
" inoremap <C-d> <esc>mzyyp`zi

set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

" ============
"    CTRL-P
" ============

let g:ctrlp_show_hidden = 1
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 1
let g:ctrlp_working_path_mode = 1

" Ignore files in CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](node_modules|bower_components|target|dist)|(\.(swp|ico|git|svn))$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

let g:ctrlp_prompt_mappings = {
            \ 'PrtBS()':              ['<bs>', '<c-]>'],
            \ 'PrtDelete()':          ['<del>'],
            \ 'PrtDeleteWord()':      ['<c-w>'],
            \ 'PrtClear()':           ['<c-u>'],
            \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
            \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
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

" ===========
"    EMMET
" ===========


" Enable just for html/css/hbs
let g:user_emmet_install_global=0
autocmd FileType html,css,hbs EmmetInstall

imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

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
map <C-n> :NERDTreeToggle<CR>
" Show hidden file as default
let g:NERDTreeShowHidden=1
" Ignore
let NERDTreeIgnore=['\.git[[dir]]', '\.idea[[dir]]']
let NERDTreeHijackNetrw=1

" Show NERDTree automatically
autocmd VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Setup shortcuts for jumping between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Moving lines up and down with Alt-j and Alt-k. Have to use special character
" Getting special characters, use cat in a console.
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" vim-javascript https://github.com/pangloss/vim-javascript

" Enables HTML/CSS syntax highlighting in your JavaScript file.
let g:javascript_enable_domhtmlcss = 1

" Handlebar, mustache support
" git clone git://github.com/mustache/vim-mustache-handlebars.git bundle/mustache
" mustache abbreviation on
let g:mustache_abbreviations = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'

" Airline
" https://github.com/bling/vim-airline
" https://github.com/vim-airline/vim-airline-themes
let g:airline#extensions#tabline#enabled = 1

" NERDCommenter
" https://github.com/scrooloose/nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Toggle comments with CTRL-C
map <C-c> :call NERDComment(0, "toggle")<CR>

" Rails vim

" YouCompleteMe Settings
" git submodule update --init --recursive
" ./install.py --clang-completer
" Only an older version can be compiled on Redhat 6.6
" https://github.com/Valloric/ycmd/issues/552
" This is the latest working tree:
" https://github.com/Valloric/YouCompleteMe/tree/0de1c0c9bb13ce82172b472c676035cd47cf6a6a

" g:ycm_server_python_interpreter = '$HOME/.pyenv/shims/python'

" Use deoplete.
if has('nvim')
  let g:deoplete#enable_at_startup = 1
endif

autocmd BufWritePost *
            \ if filereadable('tags') |
            \   call system('ctags -a '.expand('%')) |
            \ endif

" Map TagbarToggle
noremap <Leader>m :TagbarToggle<CR>

" open file under cursor, source: https://github.com/amix/open_file_under_cursor.vim
" ----- Emulate 'gf' but recognize :line format -----
function! GotoFile(w)
    let curword = expand("<cfile>")
    if (strlen(curword) == 0)
        return
    endif
    let matchstart = match(curword, ':\d\+$')
    if matchstart > 0
        let pos = '+' . strpart(curword, matchstart+1)
        let fname = strpart(curword, 0, matchstart)
    else
        let pos = ""
        let fname = curword
    endif

    " check exists file.
    if filereadable(fname)
        let fullname = fname
    else
        " try find file with prefix by working directory
        let fullname = getcwd() . '/' . fname
        if ! filereadable(fullname)
            " the last try, using current directory based on file opened.
            let fullname = expand('%:h') . '/' . fname
        endif
    endif

   " Open new window if requested
    if a:w == "new"
        new
    endif
    " Use 'find' so path is searched like 'gf' would
    execute 'find ' . pos . ' ' . fname
endfunction

set isfname+=: " include colon in filenames

" Override vim commands 'gf', '^Wf', '^W^F'
nnoremap gf :call GotoFile("")<CR>
nnoremap <C-W>f :call GotoFile("new")<CR>
nnoremap <C-W><C-F> :call GotoFile("new")<CR>

au VimLeave * :!clear

if filereadable(expand("$HOME/.vimrc.local"))
  source $HOME/.vimrc.local
endif
" ================
"       NOTES
" ================
"
" EditorConfig vim https://github.com/editorconfig/editorconfig-vim.git
"
" Great link: http://vimawesome.com/
" http://dougblack.io/words/a-good-vimrc.html
" Polyglot - syntax highlighting
" https://github.com/sheerun/vim-polyglot

" Fugitive.vim
" https://github.com/tpope/vim-fugitive

" Gitgutter
" https://github.com/airblade/vim-gitgutter

" HTML5
" https://github.com/othree/html5.vim

" Surround
" https://github.com/tpope/vim-surround

" Syntastic
" https://github.com/scrooloose/syntastic
" This settings not working with powerline
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" Tab management
" nmap <c-t> :tabnew<cr>
" nmap tw :tabclose<cr>
" Jump to first tab: 1gt, second tab: 2gt

" Jumping between parenthesis, use %
" Use [{ for jumping back
" Use gd for local declaration.

" CTRL-N auto compleat.
" Record macro: qa -> record in register 'a', finish with type q again.
" Repeate macro: @a

