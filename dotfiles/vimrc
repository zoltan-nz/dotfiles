" vim: set sw=4 ts=4 sts=4 et tw=78
" Zoltan's vim config

set nocompatible          " Must be first line

let mapleader=","

filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

"""""""""
" LEADER
"""""""""

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
let g:solarized_termcolors=256 " Need this for iTerm, otherwise colors would be mixed
" colorscheme Tomorrow-Night

set list " Shows a dot when typed

" Guifont
if has('gui_running')
  set guifont=Meslo\ LG\ S\ for\ Powerline:h17
  set guioptions+=c "Stop opening dialogs
endif

" set cursorline " Highlight current line
" Change cursorline highlight when enter insert mode
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

set number     " Show line numbers
set relativenumber
set showcmd    " Show command in bottom bar
set wildmenu   " Visual autocomplete for command menu
set lazyredraw " Redraw only when we need to

" Mouse activated
set mouse=a
set mousehide
if !has('nvim')
  set ttymouse=xterm2
end

scriptencoding utf-8

" Save file when focus lost
augroup auto_save
  " autocmd! *
  au BufLeave,FocusLost * silent! wall
  au CursorHoldI * silent! wall
  au CursorHold,InsertLeave * silent! wall
augroup END

" autosave when switch to a tmux pane
let g:tmux_navigator_save_on_switch = 1

set autowriteall " Automatically write when leaving a buffer
set autoread

"markdown
"https://github.com/suan/vim-instant-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

if has('clipboard')
  if has('unnamedplus')  " When possible use + register for copy-paste
    set clipboard=unnamed,unnamedplus
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

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
highlight SpecialKey term=NONE cterm=NONE ctermfg=239 ctermbg=NONE guifg=Cyan

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
if $SSH_CALLER !~ "mac" && $TERM_PROGRAM =~ "gnome"
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

" duplicate the actual line, keeping the cursor position
" nnoremap <C-d> mzyyp`z
" inoremap <C-d> <esc>mzyyp`zi

set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

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

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType hbs,html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType js,es6.js,javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType javascript setlocal omnifunc=tern#Complete
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

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
  silent! source $HOME/.vimrc.local
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

