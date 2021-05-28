let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
cnoremap <C-L> <End>
cnoremap <C-H> <Home>
map! <D-v> *
snoremap <silent>  c
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippetOrJump()
nnoremap 	 	zz
nnoremap <NL> g;
nnoremap  g,
nnoremap  zz
nnoremap <silent>  :CtrlP
snoremap  "_c
nnoremap  ms :call MakeSession()
nnoremap  g :call ProjectGrep()
nnoremap  n :call NoteGreper()
nnoremap  bd :CtrlPBookmarkDir
nnoremap  b :CtrlPBuffer
nnoremap  m :CtrlPMRUFiles
nnoremap  z zMzvzz
nnoremap  x :NERDTreeToggle
nnoremap  se :mks %:h/session.vim
nnoremap  fp gq}
nnoremap  es :UltiSnipsEdit
nnoremap  ea :vsplit $MYVIM/abbrevs.vim
nnoremap  ed :vsplit $MYVIM/custom-dictionary.utf-8.add
nnoremap  er :vsplit $MYVIMRC
nnoremap  	 :set et! list!
nnoremap    :noh
nnoremap  ul gUU
nnoremap  uw gUiw
nnoremap  s :%s/\<\>/
nnoremap  f :vimgrep /\<\(def\|^class\|^module\)\>/ % | :copen
nnoremap <silent>  / : execute 'vimgrep / '.@/.'/g %':copen
nnoremap $ <Nop>
nnoremap & :'{,'}s/=expand('<cword>')/
vmap '' :w !pbcopy
nnoremap * *
nnoremap 0 <Nop>
nnoremap ? :vimgrep /\<=expand('<cword>')\>/ % | :copen
nnoremap H ^
nnoremap K <Nop>
nnoremap L g_
nnoremap N Nzzzv
nnoremap S i^mwgk:silent! s/\v+$//:noh`w
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
noremap j gj
noremap k gk
nnoremap n nzzzv
nnoremap s <Nop>
nnoremap <silent> <Plug>GitGutterPreviewHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterPreviewHunk to <Plug>(GitGutterPreviewHunk)')
nnoremap <silent> <Plug>(GitGutterPreviewHunk) :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterUndoHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterUndoHunk to <Plug>(GitGutterUndoHunk)')
nnoremap <silent> <Plug>(GitGutterUndoHunk) :GitGutterUndoHunk
nnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
nnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
xnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
xnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\call gitgutter#utility#warn('Please change your map \<Plug>GitGutterPrevHunk to \<Plug>(GitGutterPrevHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterPrevHunk) &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\call gitgutter#utility#warn('Please change your map \<Plug>GitGutterNextHunk to \<Plug>(GitGutterNextHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterNextHunk) &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
xnoremap <silent> <Plug>(GitGutterTextObjectOuterVisual) :call gitgutter#hunk#text_object(0)
xnoremap <silent> <Plug>(GitGutterTextObjectInnerVisual) :call gitgutter#hunk#text_object(1)
onoremap <silent> <Plug>(GitGutterTextObjectOuterPending) :call gitgutter#hunk#text_object(0)
onoremap <silent> <Plug>(GitGutterTextObjectInnerPending) :call gitgutter#hunk#text_object(1)
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
snoremap <C-R> "_c
snoremap <silent> <C-H> c
snoremap <silent> <Del> c
snoremap <silent> <BS> c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
nnoremap <silent> <C-P> :CtrlP
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
nnoremap <F2> :call NumberToggle()
nnoremap <F3> :Scratch
nnoremap <C-I> 	zz
nnoremap <C-O> zz
nnoremap <S-Right> :vertical resize -2
nnoremap <S-Left> :vertical resize +2
nnoremap <S-Down> :resize -2
nnoremap <S-Up> :resize +2
nnoremap <Right> l
nnoremap <Left> h
nnoremap <Down> j
nnoremap <Up> k
nnoremap <C-K> g,
nnoremap <C-J> g;
xmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
cnoremap  <Home>
inoremap <silent> 	 =UltiSnips#ExpandSnippetOrJump()
cnoremap  <End>
inoremap <expr>  pumvisible() ? "\" : "\"
inoremap jj 
iabbr writeing writing
iabbr withold withhold
iabbr wilfull wilful
iabbr wellfare welfare
iabbr wierd weird
iabbr wether whether
iabbr visious vicious
iabbr vehical vehicle
iabbr useable usable
iabbr upholstry upholstery
iabbr untill until
iabbr underate underrate
iabbr tyrany tyranny
iabbr twelth twelfth
iabbr tommorow tomorrow
iabbr tomatos tomatoes
iabbr synonomous synonymous
iabbr surprize surprise
iabbr supercede supersede
iabbr succesful successful
iabbr speach speech
iabbr skilfull skilful
iabbr similer similar
iabbr sargent sergeant
iabbr seperate separate
iabbr sieze seize
iabbr secretery secretary
iabbr rime rhyme
iabbr repitition repetition
iabbr religous religious
iabbr relevent relevant
iabbr refrence reference
iabbr refered referred
iabbr recomend recommend
iabbr reciept receipt
iabbr recieve receive
iabbr realy really
iabbr readible readable
iabbr quarentine quarantine
iabbr publically publicly
iabbr prophesy prophecy
iabbr prufe proof
iabbr pronounciation pronunciation
iabbr promiss promise
iabbr professer professor
iabbr privelege privilege
iabbr principal principle
iabbr presance presence
iabbr preceed precede
iabbr potatos potatoes
iabbr posession possession
iabbr playright playwright
iabbr plagerize plagiarize
iabbr personell personnel
iabbr perseverence perseverance
iabbr percieve perceive
iabbr passtime pastime
iabbr parliment parliament
iabbr outragous outrageous
iabbr orignal original
iabbr ommisio omission
iabbr occured occurred
iabbr occurrance occurrence
iabbr occasionaly occasionally
iabbr occassion occasion
iabbr noticable noticeable
iabbr nieghbor neighbor
iabbr neice niece
iabbr neccessary necessary
iabbr mispell misspell
iabbr mischievious mischievous
iabbr miniscule minuscule
iabbr miniture miniature
iabbr millenium millennium
iabbr momento memento
iabbr medeval medieval
iabbr maintainance maintenance
iabbr lightening lightning
iabbr liberry library
iabbr liason liaison
iabbr liesure leisure
iabbr kernal kernel
iabbr judgement judgment
iabbr ewelery jewelry
iabbr inteligence intelligence
iabbr innoculate inoculate
iabbr indispensible indispensable
iabbr independant independent
iabbr imediately immediately
iabbr immitate imitate
iabbr ignorence ignorance
iabbr humerous humorous
iabbr heirarchy hierarchy
iabbr heigth height
iabbr hasnt hasn't
iabbr gratefull grateful
iabbr guage gauge
iabbr fulfil fullfil
iabbr freind friend
iabbr foriegn foreign
iabbr flourescent fluorescent
iabbr firey fiery
iabbr facinating fascinating
iabbr extreem extreme
iabbr experiance experience
iabbr existance existence
iabbr exilerate exhilarate
iabbr excede exceed
iabbr equiptment equipment
iabbr embarass embarrass
iabbr esculaing escalating
iabbr dumbbell dumbell
iabbr drunkeness drunkenness
iabbr disasterous disastrous
iabbr disapoint disappoint
iabbr dilema dilemma
iabbr diffrence difference
iabbr desparate desperate
iabbr definitly definitely
iabbr definate definite
iabbr dacquiri daiquiri
iabbr decieve deceive
iabbr doesnt doesn't
iabbr coolly cooly
iabbr contraversy controversy
iabbr concensus consensus
iabbr concious conscious
iabbr consciencious conscientious
iabbr congradulate congratulate
iabbr conceed concede
iabbr commited committed
iabbr comming coming
iabbr colum column
iabbr collaegue colleague
iabbr cheif chief
iabbr changable changeable
iabbr cemetary cemetery
iabbr cauhgt caught
iabbr catagory category
iabbr Carribean Caribbean
iabbr capital capitol
iabbr camoflage camouflage
iabbr calender calendar
iabbr couldnt couldn't
iabbr business buisness
iabbr bellweather bellwether
iabbr beleive believe
iabbr begining beginning
iabbr becomeing becoming
iabbr becuase because
iabbr athies atheist
iabbr arguement argument
iabbr artic arctic
iabbr apparant apparent
iabbr anually annually
iabbr amatuer amateur
iabbr allmost almost
iabbr allegaince allegiance
iabbr agressive aggressive
iabbr agression aggression
iabbr effect affect
iabbr adviseable advisable
iabbr adultary adultery
iabbr adress address
iabbr acrage acreage
iabbr aquit acquit
iabbr aquire acquire
iabbr acheive achieve
iabbr acceptible acceptable
iabbr absense absence
iabbr whne when
iabbr soem some
iabbr ahve have
iabbr thne then
iabbr thsi this
iabbr adn and
iabbr teh the
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backup
set backupdir=~/.vim/tmp/backup//
set clipboard=unnamed
set complete=.,w,b,u,t,i,kspell
set completeopt=menuone,noinsert
set completepopup=height:10,width:60,highlight:InfoPopup
set confirm
set dictionary=/usr/share/dict/words
set diffopt=vertical
set directory=~/.vim/tmp/swap//
set fileencodings=ucs-bom,utf-8,default,latin1
set fillchars=diff:⣿,vert:▏
set foldlevelstart=0
set formatoptions=tcqojn
set gdefault
set helplang=en
set hidden
set highlight=8:SpecialKey,~:EndOfBuffer,@:NonText,d:Directory,e:ErrorMsg,i:IncSearch,l:Search,m:MoreMsg,M:ModeMsg,n:LineNr,a:LineNrAbove,b:LineNrBelow,N:CursorLineNr,r:Question,s:StatusLine,S:StatusLineNC,c:VertSplit,t:Title,v:Visual,V:VisualNOS,w:WarningMsg,W:WildMenu,f:Folded,F:FoldColumn,A:DiffAdd,C:DiffChange,D:DiffDelete,T:DiffText,>:SignColumn,-:Conceal,B:SpellBad,P:SpellCap,R:SpellRare,L:SpellLocal,+:Pmenu,=:PmenuSel,x:PmenuSbar,X:PmenuThumb,*:TabLine,#:TabLineSel,_:TabLineFill,!:CursorColumn,.:CursorLine,o:ColorColumn,q:QuickFixLine,z:StatusLineTerm,Z:StatusLineTermNC,@:ColorColumn
set history=1000
set hlsearch
set ignorecase
set incsearch
set nojoinspaces
set laststatus=2
set lazyredraw
set listchars=tab:│\ ,trail:���,extends:❯,precedes:❮
set matchtime=3
set pastetoggle=<F1>
set preserveindent
set ruler
set runtimepath=~/.vim,~/.vim/pack/myplugins/start/vim-gitgutter,~/.vim/pack/myplugins/start/vim-commentary,~/.vim/pack/myplugins/start/vim-colors-solarized,~/.vim/pack/myplugins/start/vim-airline,~/.vim/pack/myplugins/start/ultisnips,~/.vim/pack/myplugins/start/nerdtree,~/.vim/pack/myplugins/start/ctrlp.vim,/usr/share/vim/vimfiles,/usr/share/vim/vim82,~/.vim/pack/myplugins/start/ultisnips/after,/usr/share/vim/vimfiles/after,~/.vim/after
set scrolloff=999
set shiftround
set shiftwidth=4
set shortmess=filnxtToOSI
set showbreak=↪
set showcmd
set showmatch
set noshowmode
set sidescroll=1
set sidescrolloff=100
set smartcase
set softtabstop=4
set spellfile=~/.vim/custom-dictionary.utf-8.add
set splitbelow
set splitright
set noswapfile
set tabstop=4
set tags=tags;/
set textwidth=79
set title
set ttimeoutlen=0
set undodir=~/.vim/tmp/undo//
set undofile
set updatetime=100
set visualbell
set wildignore=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.o,*.obj,*.exe,*.dll,*.manifest,*/tmp/*,*.so,*.swp,*.zip,*.spl,*.sw?,*.DS_Store
set wildmenu
set wildmode=longest,list,full
set window=0
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Scratch/tmp
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
edit ~/Scratch/tmp/bookclub.md
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/.vimrc
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer>  hp <Plug>(GitGutterPreviewHunk)
nmap <buffer>  hu <Plug>(GitGutterUndoHunk)
nmap <buffer>  hs <Plug>(GitGutterStageHunk)
xmap <buffer>  hs <Plug>(GitGutterStageHunk)
nmap <buffer> [c <Plug>(GitGutterPrevHunk)
nmap <buffer> ]c <Plug>(GitGutterNextHunk)
xmap <buffer> ac <Plug>(GitGutterTextObjectOuterVisual)
omap <buffer> ac <Plug>(GitGutterTextObjectOuterPending)
xmap <buffer> ic <Plug>(GitGutterTextObjectInnerVisual)
omap <buffer> ic <Plug>(GitGutterTextObjectInnerPending)
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal autoindent
setlocal backupcopy=
setlocal nobinary
set breakindent
setlocal breakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=+1
setlocal colorcolumn=+1
setlocal comments=fb:*,fb:-,fb:+,n:>
setlocal commentstring=<!--%s-->
setlocal complete=.,w,b,u,t,i,kspell
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal noexpandtab
if &filetype != 'markdown'
setlocal filetype=markdown
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
set foldmethod=marker
setlocal foldmethod=marker
setlocal foldminlines=1
set foldnestmax=5
setlocal foldnestmax=5
set foldtext=MyFoldText()
setlocal foldtext=MyFoldText()
setlocal formatexpr=
setlocal formatoptions=jtcqlna
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\|^[-*+]\\s\\+\\|^\\[^\\ze[^\\]]\\+\\]:
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=htmlcomplete#CompleteTags
setlocal path=
setlocal preserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal noscrollbind
setlocal scrolloff=-1
setlocal shiftwidth=4
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=yes
setlocal signcolumn=yes
setlocal nosmartindent
setlocal softtabstop=4
set spell
setlocal spell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=~/.vim/custom-dictionary.utf-8.add
setlocal spelllang=en
setlocal spelloptions=
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'markdown'
setlocal syntax=markdown
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=79
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
let s:l = 3 - ((2 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
3
normal! 037|
tabnext 1
badd +0 ~/Scratch/tmp/bookclub.md
badd +1 ~/Scratch/tmp/mybook.md
badd +855 ~/.vimrc
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOSI
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
