" Version::1.0

" NOTE: For plugin docs. pwd in the pluging docs directory.
" Then in vim type :helptags /Users/{username}/.vim/bundle/{plugin}/doc
" NOTE: I need to make completion work for different launguages. Omni for
" markdown and txt files.
" NOTE: Tags for docs
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
" FileType and Syntax -----------------------------------------------------{{{1
" This will keep the flags for plugin and indent, but since no file types
" are being detected, they won't work until the next filetype on.
filetype off
filetype plugin indent off

" Pathogen runtime injection and help indexing.
execute pathogen#infect()

" $VIMRUNTIME/filetype.vim
filetype plugin indent on

" The syntax enable command will keep your current color settings. This
" allows using highlight commands to set your preferred colors before or
" after using this command.  If you want Vim to overrule your settings with the
" defaults, use: :syntax on
syntax enable

" use 256 colors in :terminal
if has('gui_running')
    let $TERM = 'xterm-256color'
endif

" Set terminal colors
set t_Co=256

" Add colors directory to the runtimepath
set runtimepath+=~/.vim/colors

" Theme -------------------------------------------------------------------{{{2
set background=dark
colorscheme solarized

" Make sure airline theme is loaded.
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

"}}}
" Variables ---------------------------------------------------------------{{{2
" set leader
let mapleader = ","
let maplocalleader = ','

" set vimrc
let $MYVIMRC=$HOME.'/.vimrc'
"}}}
"}}}
" Compatiblity ------------------------------------------------------------{{{1
set nocompatible
set fileformat=unix
set clipboard=unnamed

" Indicates a fast terminal connection.
set ttyfast
set ttimeoutlen=0

" noeb - no error bell, no visual bell
set noeb vb t_vb=
set backspace=indent,eol,start

" no splash screen at the start
set shortmess+=I

" Allows you to hide buffers with unsaved changes without being prompted.
set hidden

" set novisualbell

"}}}
" Screen Layout ------------------------------------------------------------------{{{1
" The title of the window will be set to the value of 'titlestring' (if it is not empty)
set title
" show a number column
set number
" display the literal line number of the line you are currently on.
set relativenumber
set cursorline

" text width 79 if colorcolumn is set to 1 and there is no colorcolumn join.
" text width 80 if there is no colorcolumn set to 1
set textwidth=79
" set the column at the 80 +1 after textwidth
set colorcolumn=+1

" fills the color to the end of the line
" if exists('+colorcolumn')
    " let &l:colorcolumn='+'  .  join(range(0, 254), ',+')
" endif
" }}}
" Status, Mode and CMD Window ---------------------------------------------{{{1
" Show the line and column number of the cursor position.
set ruler

" Show (partial) command in the last line of the screen.
set showcmd
" If in Insert, Replace or Visual mode put a message on the last line.
set noshowmode

" always show a statusline 0,1,2
set laststatus=2

" show output from last command (default 5)
set modelines=5
" Number of screen lines to use for the command-line window. Default is 7
set cmdwinheight=7

" Like 'autowrite', but also used for commands edit, enew, quit, qall, exit,
" xit, recover and closing the Vim window.
set autowrite
set autowriteall

" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread

" The screen will not be redrawn while executing macros, registers and other commands
set lazyredraw

"}}}
" Scroll ------------------------------------------------------------------{{{1

" set to 999 the cursor will stay in the middle.
" set <number> for <number> lines from the top of bottom
set scrolloff=999
set sidescroll=1
set sidescrolloff=100

" }}}
" Formatting --------------------------------------------------------------{{{1

" Remove comment leader when joining comments.
set formatoptions+=j
" Smart auto indenting inside numberd lists
set formatoptions+=n

" J join two lines at .
set nojoinspaces

" Vim will wrap long lines at a character in 'breakat' rather than at the last
" character that fits on the screen.
set linebreak

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
set breakindent

" Copy indent from current line when starting a new line.
set autoindent

" }}}
" Tab Shift --------------------------------------------------------------{{{1

" Converts tab to space. If your using listchars its better to explicitly set
" to noexpand. so the tabs show up.
set expandtab
" Number of spaces that a <Tab> in the file counts for
" Number of spaces that a <Tab> in the file counts for
set tabstop=4
set shiftwidth=4
set softtabstop=4
" always indent by multiples of shiftwidth
set shiftround

"}}}
" Match -------------------------------------------------------------------{{{1

" Tenths of a second to show the matching paren, when 'showmatch' is set.
set matchtime=3
" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" extended capacities of %
runtime macros/matchit.vim

" }}}
" Search ------------------------------------------------------------------{{{1

" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only
set ignorecase
set smartcase

" While typing a search command, show where the pattern is matched.
set incsearch
set hlsearch
set gdefault

"}}}
" ListChars ---------------------------------------------------------------{{{1

set list
set listchars=tab:▸\.,trail:•,extends:❯,precedes:❮
" folding character used when folded.
set fillchars=fold:-

" when the terminal is more compact this indicates breaks
set showbreak=↪
" ~/@ at end of window, 'showbreak'
set highlight+=@:ColorColumn

" }}}
" Splits ------------------------------------------------------------------{{{1
set splitbelow
set splitright

" Always use vertical diffs
set diffopt=vertical
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

" :ab lists all abbrevs and where they where last used.
" :ab mispelling correction to add to the abrevs

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
" The word boundary is set by adding /\<word\>/ " This will replace <in> but
" not <inside>.
" s     - specifies just the line.
" %s    - specifies all lines.
nnoremap <leader>s :s///
nnoremap <leader>ss :%s///

" One key substitution within a paragraph, word under cursor.
nnoremap & :'{,'}s/<c-r>=expand('<cword>')<cr>/

" Vimgrep for the word under the cursor recursively in sub directory files.
" Then opens the results in the QuickFix window.
nnoremap <leader>gr :vimgrep /<c-r>=expand('<cword>')<cr>/ **/* \| :copen<CR>

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
nnoremap <silent><leader>/ : execute 'vimgrep / '.@/.'/g %'<CR>:copen<CR>

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
if has('autocmd')
" {{{2 Markdown
augroup markdown
    autocmd!
    autocmd FileType md,markdown,txt, set spell
    " sets formatting options specific to markdown
    autocmd FileType md,markdown,txt, set formatoptions+=a

augroup END

" }}}
" {{{2 Help no spell file
" set no spell when opening help files.
    augroup HelpNoSpell
        au!
        au BufRead,BufEnter help set nospell
    augroup END

" {{{2 Return line

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" {{{2 Strip white space
" clear white space and return cursor to position.
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.md,*.rake,*.json,*.zsh,*.rb,*.h,*.c,*.java :call <SID>StripTrailingWhitespaces()

" }}}
" {{{2 Auto completion
" . - current buffer
" w - buffer in other windows
" b - other loaded buffers
" u - unloaded buffer
" t - tags
" i - included files
set completeopt=menu,menuone,noinsert
set complete+=.,w,b,u,t

" The active spell checking dictionary, when spell checking is enabled.
set complete+=kspell
set dictionary+=/usr/share/dict/words

" Dimensions of the popup window.
set completepopup=height:10,width:60,highlight:InfoPopup

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

" If the terminal frame is reduce or expanded keep the windows equal.
au VimResized * :wincmd =

if has ('autocmd')
  augroup vimrc
    autocmd!
    " automatically source ~/.vimrc after saving.
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC | echom "Reloaded $MYVIMRC"
  augroup END
endif

endif
" }}}
"}}}
" Plugins -----------------------------------------------------------------{{{1
" Nerdtree ----------------------------------------------------------------{{{2
nnoremap <leader>n :NERDTreeToggle<CR>
" Bookmarks ---------------------------------------------------------------{{{3
" set env var in .zshrc
" set the location of the NerdTreeBookmarks file
if !empty($NERDTREE_BOOKMARKS)
    if filereadable($NERDTREE_BOOKMARKS)
        let g:NERDTreeBookmarksFile = $NERDTREE_BOOKMARKS
    endif
endif

" }}}
" Close last --------------------------------------------------------------{{{3
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
" }}}
" Settings ----------------------------------------------------------------{{{3
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


" }}}
" Cursor not used ---------------------------------------------------------{{{3
" open nerdtree on enter
" autocmd VimEnter * NERDTree
" set the cursor in nerdtree window only
"augroup NerdCursor
  "autocmd!
  "autocmd BufEnter NERD_tree_* hi CursorLine cterm=NONE ctermfg=231 ctermbg=24
  "autocmd BufLeave NERD_tree_* highlight clear CursorLine
  "autocmd BufAdd * highlight clear CursorLine
"augroup END

" set cursor line inside nerdtree - remember this works becasue it is unset
" when the buffer is exited from nerdcursor. this needs to be removed when not
" starting in nerdtree.
"autocmd VimEnter * hi CursorLine cterm=NONE ctermfg=231 ctermbg=24

" clear the cursorline when writing to stop the cursorline returning in
" nerdtree on save.
"autocmd BufWritePost,FileWritePost * highlight clear CursorLine
"}}}
" UltiSnippets ------------------------------------------------------------{{{2

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetDirectories=["snips", "ultisnips"]

"}}}
" Ctlp --------------------------------------------------------------------{{{2
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>bd :CtrlPBookmarkDir<cr>
nnoremap <Leader>f :CtrlPFunky<Cr>
nnoremap <leader>b :CtrlPBuffer<cr>
"nnoremap <Leader>u :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'
" Set this to 1 if you want CtrlP to scan for dotfiles and dotdirs: >
" ttb           - from top to the bottom
" btt           - from bottom to the top
" min:{n}       - show minimum {n} lines
" max:{n}       - show maximum {n} lines
" results:{n}   - list maximum {n} results
"               - (default: sync with max height).
" Note: you can quickly purge the cache by pressing <F5> while inside CtrlP

let g:ctrlp_show_hidden = 0
" The maximum depth of a directory tree to recurse into: >
let g:ctrlp_max_depth = 10
" Specify the number of recently opened files you want CtrlP to remember: >
let g:ctrlp_mruf_max = 250
" Exclude mru files
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux

" CtrlPFunky
" The results will include class and module definitions.
let g:ctrlp_funky_ruby_classes = 1
let g:ctrlp_funky_ruby_modules = 1
let g:ctrlp_funky_ruby_rake_words = 1

" Set this to 1 (enabled) and the result will include access modifiers such as
" 'private', 'protected' and 'public'.
let g:ctrlp_funky_ruby_access = 1


"}}}
"}}}
" Redraw ------------------------------------------------------------------{{{1
autocmd VimEnter * redraw!
"}}}

















