" Vim syntax file
" Language:     ACT
" Maintainer:   Luis Zuniga
" Filetype:     *.act

" Prevent reloading
if exists("b:current_syntax")
  finish
endif

" ── ACT-specific keywords ─────────────────────────────────────────────────────

" Process/channel/namespace declarations
syn keyword actStructure    defproc defchan namespace template defcell function
syn keyword actStatement    export import open chp prs sizing dataflow hse self GND Vdd methods spec

" Types native to ACT
syn keyword actType         chan pint pbool bool int 

" Labels / special keywords
syn keyword actLabel        case default

" Operators
syn keyword actOperator     sizeof
syn match   actOperator     display "\(->\|=>\|#>\)"

" Todo markers in comments
syn keyword actTodo         contained TODO FIXME XXX

" Boolean constants
syn keyword actBoolean      true false

" ── Comments ──────────────────────────────────────────────────────────────────
syn cluster actCommentGroup contains=actTodo
syn region  actCommentL     start="//"  skip="\\$" end="$"    keepend contains=@actCommentGroup
syn region  actComment      start="/\*" end="\*/"             contains=@actCommentGroup

" ── Strings ───────────────────────────────────────────────────────────────────
syn match  actSpecial       display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region actString        start=+"+   skip=+\\\\\|\\"+ end=+"+  contains=actSpecial
syn match  actCharacter     "'[^\\]'"
syn match  actCharacter     "'[^']*'"   contains=actSpecial

" ── Numbers ───────────────────────────────────────────────────────────────────
syn case ignore
syn match  actNumber        display "\<[0-9]\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match  actNumber        display "\<0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
syn match  actFloat         display "\<[0-9]\+\.[0-9]*\(e[-+]\=[0-9]\+\)\=[fl]\=\>"
syn case match

" ── Preprocessor (ACT uses similar #include / #define) ────────────────────────
syn region actIncluded      display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match  actIncluded      display contained "<[^>]*>"
syn match  actInclude       display "^\s*#\s*include\>\s*["<]" contains=actIncluded
syn region actDefine        start="^\s*#\s*\(define\|undef\)\>" skip="\\$" end="$" end="//"me=s-1
syn region actPreCondit     start="^\s*#\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" end="//"me=s-1
syn match  actPreCondit     display "^\s*#\s*\(else\|endif\)\>"

" ── Highlighting links ────────────────────────────────────────────────────────
hi def link actStructure    Statement
hi def link actStatement    Statement
hi def link actType         Statement
" hi def link actStructure    Structure
" hi def link actStatement    Statement
" hi def link actType         Type
" ^ change so that it resembles VS Code highlighting
hi def link actLabel        Label
hi def link actOperator     Operator
hi def link actTodo         Todo
hi def link actCommentL     Comment
hi def link actComment      Comment
hi def link actSpecial      SpecialChar
hi def link actString       String
hi def link actCharacter    Character
hi def link actNumber       Number
hi def link actFloat        Float
hi def link actBoolean      Boolean
hi def link actInclude      Include
hi def link actIncluded     String
hi def link actDefine       Macro
hi def link actPreCondit    PreCondit

" ── Done ──────────────────────────────────────────────────────────────────────
let b:current_syntax = "act"  
