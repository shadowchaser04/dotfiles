" Version::1.0

" NOTE: For plugin docs. pwd in the pluging docs directory.
" Then in vim type :helptags /Users/{username}/.vim/bundle/{plugin}/doc

" TODO: Autochdir is it better to cd file dependent? or manually if needed?
" TODO: Autocomplete consistancy, input best match.
" TODO: When in netrw use the same command h,l as splits uses.
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
"                      `$"  `OOOO' `O"! ' `OOOO'  o             .
"    .                  .      O"          : o     .

" FileType and Syntax -----------------------------------------------------{{{1

" Filetype detection. Vim will identify the file type.
"
" Using indent files When editing programs, the indent of a line can often be
" computed automatically. Vim comes with these indent rules for a number of
" filetypes.
"
filetype plugin indent on

" The syntax enable command will keep your current color settings. This
" allows using highlight commands to set your preferred colors before or
" after using this command. If you want Vim to overrule your settings with the
" defaults, use: :syntax on
syntax enable

" use 256 colors in :terminal
if has('gui_running')
    let $TERM = 'xterm-256color'
endif


"}}}
" Colorscheme -------------------------------------------------------------{{{1

" Colorscheme should always be set to dark if there is a dark/light option.
set background=dark
colorscheme solarized

"}}}
" Locatinal Variables and Leader ------------------------------------------{{{1

" A leader key is used like a prefix. It precedes a map/remap. So as to avoid
" clashing with vim's builtin key settings.
"
" Big deal new space leader key.
let mapleader = ' '
let maplocalleader = ' '

" Some variables are set to avoid misspellings. In a Vim script variables
" starting with s: can be used. They cannot be accessed from outside of the
" scripts, thus are local to the script.

" Resource files
let $MYVIMRC=$HOME.'/.vimrc'
let $DOTVIMRC=$HOME.'/.dotfiles/vimrc'

" Notes
let $NOTE=$HOME.'/.notes'
let $CACHE=$HOME.'/.cache'

"}}}
" Compatibility ------------------------------------------------------------{{{1

" This option has the effect of making Vim either more Vi-compatible, or make
" Vim behave in a more useful way.
set nocompatible
" This gives the <EOL> of the current buffer, which is used for reading/writing
" the buffer from/to a file:
"   dos	    <CR> <NL>
"   unix    <NL>
"   mac	    <CR>
set fileformat=unix
set clipboard=unnamed
" Set terminal colors
set t_Co=256

" Indicates a fast terminal connection.
set ttyfast
set ttimeoutlen=0

" Noeb - no error bell, no visual bell
set noeb vb t_vb=
" make delete work sanely
set backspace=indent,eol,start

" No splash screen at the start
set shortmess+=I

" Allows you to hide buffers with unsaved changes without being prompted.
set hidden

"}}}
" Screen Layout ------------------------------------------------------------------{{{1

" The title of the window will be set to the value of 'titlestring' (if it is not empty)
set title
" Show a number column
set number
" Display the literal line number of the line you are currently on.
set relativenumber
set cursorline
" Remove the underline default from the line number
hi CursorLineNr term=bold cterm=bold ctermfg=12 gui=bold

" Text width 79 if colorcolumn is set to 1 and there is no colorcolumn join.
" Text width 80 if there is no colorcolumn set to 1
set textwidth=79
" Set the column at the 80 +1 after textwidth
set colorcolumn=+1

" fills the color to the end of the line
" if exists('+colorcolumn')
    " let &l:colorcolumn='+'  .  join(range(0, 254), ',+')
" endif
" }}}
" CMD Window and Status bar -----------------------------------------------{{{1

" Height of the command bar.
set cmdheight=1
" Number of screen lines to use for the command-line window. Default is 7
set cmdwinheight=7
" Show (partial) command in the last line of the screen.
set showcmd
" If in Insert, Replace or Visual mode do not put a message on the last line.
set noshowmode
" Show output from last command (default 5)
set modelines=5

" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
" On pressing 'wildchar' (usually <Tab>) to invoke completion, the possible
" matches are shown just above the command line, with the first match
" highlighted
set wildmenu
hi StatusLine term=reverse cterm=reverse ctermfg=0 ctermbg=10 gui=bold,reverse
hi WildMenu term=reverse cterm=reverse ctermfg=0 ctermbg=4

" Longest full,full - Cycles through the options without a list.
" Longest list full - Pops up a list of all the options and let you cycle them.
set wildmode=longest,list,full
"set wildmode=longest:full,full

" Always show a statusline 0,1,2
set laststatus=2
" Show the line and column number of the cursor position.
set ruler

" Execute {command}, and use a dialog when an operation has to be confirmed.
set confirm

" Like 'autowrite', but also used for commands edit, enew, quit, qall, exit,
" xit, recover and closing the Vim window.
" set autowrite
" set autowriteall

" When a file has been detected to have been changed outside of Vim and
" it has not been changed inside of Vim, automatically read it again.
set autoread

" Check if any buffers were changed outside of Vim.
" Each loaded buffer is checked for its associated file being changed.  If the
" file was changed Vim will take action.  If there are no changes in the buffer
" and 'autoread' is set, the buffer is reloaded.
au FocusGained,BufEnter * checktime

" The screen will not be redrawn while executing macros, registers and other commands
set lazyredraw

"}}}
" Cursor ------------------------------------------------------------------{{{1

" start insert mode (razor cursor shape)
let &t_SI="\<Esc>]50;CursorShape=1\x7"
" start replace mode (underline cursor shape)
let &t_SR="\<Esc>]50;CursorShape=2\x7"
" end insert or replace mode (block cursor shape)
let &t_EI="\<Esc>]50;CursorShape=0\x7"

" }}}
" Scroll ------------------------------------------------------------------{{{1

" Set to 999 the cursor will stay in the middle.
" Set <number> for <number> lines from the top of bottom
set scrolloff=999
set sidescroll=1
set sidescrolloff=100

" }}}
" Formatting --------------------------------------------------------------{{{1
" NOTE: Paste inserts tabs not spaces

" Automatically insert the current comment leader after hitting o or O in
" Normal mode.
set formatoptions+=o

" Remove comment leader when joining comments.
set formatoptions+=j
" Smart auto indenting inside numbed lists
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
" **FTPLUGIN** - can set the tablevel for programing launguages itself. Paste
" will preserve the user defined levels set and the choice of tabs or spaces.

" Converts tab to space. If your using listchars its better to explicitly set
" to noexpand. So the tabs show up.
set noexpandtab

" Number of spaces that a <Tab> in the file counts for
set tabstop=4

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4
" Number of spaces to reduce each step of (auto)indent.
set softtabstop=4

" When changing the indent of the current line, preserve as much of the
" indent structure as possible.
set preserveindent


" Always indent by multiples of shiftwidth
set shiftround

"}}}
" Match -------------------------------------------------------------------{{{1

" Tenths of a second to show the matching parenth, when 'showmatch' is set.
set matchtime=3
" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" new package managment system. If packages are in vim/pack/opt they are
" not autoloaded. I think this means i have to explicitly call it?
"
packadd matchit

" }}} Search
" Search ------------------------------------------------------------------{{{1

" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only
set ignorecase
set smartcase

" While typing a search command, show where the pattern is matched.
set incsearch
set hlsearch

" When on, the :substitute flag 'g' is default on.
set gdefault

" For regular expression
set magic

"}}}
" ListChars ---------------------------------------------------------------{{{1
set list
set listchars=tab:▸\ ,trail:•,extends:❯,precedes:❮
" Folding character used when folded.
set fillchars=fold:-

" When the terminal is more compact this indicates breaks
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
" History, Spell and Undo -------------------------------------------------{{{1

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

" zM - Close all folds
" zR - Open all folds

set foldenable
set foldmethod=marker
set foldnestmax=5

"}}}
" Ignore ------------------------------------------------------------------{{{1
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip         " MacOSX/Linux
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
"}}}
" Abbrevs -----------------------------------------------------------------{{{1

" :ab lists all abbrevs and where they where last used.
" :ab misspelling correction to add to the abbrevs

if filereadable(expand("~/.vim/abbrevs.vim"))
    source ~/.vim/abbrevs.vim
endif

"}}}
" Remaps-------------------------------------------------------------------{{{1

"------------------------------------------------------------------------------
" Movement
"------------------------------------------------------------------------------
" Easier escaping
inoremap jj <Esc>

" Make j and k work well on wrapped lines
noremap j gj
noremap k gk

" To the beginning and end of the line
nnoremap H ^
nnoremap L g_

" Remap control instead of control w to jump between splits
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h

nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
"------------------------------------------------------------------------------
" paste
"------------------------------------------------------------------------------
" Copy to system clipboard with ''
vmap '' :w !pbcopy<CR><CR>

" set paste unsets some of vims indent and format options.
set pastetoggle=<F2>

" Set paste
" nnoremap <leader>sp :set paste<cr>

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

"------------------------------------------------------------------------------
" Grep
"------------------------------------------------------------------------------
" NOTE: Not for use in $HOME directory. Long recursive search. Prj Dir only.
" TODO: make into a small function. Grab the word under the cursor. Get the
" directory you are currently in.
" Vimgrep for the word under the cursor recursively in sub directory files.
" Then opens the results in the QuickFix window.
nnoremap <leader>gr :vimgrep /\<<c-r>=expand('<cword>')<cr>\>/ **/* \| :copen<CR>

" nnoremap <leader>n :cnext<CR>zz
" nnoremap <leader>N :cprev<CR>zz
"------------------------------------------------------------------------------
" split
"------------------------------------------------------------------------------
" Shift s to split the line at cursor. Same as shift j for join.
nnoremap S i<CR><esc>^mwgk:silent! s/\v+$//<cr>:noh<CR>`w

"------------------------------------------------------------------------------
" capitalisation
"------------------------------------------------------------------------------
" Upper word
nnoremap <leader>uw gUiw
" Upper line
nnoremap <leader>ul gUU
" Lower word
nnoremap <leader>lw guaw
" Lower line
nnoremap <leader>ll guu
"------------------------------------------------------------------------------
" search and center
"------------------------------------------------------------------------------
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" When using star to search for a word. Do not jump on match
nnoremap * *<c-o>

" Center the line
nnoremap <c-o> <c-o>zz

" Reopen the last search in a QuickFix window
nnoremap <silent><leader>/ : execute 'vimgrep / '.@/.'/g %'<CR>:copen<CR>

"nnoremap g; g;zz
"nnoremap g, g,zz
"------------------------------------------------------------------------------
" no highlight
"------------------------------------------------------------------------------
nnoremap <leader><space> :noh<CR>

"------------------------------------------------------------------------------
" source resource files
"------------------------------------------------------------------------------
nnoremap <leader>vr :vsplit $MYVIMRC<cr>
nnoremap <leader>zr :vsplit $HOME/.zshrc<cr>

"------------------------------------------------------------------------------
" quick edits
"------------------------------------------------------------------------------
let $MYVIM = $HOME.'/.vim'
nnoremap <leader>ed :vsplit $MYVIM/custom-dictionary.utf-8.add<CR>
nnoremap <leader>ea :vsplit $MYVIM/abbrevs.vim<CR>

"------------------------------------------------------------------------------
" format options
"------------------------------------------------------------------------------
nnoremap <leader>fp gq}<CR>

"------------------------------------------------------------------------------
" session make
"------------------------------------------------------------------------------
nnoremap <leader>se :mks %:h/session.vim<cr>

"------------------------------------------------------------------------------
" explore
"------------------------------------------------------------------------------
" Uses the builtin directory search.
nnoremap <leader>x :Lexplore<CR>

"}}}
" Bangs -------------------------------------------------------------------{{{1

command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang Wq wq<bang>

" -----------------------------------------------------------------------------
"  notes
" -----------------------------------------------------------------------------
" Provide one Arg with nargs <args>. Ngrep is the name of the function. Vimgrep
" is vim's built in grep. $NOTE is defined in my variables. /** is all
" directories recursively under the CWD and /* is the files. In this case a type
" is specified .md, so all markdown files will be looked in.
command! -nargs=1 Ngrep vimgrep "<args>" $NOTE/**/*.md
nnoremap <leader>n :Ngrep<space>

"}}}
" Aug commands-------------------------------------------------------------{{{1
if has('autocmd')
" {{{2 Auto completion

" menuone   - Display a menu even if there is only one menu.
" longest   - Inserts the longest string.
" noinsert  - Does not insert the first word. No effect if longest is present.
" popup     - Show extra information about the currently selected completion in
"             a popup window.  Only works in combination with "menu" or "menuone".
set completeopt=menuone,noinsert
" . - current buffer
" w - buffer in other windows
" b - other loaded buffers
" u - unloaded buffer
" t - tags
" i - included files
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

" Filetype
autocmd FileType ruby,eruby setl omnifunc=rubycomplete#Complete
autocmd FileType css setl omnifunc=csscomplete#CompleteCSS
autocmd FileType html setl omnifunc=htmlcomplete#Complete
autocmd FileType python setl omnifunc=pythoncomplete#Complete


"}}}
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
" Cursor and Cursorline ---------------------------------------------------{{{2
" Only show the statusline in the window that has current focus.
augroup CursorLineFocus
    au!
    au WinLeave * set nocursorline nocursorcolumn
    au WinEnter * set cursorline
augroup END

" When in insert mode set no cursorline.
augroup InsertNoCursorLine
    au!
    au InsertEnter * set nocursorline nocursorcolumn
    au InsertLeave * set cursorline
augroup END

" }}}
" {{{2 Help no spell file
" set no spell when opening help files.
    augroup HelpNoSpell
        au!
        au BufRead,BufEnter help set nospell
    augroup END

" {{{2 SpellGroup
" sets spell on all text based as opposed to programing type language.
" sets formatting options specific to markdown
augroup SpellGroups
    au!
    autocmd FileType md,markdown,txt, set spell
    autocmd FileType md,markdown,txt, set formatoptions+=a
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

autocmd BufWritePre *.vim,*.md,*.rake,*.json,*.zsh,*.rb,*.h,*.c,*.java :call <SID>StripTrailingWhitespaces()

" }}}
" {{{2 misc

" If the terminal frame is reduce or expanded keep the windows equal.
au VimResized * :wincmd =

" Source my vimrc file when the full buffer is writen.
augroup vimrc
autocmd!
" automatically source $MYVIMRC or $DOTVIMRC when writing to a .vimrc file.
autocmd! BufWritePost $MYVIMRC,$DOTVIMRC source $MYVIMRC | echom "Reloaded $MYVIMRC"
augroup END

endif
" }}}
"}}}
" Plugins -----------------------------------------------------------------{{{1
" Airline -----------------------------------------------------------------{{{2

" Make sure airline theme is loaded.
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" }}}
" UltiSnippets ------------------------------------------------------------{{{2

" Open the snippets editor for specific filetype
nnoremap <LEADER>se :UltiSnipsEdit<CR>

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

"}}}
" Ctlp --------------------------------------------------------------------{{{2
nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>b :CtrlPBookmarkDir<cr>

" Set the directory to store the cache files
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

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
" Extplorer --------------------------------------------------------------{{{2
let g:netrw_home=$CACHE.'/netrw/'
" remove the top banner
let g:netrw_banner=0
" set the window size to a fixed size
let g:netrw_winsize=24
" set the minimum window size.
let g:netrw_wiw=22
" tree style listing
let g:netrw_liststyle = 3

" controls maximum quantity of past history. May be zero to supppress history.
let g:netrw_dirhistmax=10

" when browsing, <cr> will open the file, vertically splitting the window first
let g:netrw_browse_split=2
" 0: show all, 1: show not-hidden files. 2: show hidden file only. Default 1
" hide dotfiles or not.
let g:netrw_hide=0
" ignore
let g:netrw_list_hide='.*\.png$,.*\.pdf,.*\.mp4,.*\.mp3,.*\.svg,.*\.jpg'

"}}}
" Column depth gutter -----------------------------------------------------{{{2
"let g:last_fold_column_width = 2

"function! FoldColumnToggle()
    "if&foldcolumn
        "let g:last_fold_column_width = &foldcolumn
        "setlocal foldcolumn=0
    "else
        "let &l:foldcolumn = g:last_fold_column_width
    "endif
"endfunction

"nnoremap <LEADER>f :call FoldColumnToggle()<cr>
" }}}
" Redraw ------------------------------------------------------------------{{{1
autocmd VimEnter * redraw!
"}}}
















