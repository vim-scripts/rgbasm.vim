" Language:	Rednex Game-Boy assembler
" By:	Oyd E. Leven <oyd11@icomverse.com|oyd11@softhome.net>
" Ver: 0.01
" Creation date: 14-Jan-2000

" Remove any old syntax stuff hanging around
syn clear
syn case ignore

syn keyword gbAsmOp adc add and bit ccf cp cpl daa dec di ei ex halt _halt inc ld ldd ldi ldh ldio nop or pop push res reti rl rla rlc rlca rr rra rrc rrca rst sbc scf set sla sra srl stop sub swap xor

syn keyword gbReg a b c d e h l af bc de hl sp hld hli hl+

"syn match gbCond "(jp|jr|call|ret)\W(c|nc|z|nz)*"
" hmm... i donno how to make this a general rule..
" quick n'dirty is it then::

" still doesn't work!!
syn match gbCond "jp"

syn match gbCond "jp\Wc,"he=e-1
syn match gbCond "jp\Wnc,"he=e-1
syn match gbCond "jp\Wz,"he=e-1
syn match gbCond "jp\Wnz,"he=e-1

syn keyword gbCond jr

syn match gbCond "jr\Wc,"he=e-1
syn match gbCond "jr\Wnc,"he=e-1
syn match gbCond "jr\Wz,"he=e-1
syn match gbCond "jr\Wnz,"he=e-1


syn match gbCond "call"

syn match gbCond "call\Wc,"he=e-1
syn match gbCond "call\Wnc,"he=e-1
syn match gbCond "call\Wz,"he=e-1
syn match gbCond "call\Wnz,"he=e-1

syn match gbCond "ret"

syn match gbCond "ret\Wc,"he=e-1
syn match gbCond "ret\Wnc,"he=e-1
syn match gbCond "ret\Wz,"he=e-1
syn match gbCond "ret\Wnz,"he=e-1
" ^^ i don't like this mess 1 bit.. (and it doesn't work :( )

syn match asmLabel		"^[a-z_][a-z0-9_]*:"he=e-1
syn match asmLocalLabel		"^\.[a-z_][a-z0-9_]*:"he=e-1
syn match asmIdentifier 	"[a-z_][a-z0-9_]*"

syn match asmComment		";.*"hs=s+1 contains=asmTodo
syn match asmComment		"^\*.*"

syn region asmString		start=+"+ skip=+\\"+ end=+"+

syn keyword asmSettings		pusho popo opt

syn keyword asmTodo	contained todo fixme xxx warning danger note notice bug

syn keyword asmKeyword db dw ds section equ set rsreset rsset rb rw equs macro endm purge rept endr include incbin if else endc

" TODO: find out how to color these:
"syn keyword asmMacroOps ~ + - * / % << >> & | "^ != == <= >= < > && || !

syn keyword asmFunc printt printv printv printf fail warn div mul sin cos tan asin acos atan atan2 strlen strcat str cmp strin strsub strupr strlwr

syn keyword asmLink import xref export xdef global

syn keyword asmSpec _PI _RS _NARG __LINE__ __FILE__ __DATE__ __TIME__

syn match fixedNumber	"\d\\+.\d\+\>"

syn match hexNumber	"\$\x\+\>"
syn match octNumber	"&[0-7]+\>"
syn match decNumber	"\d\+\>"
syn match binNumber	"%[0-1]\+\>"
syn match gb2Number	"`[^; \t\n\r]*[; \t]"
" ^^ else we don't match dots :( we still don't at line edges..  
syn match gbNumber	"`[^; \t\n\r]*\>"

syn match asmSpec	"\\\d\+\>"

syn match asmSpec	"\<.*\\@\W"


"syn case match

if !exists("did_rgb_asm_syntax_inits")
  let did_rgb_asm_syntax_inits = 1

  " The default methods for highlighting.  Can be overridden later
"  hi link asmSection	Special
  hi link asmLabel	Label
  hi link asmString	String
  hi link asmComment	Comment
  hi link asmSettings	Statement
  hi link asmLocalLabel	Label
  hi link asmKeyword	PreProc
 hi link gbAsmOp Statement
 hi link asmMacroOps Statement
 hi link gbReg Identifier
 hi link gbCond Conditional
 hi link asmFunc Function
 hi link asmTodo Debug

"  hi link asmInclude	Include
"  hi link asmCond	PreCondit
"  hi link asmMacro	Macro

  hi link fixedNumber	Number
  hi link hexNumber	Number
  hi link decNumber	Number
  hi link octNumber	Number
  hi link binNumber	Number
  hi link gbNumber	Number
  hi link gb2Number	Number
  hi link asmSpec	Special

  " My default color overrides:
"  hi asmSpecialComment ctermfg=red
"  hi asmIdentifier ctermfg=lightcyan
"  hi asmType ctermbg=black ctermfg=brown

endif

let b:current_syntax = "rgbasm"

" proboably a very wrong place to put this::
""

"abbreviates:

" insert mode:
" draw a GameBoy picture template:
iab _gbpic ;   12345678dw `........ ; 1dw `........ ; 2dw `........ ; 3dw `........ ; 4dw `........ ; 5dw `........ ; 6dw `........ ; 7dw `........ ; 8

" line seperator:
iab ;- ;-----------------------------------------------------------------------

" command mode:
" comment current block:
cab cm s/^/ ;/
" uncomment block:
cab uncm s/^\s*[;]\+//

" include
iab #i include
" binary include
iab #b incbin

