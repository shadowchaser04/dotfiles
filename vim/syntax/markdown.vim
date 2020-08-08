"==============================================================================
" markdown color
"==============================================================================
" ctermfg=24    == blue
" ctermfg=1     == dark-orange
" ctermfg=244   == dark-grey
" ctermfg=5     == pink
" ctermfg=130   == light-orange
"==============================================================================

syn match markdownlistSymbol /^\(\s\s\s\s\|\t\)\(\-\|\*\)/
syn match markdownTimestamp /\v^([0-9]|-)*\:/

hi markdownH1  term=bold        ctermfg=white
hi markdownH2  term=bold        ctermfg=white
hi markdownH3  term=bold        ctermfg=white
hi markdownH4  term=bold        ctermfg=white
hi markdownH5  term=bold        ctermfg=white
hi markdownH6  term=bold        ctermfg=white

hi markdownListSymbol           ctermfg=24
hi markdownHeadingDelimiter term=standout ctermfg=1
hi markdownTimestamp            ctermfg=24

hi markdownListItem             ctermfg=24
hi markdownListMarker           ctermfg=24
hi markdownOrderedListMarker    ctermfg=24

hi markdownBoldDelimiter        ctermfg=244
hi markdownItalicDelimiter      ctermfg=244
hi markdownBoldItalicDelimiter  ctermfg=244

hi markdownBold                 ctermfg=white
hi markdownItalic               ctermfg=white
hi markdownBoldItalic           ctermfg=white

hi markdownUrlTitleDelimiter    ctermfg=5
hi markdownLinkTextDelimiter    ctermfg=5


"------------------------------------------------------------------------------
" User unset colors
"------------------------------------------------------------------------------
" hi markdownListMarker 
" hi markdownOrderedListMarker 

" hi markdownLineBreak 
" hi markdownLineStart 
" hi markdownCodeBlock 
" hi markdownBlockquote 

" hi markdownRule   
" hi markdownError  
" hi markdownValid  
" hi markdownEscape 

" hi markdownLinkText 
" hi markdownHeadingRule 
" hi markdownAutomaticLink 
" hi markdownIdDeclaration 

" hi markdownId     
" hi markdownCode   
" hi markdownUrl    
" hi markdownUrlTitle 
" hi markdownLink   

" hi markdownIdDelimiter 
" hi markdownCodeDelimiter 
" hi markdownUrlDelimiter 
" hi markdownLinkDelimiter 

" hi markdownFootnote 
" hi markdownFootnoteDefinition 
