"==============================================================================
" Version: 2.0
" Author: Shadow
" Last Update: Wednesday, 19 May 2021  4:05 AM
"==============================================================================
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

"==============================================================================
" VIMRC
"==============================================================================
" Notes {{{1

" ----Toggle----
" F1 - Toggle Paste
" F2 - Toggle Numbers
" F3 - Toggle Scratch buffer
" F4 - Toggle Relative Directory / CtrlP

" ----Reminders----
" Around and inside.
" helpgrep - grep helpfiles.
" ge - Always forget back end
" control f/b forwad by page and back
" g; || g, - last insert changes

" ----search----
"  changes
"  jumps
" history - q:
" search  - q/
" control a, control x - increment and decrement

" }}}
" Basic Setup {{{1
" FileType {{{2

" Filetype detection. Vim will identify the file type.
"
" Using indent files When editing programs, the indent of a line can often be
" computed automatically. Vim comes with these indent rules for a number of
" filetypes.
filetype plugin indent on

"}}}
" Compatibility {{{2

" Make Vim either more Vi-compatible, or make Vim behave in a more useful way.
set nocompatible

" This gives the <EOL> of the current buffer, which is used for reading/writing
" the buffer from/to a file: dos<CR>,<NL>/ unix<NL>/ mac<CR>
set fileformat=unix

set clipboard=unnamed

" make delete work sanely
set backspace=indent,eol,start

" Indicates a fast terminal connection.
set ttyfast
set ttimeoutlen=0

" When on, Vim will change the current working directory whenever you
" open a file, switch buffers, delete a buffer or open/close a window.
" It will change to the directory containing the file which was opened
" or selected.
" note: When this option is on some plugins may not work.
set autochdir

" Allows you to hide buffers with unsaved changes without being prompted.
set hidden

" This will check the current folder for tags file and keep going one directory
" up all the way to the root folder. So you can be in any sub-folder in your
" project and it'll be able to find the tags files.
set tags=tags;/

"}}}
" Colors {{{2

" The syntax enable command will keep your current color settings. This
" allows using highlight commands to set your preferred colors before or
" after using this command. If you want Vim to overrule your settings with the
" defaults, use: :syntax on
syntax enable

" use 256 colors in :terminal
if has('gui_running')
    let $TERM = 'xterm-256color'
endif

" Set terminal colors
set t_Co=256

" Colorscheme should always be set to dark if there is a dark/light option.
if !empty(glob("~/.vim/pack/myplugins/start/vim-colors-solarized/colors/solarized.vim"))
	colorscheme solarized
endif

" Set dark and light theme
set background=dark

"}}}
" Leader {{{2

" A leader key is used like a prefix. It precedes a map/remap. So as to avoid
" clashing with vim's builtin key settings.
"
" Big deal new spacebar leader key.
let mapleader = "\<space>"
let maplocalleader = "\<space>"

" }}}
" Locational Variables {{{2
" Some variables are set to avoid misspellings. In a Vim script variables
" starting with s: can be used. They cannot be accessed from outside of the
" scripts, thus are local to the script.

" Resource files
let $MYVIMRC=$HOME.'/.vimrc'
let $DOTVIMRC=$HOME.'/.dotfiles/vimrc'

" Notes
let $NOTES=$HOME.'/.notes'
let $CACHE=$HOME.'/.cache'

"}}}
" }}}
" Layout {{{1
" Screen Layout {{{2

" The title of the window will be set to the value of 'titlestring'
set title

" Display the literal line number
set number

" Display the line you are currently on as its literal, and an array of
" ascending and decending numbers starting from 1
set relativenumber

set cursorline

" Remove the underline default from the line number
hi CursorLineNr term=bold cterm=bold ctermfg=12 gui=bold

" Text width 79 if colorcolumn is set to 1 and there is no colorcolumn join.
" Text width 80 if there is no colorcolumn set to 1
set textwidth=79

" Set the column at the 80 +1 after textwidth
set colorcolumn=+1

" Noeb - no error bell, no visual bell
set noeb vb t_vb=

" No splash screen at the start
set shortmess+=I

" Fills the color to the end of the line
" if exists('+colorcolumn')
    " let &l:colorcolumn='+'  .  join(range(0, 254), ',+')
" endif


" }}}
" CMD Window and Status bar {{{2

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

" The screen will not be redrawn while executing macros, registers and other commands
set lazyredraw

"}}}
" Cursor {{{2

" start insert mode (razor cursor shape)
let &t_SI="\<Esc>]50;CursorShape=1\x7"
" start replace mode (underline cursor shape)
let &t_SR="\<Esc>]50;CursorShape=2\x7"
" end insert or replace mode (block cursor shape)
let &t_EI="\<Esc>]50;CursorShape=0\x7"

" }}}
" Scroll {{{2

" Set to 999 the cursor will stay in the middle.
" Set <number> for <number> lines from the top of bottom
set scrolloff=999
set sidescroll=1
set sidescrolloff=100

" }}}
" Chars {{{2

set list
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮

" Folding character used when folded.
set fillchars=fold:━

" When the terminal is more compact this indicates breaks
set showbreak=↪
" ~/@ at end of window, 'showbreak'
set highlight+=@:ColorColumn

" diff and VertSplit devide
set fillchars=diff:⣿,vert:\▏

" verticle split line - blue
hi VertSplit ctermfg=4 ctermbg=0 gui=reverse


" }}}
" Folding {{{2

set foldlevelstart=0
set foldenable
set foldmethod=marker
set foldnestmax=5

hi Folded cterm=bold term=bold ctermfg=12 ctermbg=8 guifg=Cyan guibg=DarkGrey
" red
hi FoldColumn ctermfg=1 ctermbg=0 gui=bold guifg=Blue guibg=DarkCyan

"}}}
" Splits {{{2

" When on, splitting a window will put the new window below the current one.
set splitbelow
" When on, splitting a window will put the new window to the right of the
" current one.
set splitright

" Always use vertical diffs
set diffopt=vertical

"}}}
" }}}
" Formatting {{{1
" Format Options {{{2

" hitting o or O in Normal mode.
set formatoptions+=o

" Remove comment leader when joining comments.
set formatoptions+=j
" Smart auto indenting inside numbed lists
set formatoptions+=n

" J join two lines at .
set nojoinspaces

" }}}
" Tab {{{2

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

" Always indent by multiples of shiftwidth
set shiftround

" Indent {{{2

" When changing the indent of the current line, preserve as much of the
" indent structure as possible.
set preserveindent

" Vim will wrap long lines at a character in 'breakat' rather than at the last
" character that fits on the screen.
set linebreak

" Every wrapped line will continue visually indented (same amount of space as
" the beginning of that line), thus preserving horizontal blocks of text.
set breakindent

" Copy indent from current line when starting a new line.
set autoindent

" }}}
" Match {{{2

" Tenths of a second to show the matching parenth, when 'showmatch' is set.
set matchtime=3
" When a bracket is inserted, briefly jump to the matching one.
set showmatch

" }}}
" }}}
" completion {{{1

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

"}}}
" Search {{{1

" If the 'ignorecase' option is on, the case of normal letters is ignored.
" 'smartcase' can be set to ignore case when the pattern contains lowercase
" letters only
set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper case
" characters.
set smartcase

" While typing a search command, show where the pattern is matched.
set incsearch

" last search pattern highlighting
set hlsearch

" When on, the :substitute flag 'g' is default on.
set gdefault

" For regular expression
set magic

"}}}
" Ignore {{{1
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*/tmp/*,*.so,*.swp,*.zip         " MacOSX/Linux
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
"}}}
" History, Spell, Undo and Abbrev {{{1

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

" :ab lists all abbrevs and where they where last used.
" :ab misspelling correction to add to the abbrevs

if filereadable(expand("~/.vim/abbrevs.vim"))
    source ~/.vim/abbrevs.vim
endif

"}}}
" Hackey Stuff {{{1
" Remaps {{{2
" esc {{{3

" keep hands on the homerow
inoremap jj <Esc>

" }}}
" Movement {{{3

" Make j and k work well on wrapped lines
noremap j gj
noremap k gk

" Control-j/k jump through the change list, to last inserts point.
nnoremap <C-j> g;
nnoremap <C-k> g,

" Shift-h/l to the beginning and end of the line
nnoremap H ^
nnoremap L g_

" Control-h/l To the beginning and end of the line in command mode
cnoremap <C-h> <home>
cnoremap <C-l> <end>

" }}}
" split windows {{{3

" Remap control instead of control w to jump between splits
nnoremap <UP> <C-w>k
nnoremap <DOWN> <C-w>j
nnoremap <LEFT> <C-w>h
nnoremap <RIGHT> <C-w>l

" resize splits
nnoremap <S-Up> :resize +2<CR>
nnoremap <S-Down> :resize -2<CR>
nnoremap <S-Left> :vertical resize +2<CR>
nnoremap <S-Right> :vertical resize -2<CR>

" }}}
" Search and center {{{3

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" When using star to search for a word. Do not jump on match
nnoremap * *<c-o>

" When jumping center the line.
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz

" Reopen the last search in a QuickFix window
nnoremap <silent><leader>/ : execute 'vimgrep / '.@/.'/g %'<CR>:copen<CR>

"nnoremap g; g;zz
"nnoremap g, g,zz
" }}}
" Grep {{{3

" Greps through project for the word under the cursor.
nnoremap ? :vimgrep /\<<c-r>=expand('<cword>')<cr>\>/ % \| :copen<CR>

" funky - find def || classes in the file.
nnoremap <leader>f :vimgrep /\<\(def\\|^class\\|^module\)\>/ % \| :copen<CR>

" }}}
" Substitution {{{3

" Word under the cursor, replaces all lines.
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" One key substitution within a paragraph, word under cursor.
nnoremap & :'{,'}s/<c-r>=expand('<cword>')<cr>/

" }}}
" Split {{{3

" Shift s to split the line at cursor. Same as shift j for join.
nnoremap S i<CR><esc>^mwgk:silent! s/\v+$//<cr>:noh<CR>`w

" }}}
" Paste {{{3

" Copy to system clipboard with ''
vmap '' :w !pbcopy<CR><CR>

" set paste unsets some of vims indent and format options.
set pastetoggle=<F1>

" this seems to be a way to toggle boolean values.
"nnoremap <f3> :set nonumber! number?<CR>

" }}}
" Capitalisation {{{3

" Upper word
nnoremap <leader>uw gUiw
" Upper line
nnoremap <leader>ul gUU

" Lower word
" nnoremap <leader>lw guaw
" Lower line
" nnoremap <leader>ll guu

" }}}
" No highlight {{{3

" clear highlights
nnoremap <leader><space> :noh<CR>

" }}}
" Toggle between space and tab. {{{3

" spaces and tabs
nnoremap <leader><TAB> :set et! list!<CR>

" }}}
" Quick edits {{{3

let $MYVIM = $HOME.'/.vim'
nnoremap <leader>er :vsplit $MYVIMRC<cr>
nnoremap <leader>ed :vsplit $MYVIM/custom-dictionary.utf-8.add<CR>
nnoremap <leader>ea :vsplit $MYVIM/abbrevs.vim<CR>
nnoremap <leader>es :UltiSnipsEdit<CR>

" }}}
" Format options {{{3

" format the lines unbroken by space.
nnoremap <leader>fp gq}<CR>

" }}}
" Session make {{{3

"make session
nnoremap <leader>se :mks $HOME/.vim/sessions/%:h.vim<cr>

" }}}
" Explore {{{3

" Uses the builtin directory search.
nnoremap <leader>x :Lexplore<CR>

" }}}
" Folding {{{3

" close all folds except the current fold except
 nnoremap <leader>z zMzvzz

" }}}
" Ctrl-P {{{3

nnoremap <leader>m :CtrlPMRUFiles<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>bd :CtrlPBookmarkDir<cr>
nnoremap <leader>l :CtrlPMark<cr>

" }}}
" Unmap {{{3

" clear k so i don't keep pressing it when i join lines.
nnoremap K <nop>

" Insert and delete the first character. Because it is so close to "a" which is
" insert mode it seems like it would be easy to be in insert and not realized
" you have deleted a character.
nnoremap s <nop>

" map beginning, end
nnoremap 0 <nop>
nnoremap $ <nop>

"}}}
" }}}
" Bangs {{{2

" Correct misspellings.
command! -bang Q q<bang>
command! -bang W w<bang>
command! -bang Wq wq<bang>

" Create a disposable buffer that cannot be written.
command! -nargs=0 Scratch vnew | setlocal bt=nofile bh=wipe nobl noswapfile nu
nnoremap <f3> :Scratch<cr>

"command! -nargs=1 Ngrep vimgrep "<args>" $NOTES/**/*.md
"nnoremap <leader>n :Ngrep<space>

"}}}
" Aug commands {{{2
if has('autocmd')
" Auto completion {{{3

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
" Return line {{{3

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
	au!
	au BufReadPost *
		\ if line("'\"") > 0 && line("'\"") <= line("$") |
		\     execute 'normal! g`"zvzz' |
		\ endif
augroup END

" }}}
" Cursor and Cursorline {{{3

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
" SpellGroup {{{3

" Sets formatting options specific to markdown.
augroup SpellGroups
	au!
	autocmd FileType md,markdown,txt, set spell
"	autocmd FileType md,markdown,txt, set formatoptions+=a
augroup END

" }}}
" Strip white space {{{3

" clear white space and return cursor to position. The * is all filetypes
function! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" }}}
" save and source {{{3

" Source my vimrc file when the full buffer is writen.
" automatically source $MYVIMRC or $DOTVIMRC when writing to a .vimrc file.
augroup vimrc
	autocmd!
	autocmd! BufWritePost $MYVIMRC,$DOTVIMRC source $MYVIMRC | echom "Reloaded $MYVIMRC"
augroup END

" }}}
" window equal {{{3
" If the terminal frame is reduce or expanded keep the windows equal.
au VimResized * :wincmd =
" }}}
" paste auto exit {{{3

" exit paste when past has been set.
autocmd InsertLeave * set nopaste

" au FocusGained,BufEnter * checktime

" }}}
" Colorscheme After {{{2

" This is supposed to make sure the adter colors get loaded.
autocmd ColorScheme common runtime "after/colors/" . expand("<amatch>") . ".vim"

" }}}
endif
" }}}
" Functions {{{2
" Fold Text {{{3

" Text width = 80
" Full width = 200
" Get each line from the foldstart.
" Create a seperator by subtracting the line length from the textwidth which is
" 80. The remainder is then the length needed. The end of the line displays the
" lines and depth. This is created as a string, the length of which is then
" subtracted from the seperator. This gives us the length of 80. Repeat is then
" used on empty space until the end of the line. 200 width subtracting the line
" length. This should always equal 80.
" There is a substitution on the fold marker \{\{\{. Adding in the seperator and
" the line_end.
" four lines are added for the marker and depth that is replaced.
function! MyFoldText()
	let line = getline(v:foldstart)
	let foldedlinecount = v:foldend - v:foldstart
	let separator = 80 - len(line)

	let line_end = foldedlinecount . ' ━ lines │ depth '
	let line_separator = repeat('─', separator - len(line_end)+4)
	let line = substitute(line," \{\{\{",' ' . line_separator . ' ' . line_end,'g')

	" Create the space for after the 80 text width
	let space = 200 - len(line)
	return toupper(line).'…'.repeat(" ",space)

endfunction

set foldtext=MyFoldText()

" }}}
" Number Toggle {{{3
" when setting paste this would be good to remove.
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
		set nonumber
		set nolist
	else
		set relativenumber
		set number
		set list
	endif

endfunction

nnoremap <f2> :call NumberToggle()<CR>
" }}}
" Notes Grep {{{3

" Get the line and column. This is so the cursor can be returend to the line.
" Search notes with vims built in grep. Use a word boundary to stop grep looking
" for words inside words like todo - autodone. If the string is not empty and
" the results of the search are not zero, open the quickfix and jump to first
" match,
function! NoteGreper()
	let l = line(".")
	let c = col(".")
	call inputsave()
	let name = input("Grep Notes:>")
	call inputrestore()
	if name != ''
		silent! execute 'vimgrep /\<' .name. '\>' . '/' expand("$HOME")."/.notes/**/*"
		if len(getqflist()) != 0
			copen
		else
			echom "\n"
			echom "Search returned" . " " . len(getqflist()) . " " . "results"
			call cursor(l, c)
		endif
	else
		call cursor(l, c)
	endif
endfunction

nnoremap <leader>n :call NoteGreper()<cr>

" }}}
" Project Grep {{{3

" Get the line and the column. Take a user input. Expand the path, this is so
" it can tested to make sure we are not in the home Directory. Grep for the
" search term. If there are results in the QuickFix open it.
" Grep CWD that are not in the $HOME. Safty for long recursive search.
function! ProjectGrep()
	let l = line(".")
	let c = col(".")
	call inputsave()
	let name = input("Grep Project:>")
	call inputrestore()
	let s:path = expand('<sfile>:p:h')
	if name != ''
		if s:path != expand("$HOME")
			silent! execute 'vimgrep /\<' .name. '\>/' '**/*'
			if len(getqflist()) != 0
				copen
			else
				echom "Search returned" . " " . len(getqflist()) . " " . "results"
				call cursor(l, c)
			endif
		else
			echom "\n"
			echom "Dir to large to search"
			call cursor(l, c)
		endif
	else
		call cursor(l, c)
	endif
endfunction

nnoremap <leader>g :call ProjectGrep()<cr>

" }}}
" }}}
" Plugins {{{1
" Airline {{{2

" Make sure airline theme is loaded.
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'

" }}}
" UltiSnippets {{{2


let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

"}}}
" Ctlp {{{2

" Set the directory to store the cache files
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_session_dir = '/.vim/sessions'
let g:ctrlp_extensions = ['sessions']

" Set this to 1 if you want CtrlP to scan for dotfiles and dotdirs: >
" ttb           - from top to the bottom
" btt           - from bottom to the top
" min:{n}       - show minimum {n} lines
" max:{n}       - show maximum {n} lines
" results:{n}   - list maximum {n} results
"               - (default: sync with max height).
" Note: you can quickly purge the cache by pressing <F5> while inside CtrlP
let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:10'

let g:ctrlp_show_hidden = 0
" The maximum depth of a directory tree to recurse into: >
let g:ctrlp_max_depth = 10
" Specify the number of recently opened files you want CtrlP to remember: >
let g:ctrlp_mruf_max = 250
" Exclude mru files
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux

" Relative results toggle. Return Mru results specific to the CWD
let g:ctrlp_mruf_relative = 1
let g:ctrlp_prompt_mappings = { 'ToggleMRURelative()': ['<F4>'] }

"}}}
" Git Gutter {{{2

" TODO: timeout.
set signcolumn=yes
set updatetime=100
let g:airline_powerline_fonts=1
let g:gitgutter_sign_added  = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified = '˟'

highlight GitGutterAdd    ctermfg=28
highlight GitGutterChange ctermfg=3
highlight GitGutterDelete ctermfg=1

" background sign column
hi SignColumn ctermfg=12 ctermbg=0 guifg=Cyan guibg=Grey

" }}}
" Nerdtree {{{2

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowBookmarks=1

" open close toggle
nnoremap <leader>x :NERDTreeToggle<CR>

" }}}
" matchit {{{2
" buitin but needs enabling
packadd! matchit " bundled default plugin
" }}}
" Redraw {{{1
autocmd VimEnter * redraw!
"}}}
