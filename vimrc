" Version::1.0
"
"    .o oOOOOOOOo                                       .....0OOOo
"    Ob.OOOOOOOo  OOOo.      oOOo.              ....oooooOOOOOOOOO
"    OOoO000000000000.OOo. .oOOOOOo.    OOOo.oOOOOO0000000000000OO
"    OOO.oOOOOOOOOOOO 0POOOOOOOOOOOo.   `0OOOOOOOOOP,OOOOOOOOOOOB'
"    `O'OOOO'     `OOOOo"OOOOOOOOOOO` .adOOOOOOOOO"oOOO'    `OOOOo
"    .OOOO'            `OOOOOOOOOOOOOOOOOOOOOOOOOO'            `OO
"    OOOOO                 '"OOOOOOOOOOOOOOOO"`                oOO
"   oOOOOOOo.                .adOOOOOOOOOOba               .adOOOOo.
"  oOOOOOOOOOOOOOba.    .adOOOOOOOOOO@^OOOOOOOba.     .adOOOOOOOOOOOO
"  OOOOOOOOOOOOOOOOO.OOOOOOOOOOOOOO"`  '"OOOOOOOOOOOOO.OOOOOOOOOOOOOO 
"    :           'OOOOOOOOOOOOOO: .oOOo. :OOOOOOOOOOO?'         :`
"    .            .oO%OOOOOOOOOOo.OOOOOO.oOOOOOOOOOOOO?         .
"                 OOOO"%OOOOOOOOoOOOOOOO?oOOOOO?OOOO"OOO
"                 '%o  OOOO"%OOOO%"%OOOOO"OOOOOO"OOO':
"                      `$"  `OOOO' `O"Y ' `OOOO'  o             .
"    .                  .      O"          : o     .
" Setup -------------------------------------------------------------------{{{1
" This will keep the flags for "plugin" and "indent", but since no file types
" are being detected, they won't work until the next ":filetype on".
filetype off
filetype plugin indent off

" pathogen runntime injection and help indexing
execute pathogen#infect()

" The ":filetype on" command on unix will load:
" $VIMRUNTIME/filetype.vim
filetype plugin indent on

" The ":syntax enable" command will keep your current color settings.  This
" allows using ":highlight" commands to set your preferred colors before or
" after using this command.  If you want Vim to overrule your settings with the
" defaults, use: :syntax on
syntax enable

" set terminal colors
set t_Co=256

" add colors directory to the runtimepath
set runtimepath+=~/.vim/colors

set background=dark

colorscheme solarized

" highlight
hi Folded term=bold cterm=NONE ctermfg=White

" airline theme
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" use 256 colors in :terminal
if has('gui_running')
    let $TERM = 'xterm-256color'
endif

" set leader
let mapleader = ","
let maplocalleader = ','

let $MYVIMRC=$HOME.'/.vimrc'
"}}}
" Basic -------------------------------------------------------------------{{{1
set nocompatible
" temp
set clipboard=unnamed

set title
set hidden
set number
set relativenumber
set ruler
set ttyfast
set ttimeoutlen=0
set novisualbell
set noeb vb t_vb=

set laststatus=2
set modelines=0
set noshowmode
set showcmd

" extended capacities of %
runtime macros/matchit.vim
"}}}
" Formatting --------------------------------------------------------------{{{1
set fileformat=unix
set textwidth=79
set cc=80
set colorcolumn=+1
set linebreak
set breakindent
set lazyredraw
set list
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
set backspace=indent,eol,start
set fillchars=fold:-
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
" this sets whether tab is converted to space. if your using listchars its
" better to explicitly set to noexpand. so the tabs show up.
set expandtab

" J join two lines at .
set nojoinspaces
"set showbreak=↪
"set formatoptions=qrn1j
set splitbelow
set splitright

" Always use vertical diffs
"set diffopt+=vertical
"}}}
" Spell -------------------------------------------------------------------{{{1
"set dictionary=/usr/share/dict/words
set spellfile=~/.vim/custom-dictionary.utf-8.add
"------------------------------------------------------------------------------
set history=1000
set undofile
set undoreload=10000

set backup                        " enable backups
set noswapfile                    " it's 2013, Vim.

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
"}}}
" Search ------------------------------------------------------------------{{{1
set matchtime=3

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

set scrolloff=5
set sidescroll=1
set sidescrolloff=100
set shortmess+=I
set autowrite
set autoread
set shiftround
"}}}
" Folding -----------------------------------------------------------------{{{1
set foldenable
set foldmethod=marker
set foldnestmax=5
"}}}
" Ignore ------------------------------------------------------------------{{{1
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip         " MacOSX/Linu
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
"}}}
" Abbrevs -----------------------------------------------------------------{{{1

if filereadable(expand("~/.vim/abbrevs.vim"))
    source ~/.vim/abbrevs.vim
endif

"}}}
" Remaps-------------------------------------------------------------------{{{1

"------------------------------------------------------------------------------
" movment
"------------------------------------------------------------------------------
" easier escaping
inoremap jj <Esc>

" make j and k work well on wrapped lines
noremap j gj
noremap k gk

" To the beginning and end of the line
nnoremap H ^
nnoremap L g_

"------------------------------------------------------------------------------
" paste
"------------------------------------------------------------------------------
" copy to system clipboard with ''
vmap '' :w !pbcopy<CR><CR>

" set paste
nnoremap <leader>sp :set paste<cr>
"------------------------------------------------------------------------------
" substitution
"------------------------------------------------------------------------------
" subs
nnoremap <leader>s :s///
nnoremap <leader>ss :%s///

" one key substitution within a paragraph, word under cursor
nnoremap & :'{,'}s/<c-r>=expand('<cword>')<cr>/

" replace line with comments
nnoremap <leader>rl :%s/^.*$/"\0",/<CR>
"------------------------------------------------------------------------------
" capitalisation
"------------------------------------------------------------------------------
" upper word
nnoremap <leader>uw gUiw
" upper line
nnoremap <leader>ul gUU
" lower word
nnoremap <leader>lw guaw
" lower line
nnoremap <leader>ll guu
"------------------------------------------------------------------------------
" search and center
"------------------------------------------------------------------------------
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" when using star to search for a word. Do not jump on match
nnoremap * *<c-o>

" center the line
nnoremap <c-o> <c-o>zz

" Reopen the last search in a QuickFix window
nnoremap <silent> <leader>/ : execute 'vimgrep / '.@/.'/g %'<CR>:copen<CR>

"nnoremap g; g;zz
"nnoremap g, g,zz
"------------------------------------------------------------------------------
" source resource files
"------------------------------------------------------------------------------
nnoremap <leader>vr :vsplit $MYVIMRC<cr>
nnoremap <leader>zr :vsplit $HOME/.zshrc<cr>

"------------------------------------------------------------------------------
" no highlight
"------------------------------------------------------------------------------
nnoremap <leader><space> :noh<CR>

"------------------------------------------------------------------------------
" format options
"------------------------------------------------------------------------------
nnoremap <leader>fp gq}<CR>

"------------------------------------------------------------------------------
" session make
"------------------------------------------------------------------------------
nnoremap <leader>se :mks %:h/session.vim<cr>

"}}}
" Bangs -------------------------------------------------------------------{{{1

command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang Wq wq<bang>

"}}}
" Aug commands-------------------------------------------------------------{{{1
" {{{2 markdown
augroup markdown
  autocmd!
  autocmd FileType md,markdown,txt, set spell
augroup END
" }}}
" {{{2 help no spell file
" set no spell when opening help files.
augroup HelpNoSpell
    au!
    au BufRead,BufEnter help set nospell
augroup END

" {{{2 return line
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END
" }}}
" {{{2 strip white space
" clear white space and return cursor to position.
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.md,*.rake,*.json,*.zsh,*.rb,*.h,*.c,*.java :call <SID>StripTrailingWhitespaces()

" }}}
" {{{2 simplpe auto completion 

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
set complete+=w
set complete+=kspell
set dictionary+=/usr/share/dict/words

inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K' " last char
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun
"}}}
" {{{2 misc
" Save when split and jump to the other window
au FocusLost * :w

" If the terminal frame is reduce or expanded keep the windows equal.
au VimResized * :wincmd =

" automatically source ~/.vimrc after saving.
autocmd! BufWritePost $MYVIMRC source $MYVIMRC
" }}}
"}}}
" Plugins -----------------------------------------------------------------{{{1
" Nerdtree ----------------------------------------------------------------{{{2
nnoremap <leader>n :NERDTreeToggle<CR>

" set env var in .zshrc
" set the location of the NerdTreeBookmarks file
if !empty($NERDTREE_BOOKMARKS)
    if filereadable($NERDTREE_BOOKMARKS)
        let g:NERDTreeBookmarksFile = $NERDTREE_BOOKMARKS
    endif
endif

" open nerdtree on enter 
" autocmd VimEnter * NERDTree

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" remove the ? for help
let NERDTreeMinimalUI = 1
" include the arrows
let NERDTreeDirArrows = 1
let NERDTreeShowBookmarks=1
" change cwd when a new node is opened with :C
let g:NERDTreeChDirMode = 2
" when a file is deleted remove the empty buffer
let NERDTreeAutoDeleteBuffer=1
" do not sort the bookmarks, this leaves them in the order created
let NERDTreeBookmarksSort=0
" show hidden files default 0 shift i to toggle
let NERDTreeShowHidden=0

let NERDTreeIgnore = ['\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                    \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                    \ '.*\.o$', 'db.db', 'tags.bak']

" set the cursor in nerdtree window only
augroup NerdCursor
  autocmd!
  autocmd BufEnter NERD_tree_* hi CursorLine cterm=NONE ctermfg=231 ctermbg=24
  autocmd BufLeave NERD_tree_* highlight clear CursorLine
  autocmd BufAdd * highlight clear CursorLine
augroup END

" set cursor line inside nerdtree - remember this works becasue it is unset
" when the buffer is exited from nerdcursor. this needs to be removed when not
" starting in nerdtree.
autocmd VimEnter * hi CursorLine cterm=NONE ctermfg=231 ctermbg=24

" clear the cursorline when writing to stop the cursorline returning in
" nerdtree on save.
autocmd BufWritePost,FileWritePost * highlight clear CursorLine

" UltiSnippets ------------------------------------------------------------{{{2

" let g:UltiSnipsSnippetDirectories=["UltiSnips"]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

"}}}
" Ctlp --------------------------------------------------------------------{{{2
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>bd :CtrlPBookmarkDir<cr>
nnoremap <Leader>f :CtrlPFunky<Cr>
nnoremap <leader>b :CtrlPBuffer<cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"}}}
"}}}
" Redraw ------------------------------------------------------------------{{{1
autocmd VimEnter * redraw!
"}}}
