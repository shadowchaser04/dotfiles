set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="shadow"

"==============================================================================
" color
"==============================================================================
" ctermfg=24    == blue
" ctermfg=1     == dark-orange
" ctermfg=244   == dark-grey
" ctermfg=5     == pink
" ctermfg=130   == light-orange
"==============================================================================
"
" User Group {{{1
" ----------------------------------------------------------------------------
hi User1 ctermbg=235 ctermfg=24   
hi User2 ctermbg=24 ctermfg=white 
hi User3 ctermbg=235 ctermfg=white
" Misc {{{1
" -----------------------------------------------------------------------------
" dir dot color
hi Directory	ctermfg=white
" lines before numbers
hi NonText term=bold cterm=bold ctermfg=253

hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
hi SpecialKey	ctermfg=darkgreen
hi String       ctermfg=249
"}}}
" Search {{{1
" -----------------------------------------------------------------------------
hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
hi Search	cterm=NONE ctermfg=grey ctermbg=blue

hi FIX term=bold cterm=bold ctermfg=5 guifg=Blue guibg=Yellow
hi IMPORTANT term=bold cterm=bold ctermfg=5 guifg=Blue guibg=Yellow
hi NOTE term=bold cterm=bold ctermfg=5 guifg=Blue guibg=Yellow
hi TODO term=bold cterm=bold ctermfg=5 guifg=Blue guibg=Yellow

"}}}
" More {{{1
" -----------------------------------------------------------------------------
hi MoreMsg	ctermfg=darkgreen
hi ModeMsg	cterm=NONE ctermfg=brown
"}}}
" Colored Columns {{{1
" -----------------------------------------------------------------------------
hi LineNr       term=underline ctermfg=244 ctermbg=235 
hi CursorLineNr term=bold ctermfg=24 ctermbg=235
hi ColorColumn  term=reverse ctermbg=235 
"}}}
" Apearence {{{1
" -----------------------------------------------------------------------------
hi Title	ctermfg=5
hi VertSplit	cterm=reverse
hi WarningMsg	ctermfg=1
hi Question	ctermfg=green
hi WildMenu	ctermfg=0 ctermbg=3
hi Visual	cterm=reverse
hi VisualNOS	cterm=bold,underline
"}}}
" Status {{{1
" -----------------------------------------------------------------------------
hi StatusLine ctermfg=235 ctermbg=24
hi StatusLine	cterm=bold,reverse
hi StatusLineNC cterm=reverse
" }}}
" Folds {{{1
" -----------------------------------------------------------------------------
hi Folded	ctermfg=7 ctermbg=NONE
hi FoldColumn	ctermfg=7 ctermbg=NONE
"}}}
" Diff {{{1
" -----------------------------------------------------------------------------
hi DiffAdd	ctermbg=4
hi DiffChange	ctermbg=5
hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
hi DiffText	cterm=bold ctermbg=1
"}}}
" Groups - these also set other variables {{{1
" -----------------------------------------------------------------------------
hi Conditional  ctermfg=100 
hi Comment	ctermfg=238 
hi Constant	ctermfg=brown
hi Special	ctermfg=5
hi Identifier	ctermfg=24
hi Statement	ctermfg=130
hi PreProc	ctermfg=1
hi Type		ctermfg=130
hi Underlined	cterm=underline ctermfg=5
hi Ignore	cterm=bold ctermfg=7
hi Ignore	ctermfg=darkgrey
hi Error	cterm=bold ctermfg=7 ctermbg=1

hi rubyBeginEnd ctermfg=100

"}}}
"vim: sw=4

