hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
set t_Co=256
let g:colors_name = "new_overwatch"
"colors:
"	Black	16
"	Red		196
"	Green	46
"	Blue	21
"	Yellow	226
"	Purple	201
"	Cyan	51
"	White	231
"	Gray95	59
"
highlight clear

"Basic text
highlight Comment			guifg=#45ea22			cterm=none
highlight Normal			guifg=#d9cca9			cterm=none

"Basic Types
highlight Constant			guifg=#bc47bc			cterm=none 
highlight Number			guifg=#ff8800			cterm=none
highlight Float				guifg=#98ffff			cterm=none
highlight Boolean			guifg=#98ffff			cterm=none
highlight String			guifg=#c23f49			cterm=none
highlight Character			guifg=#f99e1a			cterm=none

"Variables and Functions
highlight Identifier 		guifg=#f99e1a			cterm=none
highlight Function			guifg=#a350f9			cterm=none

"Code
highlight Statement  		guifg=#				cterm=none
highlight Conditional		ctermfg=21				cterm=none
highlight Repeat			ctermfg=21				cterm=none
highlight Label				ctermfg=21				cterm=none
highlight Operator			guifg=#5168ae			cterm=none
highlight Keyword			ctermfg=21				cterm=none
highlight Exception			ctermfg=21				cterm=none

"Pre processed code
"highlight PreProc			ctermfg=46				cterm=none
highlight Include			guifg=#98ffff				cterm=none
highlight Define			guifg=#a350f9			cterm=none
highlight Macro				guifg=#bc47bc			cterm=none
"highlight Precondit			ctermfg=46				cterm=none

"Classes and Structures
highlight Type				guifg=#a350f9				cterm=none
highlight StorageClass		guifg=#a350f9				cterm=none
highlight Structure			guifg=#a350f9				cterm=none
highlight Typedef			guifg=#a350f9   			cterm=none

"Special Text
highlight Special			ctermfg=21				cterm=none
highlight SpecialChar		ctermfg=21				cterm=none
highlight Tag				ctermfg=21				cterm=none
highlight Delimiter			ctermfg=21				cterm=none
highlight SpecialComment	guifg=#45ea22				cterm=none
highlight Debug				ctermfg=21				cterm=none

"Others
highlight Underlined		guifg=#c23f49			cterm=none
highlight Ignore			ctermfg=21				cterm=none
highlight Error				ctermfg=16	ctermbg=196	cterm=none
highlight Todo				ctermfg=51	ctermbg=16	cterm=none

"Vi-related
highlight Cursor			ctermfg=231	ctermbg=59	cterm=none
highlight SpecialKey		ctermfg=201				cterm=none
highlight ErrorMsg			ctermfg=231	ctermbg=196	cterm=none
highlight Directory  		ctermfg=21				cterm=bold
highlight Search			ctermfg=16	ctermbg=51	cterm=none
highlight Visual			ctermbg=59				cterm=none
highlight WildMenu			ctermfg=231				cterm=none

"Pmenu
"highlight Pmenu				ctermfg=16	ctermbg=46	cterm=bold
highlight PmenuSel			ctermfg=16	ctermbg=21	cterm=bold

" Links:

highlight link TermCursor Cursor	
highlight link CursorIM Cursor
highlight link CursorColumn Cursor
"highlight link CursorLine Cursor
highlight link lCursor ursor
