"==============================================================================
" plain text color
"==============================================================================
" Language: text
" Maintainer: shadow chaser
" Latest Revision: 12/7/2018
"==============================================================================

if exists("b:current_syntax")
  finish
endif

"------------------------------------------------------------------------------
" Regex for Title when all capitalised, title wrapper (----) and list numbers.
syn match beginSentence_st /\v[A-Z][A-Z]{1,}/
syn match headershash_st /\v^[#]{1,5}/
syn match titleHeader_st /^\--.*/
syn match timestamp_st /\v[0-9]{1,4}\-[0-9]{1,2}\-[0-9]{1,2}/
syn match listNumber_st /^[1-9.]*\./
syn match listSymbol_st /^\(\s\s\s\s\|\t\)\(\-\|\*\)/
"------------------------------------------------------------------------------
"  Setup syntax highlighting
"------------------------------------------------------------------------------
let b:current_syntax = "text"

hi def beginSentence_st     ctermfg=130
hi def headershash_st       ctermfg=1
hi def timestamp_st         ctermfg=24
hi def titleHeader_st       ctermfg=1
hi def listNumber_st        ctermfg=24
hi def listSymbol_st        ctermfg=24
