
" -----------------------------------------------------------------------------
" File: aurora.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/aurora
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='aurora'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:aurora_bold')
  let g:aurora_bold=1
endif
if !exists('g:aurora_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:aurora_italic=1
  else
    let g:aurora_italic=0
  endif
endif
if !exists('g:aurora_undercurl')
  let g:aurora_undercurl=1
endif
if !exists('g:aurora_underline')
  let g:aurora_underline=1
endif
if !exists('g:aurora_inverse')
  let g:aurora_inverse=1
endif

if !exists('g:aurora_guisp_fallback') || index(['fg', 'bg'], g:aurora_guisp_fallback) == -1
  let g:aurora_guisp_fallback='NONE'
endif

if !exists('g:aurora_improved_strings')
  let g:aurora_improved_strings=0
endif

if !exists('g:aurora_improved_warnings')
  let g:aurora_improved_warnings=0
endif

if !exists('g:aurora_termcolors')
  let g:aurora_termcolors=256
endif

if !exists('g:aurora_invert_indent_guides')
  let g:aurora_invert_indent_guides=0
endif

if exists('g:aurora_contrast')
  echo 'g:aurora_contrast is deprecated; use g:aurora_contrast_light and g:aurora_contrast_dark instead'
endif

if !exists('g:aurora_contrast_dark')
  let g:aurora_contrast_dark='medium'
endif

if !exists('g:aurora_contrast_light')
  let g:aurora_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

"-------------------------------------------------------------------------------------

" fill it with absolute colors
let s:gb.dark0_hard  = ['#00081b', 234]     " 29-32-33
let s:gb.dark0       = ['#00081b', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#0c0d10', 236]     " 50-48-47
let s:gb.dark1       = ['#171a29', 237]     " 60-56-54
let s:gb.dark2       = ['#232a3d', 239]     " 80-73-69
let s:gb.dark3       = ['#232a3d', 241]     " 102-92-84
let s:gb.dark4       = ['#616e88', 243]     " 124-111-100
let s:gb.dark4_256   = ['#616e88', 243]     " 124-111-100
let s:gb.gray_245    = ['#616e88', 245]     " 146-131-116
let s:gb.gray_244    = ['#616e88', 244]     " 146-131-116

let s:gb.light0_hard = ['#d4fdf6', 230]     " 249-245-215
let s:gb.light0      = ['#d4faf4', 229]     " 253-244-193
let s:gb.light0_soft = ['#d4feff', 228]     " 242-229-188
let s:gb.light1      = ['#d4fdf6', 223]     " 235-219-178
let s:gb.light2      = ['#d4faf4', 250]     " 213-196-161
let s:gb.light3      = ['#d4feff', 248]     " 189-174-147
let s:gb.light4      = ['#d4fafd', 246]     " 168-153-132
let s:gb.light4_256  = ['#d4f4fd', 246]     " 168-153-132

let s:gb.bright_purple   = ['#8400ff', 157]     " 177-98-134
let s:gb.bright_red      = ['#b877db', 92]     " 251-73-52
let s:gb.bright_yellow   = ['#b6aef4', 183]     " 250-189-47
let s:gb.bright_aqua     = ['#6da3df', 74]     " 142-192-124
let s:gb.bright_green    = ['#6bdfe6', 45]     " 184-187-38
let s:gb.bright_orange   = ['#25b0bc', 159]     " 254-128-25
let s:gb.bright_blue     = ['#d2d4de', 177]     " 131-165-152
let s:gb.bright_cyan     = ['#45f3d3', 159]     " 254-128-25
let s:gb.bright_magenta  = ['#fab38e', 159]     " 254-128-25

let s:gb.neutral_purple  = ['#8400ff', 157]     " 177-98-134
let s:gb.neutral_red     = ['#cd1bfd', 92]     " 251-73-52
let s:gb.neutral_yellow  = ['#c2c2ff', 183]     " 250-189-47
let s:gb.neutral_green   = ['#46d9ff', 45]     " 184-187-38
let s:gb.neutral_aqua    = ['#20bbfc', 74]     " 142-192-124
let s:gb.neutral_blue    = ['#9eddff', 177]     " 131-165-152
let s:gb.neutral_orange  = ['#9ce2fb', 159]     " 254-128-25
let s:gb.neutral_cyan    = ['#77ffd7', 159]     " 254-128-25
let s:gb.neutral_magenta = ['#42c09d', 159]     " 254-128-25


let s:gb.faded_red       = ['#ce63f9', 92]      " 157-0-6
let s:gb.faded_yellow    = ['#ccbbff', 183]     " 181-118-20
let s:gb.faded_aqua      = ['#44b6e6', 74]      " 66-123-88
let s:gb.faded_green     = ['#41e1ff', 45]     " 121-116-14
let s:gb.faded_blue      = ['#9ce2fb', 177]      " 7-102-120
let s:gb.faded_orange    = ['#b2ddec', 159]     " 175-58-3
let s:gb.faded_cyan      = ['#96edd3', 159]     " 254-128-25
let s:gb.faded_magenta   = ['#62c1a6', 159]     " 254-128-25

" Error
let s:gb.bright_pink    = ['#ff00f4', 159]     " 254-128-25


" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:aurora_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:aurora_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:aurora_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:aurora_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:aurora_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:aurora_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:aurora_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red     = s:gb.bright_red
  let s:green   = s:gb.bright_green
  let s:yellow  = s:gb.bright_yellow
  let s:blue    = s:gb.bright_blue
  let s:purple  = s:gb.bright_purple
  let s:aqua    = s:gb.bright_aqua
  let s:orange  = s:gb.bright_orange
  let s:cyan    = s:gb.bright_cyan
  let s:magenta = s:gb.bright_magenta
  let s:pink   = s:gb.bright_pink

else
  let s:bg0  = s:gb.light0
  if g:aurora_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:aurora_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
  let s:cyan   = s:gb.faded_cyan
endif

" reset to 16 colors fallback
if g:aurora_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red     = s:red
let s:gb.green   = s:green
let s:gb.yellow  = s:yellow
let s:gb.blue    = s:blue
let s:gb.purple  = s:purple
let s:gb.aqua    = s:aqua
let s:gb.orange  = s:orange
let s:gb.cyan    = s:cyan
let s:gb.magenta = s:magenta
let s:gb.pink   = s:pink

" }}}
" Setup Terminal Colors For Neovim: {{{


if has('nvim')
  " let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_0 = s:gb.dark1[0]
  let g:terminal_color_8 = s:gb.bright_yellow[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:gb.bright_yellow[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:gb.bright_yellow[0]

  let g:terminal_color_3 = s:gb.bright_purple[0]
  let g:terminal_color_11 = s:gb.bright_blue[0]

  let g:terminal_color_4 = s:gb.bright_yellow[0]
  let g:terminal_color_12 = s:gb.bright_blue[0]

  let g:terminal_color_5 = s:gb.bright_blue[0]
  let g:terminal_color_13 = s:gb.bright_red[0]

  let g:terminal_color_6 = s:gb.bright_green[0]
  let g:terminal_color_14 = s:gb.bright_red[0]

  let g:terminal_color_7 = s:gb.bright_red[0]
  let g:terminal_color_15 = s:fg1[0]
endif


" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:aurora_hls_cursor')
  let s:hls_cursor = get(s:gb, g:aurora_hls_cursor)
endif

let s:number_column = s:none
if exists('g:aurora_number_column')
  let s:number_column = get(s:gb, g:aurora_number_column)
endif

let s:sign_column = s:bg0

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:aurora_sign_column')
    let s:sign_column = get(s:gb, g:aurora_sign_column)
  endif
endif

let s:color_column = s:bg0
if exists('g:aurora_color_column')
  let s:color_column = get(s:gb, g:aurora_color_column)
endif

let s:vert_split = s:bg0
if exists('g:aurora_vert_split')
  let s:vert_split = get(s:gb, g:aurora_vert_split)
endif

let s:invert_signs = ''
if exists('g:aurora_invert_signs')
  if g:aurora_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:aurora_invert_selection')
  if g:aurora_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:aurora_invert_tabline')
  if g:aurora_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:aurora_italicize_comments')
  if g:aurora_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:aurora_italicize_strings')
  if g:aurora_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:aurora_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:aurora_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Aurora Hi Groups: {{{

" memoize common hi groups
call s:HL('AuroraFg0', s:fg0)
call s:HL('AuroraFg1', s:fg1)
call s:HL('AuroraFg2', s:fg2)
call s:HL('AuroraFg3', s:fg3)
call s:HL('AuroraFg4', s:fg4)
call s:HL('AuroraGray', s:gray)
call s:HL('AuroraBg0', s:bg0)
call s:HL('AuroraBg1', s:bg1)
call s:HL('AuroraBg2', s:bg2)
call s:HL('AuroraBg3', s:bg3)
call s:HL('AuroraBg4', s:bg4)

call s:HL('AuroraRed', s:red)
call s:HL('AuroraRedBold', s:red, s:none, s:bold)
call s:HL('AuroraGreen', s:green)
call s:HL('AuroraGreenBold', s:green, s:none, s:bold)
call s:HL('AuroraYellow', s:yellow)
call s:HL('AuroraYellowBold', s:yellow, s:none, s:bold)
call s:HL('AuroraBlue', s:blue)
call s:HL('AuroraBlueBold', s:blue, s:none, s:bold)
call s:HL('AuroraPurple', s:purple)
call s:HL('AuroraPurpleBold', s:purple, s:none, s:bold)
call s:HL('AuroraAqua', s:aqua)
call s:HL('AuroraAquaBold', s:aqua, s:none, s:bold)
call s:HL('AuroraOrange', s:orange)
call s:HL('AuroraOrangeBold', s:orange, s:none, s:bold)
call s:HL('AuroraCyan', s:cyan)
call s:HL('AuroraCyanBold', s:cyan, s:none, s:bold)
call s:HL('AuroraMagenta', s:magenta)
call s:HL('AuroraMagentaBold', s:magenta, s:none, s:bold)
call s:HL('AuroraPink', s:pink)
call s:HL('AuroraPinkBold', s:pink, s:none, s:bold)

call s:HL('AuroraRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('AuroraGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('AuroraYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('AuroraBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('AuroraPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('AuroraAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('AuroraCyanSign', s:cyan, s:sign_column, s:invert_signs)
call s:HL('AuroraMagentaSign', s:magenta, s:sign_column, s:invert_signs)
call s:HL('AuroraOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:none)
endif

hi! link NonText AuroraBg2
hi! link SpecialKey AuroraBg2
hi! link TagbarAccessProtected AuroraOrange
hi! link TagbarVisibilityPrivate AuroraYellow
hi! link TagbarVisibilityPublic AuroraBlue
hi! link FloatermBorder AuroraYellow


call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg2, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory AuroraGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title AuroraGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:pink, s:bg0)

" More prompt: -- More --
hi! link MoreMsg AuroraYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg AuroraYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question AuroraOrangeBold
" Warning messages
hi! link WarningMsg AuroraRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:aurora_improved_strings == 0
  hi! link Special AuroraYellow
else
  call s:HL('Special', s:green, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
" call s:HL('Error', s:purple, s:none, s:bold . s:inverse)
call s:HL('Error', s:pink, s:none, s:bold )

" Generic statement
hi! link Statement AuroraRed
" if, then, else, endif, swicth, etc.
hi! link Conditional AuroraRed
" for, do, while, etc.
hi! link Repeat AuroraRed
" case, default, etc.
hi! link Label AuroraRed
" try, catch, throw
hi! link Exception AuroraRed
" sizeof, "+", "*", etc.
hi! link Operator AuroraCyan
" Any other keyword
hi! link Keyword AuroraMagenta

" Variable name
hi! link Identifier AuroraBlue
" Function name
hi! link Function AuroraGreenBold

" Generic preprocessor
hi! link PreProc AuroraAqua
" Preprocessor #include
hi! link Include AuroraAqua
" Preprocessor #define
hi! link Define AuroraAqua
" Same as Define
hi! link Macro AuroraAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit AuroraAqua

" Generic constant
hi! link Constant AuroraPurple
" Character constant: 'c', '/n'
hi! link Character AuroraPurple
" String constant: "this is a string"
if g:aurora_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
" hi! link Boolean AuroraPurple
call s:HL('Boolean', s:purple, s:none, s:bold)
" Number constant: 234, 0xff
hi! link Number AuroraMagenta
" Floating point constant: 2.3e10
hi! link Float AuroraPurple

" Generic type
hi! link Type AuroraYellow
" static, register, volatile, etc
hi! link StorageClass AuroraOrange
" struct, union, enum, etc.
hi! link Structure AuroraAqua
" typedef
hi! link Typedef AuroraYellow
" SpecialChar
hi! link SpecialChar AuroraPurple

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg1)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg1)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:aurora_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}

" Vim Bookmarks: {{{

hi! link BookmarkSign AuroraCyan
hi! link BookmarkAnnotationSign AuroraAqua
"}}}

" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:aurora_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}

" Coc: {{{

hi! link CocErrorSign AuroraYellowSign
hi! link CocHintSign AuroraAquaSign
hi! link CocInfoSign AuroraRedSign
hi! link CocWarningSign AuroraBlueSign
hi CocExplorerSelectUI guifg=#414347 guibg=#272B34
" hi! link CocExplorerSelectUI AuroraRed
"
"}}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['s:purple',  's:orange'], ['s:blue', 's:aqua'],
      \ ['s:yellow',  's:red'], ['s:green', 's:magenta']
    \ ]
endif

let g:rainbow_guifgs =   [ 's:cyan', 's:red', 's:blue', 's:green' ]
let g:rainbow_ctermfgs = [ 's:orange', 's:magenta', 's:aqua', 's:purple' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd AuroraRedSign
hi! link GitGutterChange AuroraCyanSign
hi! link GitGutterDelete AuroraPurpleSign
hi! link GitGutterChangeDelete AuroraPurpleSign


" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile AuroraGreen
hi! link gitcommitDiscardedFile AuroraRed

" }}}
" Signify: {{{

hi! link SignifySignAdd AuroraGreenSign
hi! link SignifySignChange AuroraAquaSign
hi! link SignifySignDelete AuroraRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign AuroraRedSign
hi! link SyntasticWarningSign AuroraYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   AuroraBlueSign
hi! link SignatureMarkerText AuroraPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl AuroraBlueSign
hi! link ShowMarksHLu AuroraBlueSign
hi! link ShowMarksHLo AuroraBlueSign
hi! link ShowMarksHLm AuroraBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch AuroraYellow
hi! link CtrlPNoEntries AuroraRed
hi! link CtrlPPrtBase AuroraBg2
hi! link CtrlPPrtCursor AuroraBlue
hi! link CtrlPLinePre AuroraBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket AuroraFg3
hi! link StartifyFile AuroraFg1
hi! link StartifyNumber AuroraYellow
hi! link StartifyPath AuroraBlue
hi! link StartifySlash AuroraBlue
hi! link StartifySection AuroraRed
hi! link StartifySpecial AuroraBg4
hi! link StartifyHeader AuroraYellow
hi! link StartifyFooter AuroraBg4

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign AuroraRedSign
hi! link ALEWarningSign AuroraYellowSign
hi! link ALEInfoSign AuroraBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail AuroraAqua
hi! link DirvishArg AuroraYellow

" }}}
" Netrw: {{{

hi! link netrwDir AuroraAqua
hi! link netrwClassify AuroraAqua
hi! link netrwLink AuroraGray
hi! link netrwSymLink AuroraFg1
hi! link netrwExe AuroraYellow
hi! link netrwComment AuroraGray
hi! link netrwList AuroraBlue
hi! link netrwHelpCmd AuroraAqua
hi! link netrwCmdSep AuroraFg3
hi! link netrwVersion AuroraGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir AuroraAqua
hi! link NERDTreeDirSlash AuroraAqua

hi! link NERDTreeOpenable AuroraOrange
hi! link NERDTreeClosable AuroraOrange

hi! link NERDTreeFile AuroraFg1
hi! link NERDTreeExecFile AuroraYellow

hi! link NERDTreeUp AuroraGray
hi! link NERDTreeCWD AuroraGreen
hi! link NERDTreeHelp AuroraFg1

hi! link NERDTreeToggleOn AuroraGreen
hi! link NERDTreeToggleOff AuroraRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded AuroraGreen
hi! link diffRemoved AuroraRed
hi! link diffChanged AuroraAqua

hi! link diffFile AuroraOrange
hi! link diffNewFile AuroraYellow

hi! link diffLine AuroraBlue

" }}}
" Html: {{{

hi! link htmlTag AuroraYellow
hi! link htmlEndTag AuroraRed

hi! link htmlTagName AuroraRedBold
hi! link htmlArg AuroraBlue

hi! link htmlScriptTag AuroraAqua
hi! link htmlTagN AuroraFg1
hi! link htmlSpecialTagName AuroraFg0

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar AuroraFg0

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)


" Xml: {{{

hi! link xmlTag AuroraBlue
hi! link xmlEndTag AuroraBlue
hi! link xmlTagName AuroraBlue
hi! link xmlEqual AuroraBlue
hi! link docbkKeyword AuroraAquaBold

hi! link xmlDocTypeDecl AuroraGray
hi! link xmlDocTypeKeyword AuroraPurple
hi! link xmlCdataStart AuroraGray
hi! link xmlCdataCdata AuroraPurple
hi! link dtdFunction AuroraGray
hi! link dtdTagName AuroraPurple

hi! link xmlAttrib AuroraAqua
hi! link xmlProcessingDelim AuroraGray
hi! link dtdParamEntityPunct AuroraGray
hi! link dtdParamEntityDPunct AuroraGray
hi! link xmlAttribPunct AuroraGray

hi! link xmlEntity AuroraOrange
hi! link xmlEntityPunct AuroraOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation AuroraOrange
hi! link vimBracket AuroraOrange
hi! link vimMapModKey AuroraOrange
hi! link vimFuncSID AuroraFg3
hi! link vimSetSep AuroraFg3
hi! link vimSep AuroraFg3
hi! link vimContinue AuroraFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword AuroraBlue
hi! link clojureCond AuroraOrange
hi! link clojureSpecial AuroraOrange
hi! link clojureDefine AuroraOrange

hi! link clojureFunc AuroraYellow
hi! link clojureRepeat AuroraYellow
hi! link clojureCharacter AuroraAqua
hi! link clojureStringEscape AuroraAqua
hi! link clojureException AuroraRed

hi! link clojureRegexp AuroraAqua
hi! link clojureRegexpEscape AuroraAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen AuroraFg3
hi! link clojureAnonArg AuroraYellow
hi! link clojureVariable AuroraBlue
hi! link clojureMacro AuroraOrange

hi! link clojureMeta AuroraYellow
hi! link clojureDeref AuroraYellow
hi! link clojureQuote AuroraYellow
hi! link clojureUnquote AuroraYellow

" }}}
" C: {{{

hi! link cOperator AuroraPurple
hi! link cStructure AuroraOrange

" }}}
" Python: {{{

hi! link pythonBuiltin AuroraOrange
hi! link pythonBuiltinObj AuroraOrange
hi! link pythonBuiltinFunc AuroraOrange
hi! link pythonFunction AuroraAqua
hi! link pythonDecorator AuroraRed
hi! link pythonInclude AuroraBlue
hi! link pythonImport AuroraBlue
hi! link pythonRun AuroraBlue
hi! link pythonCoding AuroraBlue
hi! link pythonOperator AuroraRed
hi! link pythonException AuroraRed
hi! link pythonExceptions AuroraPurple
hi! link pythonBoolean AuroraPurple
hi! link pythonDot AuroraFg3
hi! link pythonConditional AuroraRed
hi! link pythonRepeat AuroraRed
hi! link pythonDottedName AuroraGreenBold

" }}}
" CSS: {{{

" hi! link cssBraces AuroraBlue
" hi! link cssFunctionName AuroraYellow
" hi! link cssIdentifier AuroraRed
" hi! link cssClassName AuroraRed
" hi! link cssColor AuroraBlue
" hi! link cssSelectorOp AuroraBlue
" hi! link cssSelectorOp2 AuroraBlue
" hi! link cssImportant AuroraGreen
" hi! link cssVendor AuroraFg1

" hi! link cssTextProp AuroraAqua
" hi! link cssAnimationProp AuroraAqua
" hi! link cssUIProp AuroraYellow
" hi! link cssTransformProp AuroraAqua
" hi! link cssTransitionProp AuroraAqua
" hi! link cssPrintProp AuroraAqua
" hi! link cssPositioningProp AuroraYellow
" hi! link cssBoxProp AuroraAqua
" hi! link cssFontDescriptorProp AuroraAqua
" hi! link cssFlexibleBoxProp AuroraAqua
" hi! link cssBorderOutlineProp AuroraAqua
" hi! link cssBackgroundProp AuroraAqua
" hi! link cssMarginProp AuroraAqua
" hi! link cssListProp AuroraAqua
" hi! link cssTableProp AuroraAqua
" hi! link cssFontProp AuroraAqua
" hi! link cssPaddingProp AuroraAqua
" hi! link cssDimensionProp AuroraAqua
" hi! link cssRenderProp AuroraAqua
" hi! link cssColorProp AuroraAqua
" hi! link cssGeneratedContentProp AuroraAqua

hi! link cssBraces AuroraOrange
hi! link cssFunctionName AuroraYellow
hi! link cssIdentifier AuroraRed
hi! link cssClassName AuroraRed
hi! link cssColor AuroraGreen
hi! link cssSelectorOp AuroraYellow
hi! link cssSelectorOp2 AuroraYellow
hi! link cssImportant AuroraCyan
hi! link cssVendor AuroraFg0

hi! link cssBraces AuroraOrange
hi! link cssFunctionName AuroraYellow
hi! link cssIdentifier AuroraRed
hi! link cssClassName AuroraRed
hi! link cssColor AuroraGreen
hi! link cssSelectorOp AuroraYellow
hi! link cssSelectorOp2 AuroraYellow
hi! link cssImportant AuroraCyan
hi! link cssVendor AuroraFg0
hi! link cssTextProp AuroraOrange
hi! link cssAnimationProp AuroraOrange
hi! link cssUIProp AuroraFg0
hi! link cssTransformProp AuroraOrange
hi! link cssTransitionProp AuroraOrange
hi! link cssPrintProp AuroraOrange
hi! link cssPositioningProp AuroraOrange
hi! link cssBoxProp AuroraOrange
hi! link cssFontDescriptorProp AuroraOrange
hi! link cssFlexibleBoxProp AuroraOrange
hi! link cssBorderOutlineProp AuroraOrange
hi! link cssBackgroundProp AuroraOrange
hi! link cssMarginProp AuroraOrange
hi! link cssListProp AuroraOrange
hi! link cssTableProp AuroraOrange
hi! link cssFontProp AuroraOrange
hi! link cssPaddingProp AuroraOrange
hi! link cssDimensionProp AuroraOrange
hi! link cssRenderProp AuroraOrange
hi! link cssColorProp AuroraOrange
hi! link cssGeneratedContentProp AuroraOrange


" }}}
" JavaScript: {{{

hi! link javaScriptBraces AuroraFg1
hi! link javaScriptFunction AuroraAqua
hi! link javaScriptIdentifier AuroraRed
hi! link javaScriptMember AuroraBlue
hi! link javaScriptNumber AuroraPurple
hi! link javaScriptNull AuroraPurple
hi! link javaScriptParens AuroraFg3
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" }}}
" YAJS: {{{

hi! link javascriptImport AuroraAqua
hi! link javascriptExport AuroraAqua
hi! link javascriptClassKeyword AuroraAqua
hi! link javascriptClassExtends AuroraAqua
hi! link javascriptDefault AuroraAqua

hi! link javascriptClassName AuroraYellow
hi! link javascriptClassSuperName AuroraYellow
hi! link javascriptGlobal AuroraYellow

hi! link javascriptEndColons AuroraFg1
hi! link javascriptFuncArg AuroraFg1
hi! link javascriptGlobalMethod AuroraFg1
hi! link javascriptNodeGlobal AuroraFg1
hi! link javascriptBOMWindowProp AuroraFg1
hi! link javascriptArrayMethod AuroraFg1
hi! link javascriptArrayStaticMethod AuroraFg1
hi! link javascriptCacheMethod AuroraFg1
hi! link javascriptDateMethod AuroraFg1
hi! link javascriptMathStaticMethod AuroraFg1

" hi! link javascriptProp AuroraFg1
hi! link javascriptURLUtilsProp AuroraFg1
hi! link javascriptBOMNavigatorProp AuroraFg1
hi! link javascriptDOMDocMethod AuroraFg1
hi! link javascriptDOMDocProp AuroraFg1
hi! link javascriptBOMLocationMethod AuroraFg1
hi! link javascriptBOMWindowMethod AuroraFg1
hi! link javascriptStringMethod AuroraFg1

hi! link javascriptVariable AuroraOrange
" hi! link javascriptVariable AuroraRed
" hi! link javascriptIdentifier AuroraOrange
" hi! link javascriptClassSuper AuroraOrange
hi! link javascriptIdentifier AuroraOrange
hi! link javascriptClassSuper AuroraOrange

" hi! link javascriptFuncKeyword AuroraOrange
" hi! link javascriptAsyncFunc AuroraOrange
hi! link javascriptFuncKeyword AuroraAqua
hi! link javascriptAsyncFunc AuroraAqua
hi! link javascriptClassStatic AuroraOrange

hi! link javascriptOperator AuroraRed
hi! link javascriptForOperator AuroraRed
hi! link javascriptYield AuroraRed
hi! link javascriptExceptions AuroraRed
hi! link javascriptMessage AuroraRed

hi! link javascriptTemplateSB AuroraAqua
hi! link javascriptTemplateSubstitution AuroraFg1

" hi! link javascriptLabel AuroraBlue
" hi! link javascriptObjectLabel AuroraBlue
" hi! link javascriptPropertyName AuroraBlue
hi! link javascriptLabel AuroraFg1
hi! link javascriptObjectLabel AuroraFg1
hi! link javascriptPropertyName AuroraFg1

hi! link javascriptLogicSymbols AuroraFg1
hi! link javascriptArrowFunc AuroraYellow

hi! link javascriptDocParamName AuroraFg4
hi! link javascriptDocTags AuroraFg4
hi! link javascriptDocNotation AuroraFg4
hi! link javascriptDocParamType AuroraFg4
hi! link javascriptDocNamedParamType AuroraFg4

hi! link javascriptBrackets AuroraFg1
hi! link javascriptDOMElemAttrs AuroraFg1
hi! link javascriptDOMEventMethod AuroraFg1
hi! link javascriptDOMNodeMethod AuroraFg1
hi! link javascriptDOMStorageMethod AuroraFg1
hi! link javascriptHeadersMethod AuroraFg1

hi! link javascriptAsyncFuncKeyword AuroraRed
hi! link javascriptAwaitFuncKeyword AuroraRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword AuroraAqua
hi! link jsExtendsKeyword AuroraAqua
hi! link jsExportDefault AuroraAqua
hi! link jsTemplateBraces AuroraAqua
hi! link jsGlobalNodeObjects AuroraFg1
hi! link jsGlobalObjects AuroraFg1
hi! link jsFunction AuroraAqua
hi! link jsFuncParens AuroraFg3
hi! link jsParens AuroraFg3
hi! link jsNull AuroraPurple
hi! link jsUndefined AuroraPurple
hi! link jsClassDefinition AuroraYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved AuroraAqua
hi! link typeScriptLabel AuroraAqua
hi! link typeScriptFuncKeyword AuroraAqua
hi! link typeScriptIdentifier AuroraOrange
hi! link typeScriptBraces AuroraFg1
hi! link typeScriptEndColons AuroraFg1
hi! link typeScriptDOMObjects AuroraFg1
hi! link typeScriptAjaxMethods AuroraFg1
hi! link typeScriptLogicSymbols AuroraFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects AuroraFg1
hi! link typeScriptParens AuroraFg3
hi! link typeScriptOpSymbols AuroraFg3
hi! link typeScriptHtmlElemProperties AuroraFg1
hi! link typeScriptNull AuroraPurple
hi! link typeScriptInterpolationDelimiter AuroraAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword AuroraAqua
hi! link purescriptModuleName AuroraFg1
hi! link purescriptWhere AuroraAqua
hi! link purescriptDelimiter AuroraFg4
hi! link purescriptType AuroraFg1
hi! link purescriptImportKeyword AuroraAqua
hi! link purescriptHidingKeyword AuroraAqua
hi! link purescriptAsKeyword AuroraAqua
hi! link purescriptStructure AuroraAqua
hi! link purescriptOperator AuroraBlue

hi! link purescriptTypeVar AuroraFg1
hi! link purescriptConstructor AuroraFg1
hi! link purescriptFunction AuroraFg1
hi! link purescriptConditional AuroraOrange
hi! link purescriptBacktick AuroraOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp AuroraFg3
hi! link coffeeSpecialOp AuroraFg3
hi! link coffeeCurly AuroraOrange
hi! link coffeeParen AuroraFg3
hi! link coffeeBracket AuroraOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter AuroraGreen
hi! link rubyInterpolationDelimiter AuroraAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier AuroraRed
hi! link objcDirective AuroraBlue

" }}}
" Go: {{{

hi! link goDirective AuroraAqua
hi! link goConstants AuroraPurple
hi! link goDeclaration AuroraRed
hi! link goDeclType AuroraBlue
hi! link goBuiltins AuroraOrange

" }}}
" Lua: {{{

hi! link luaIn AuroraRed
hi! link luaFunction AuroraAqua
hi! link luaTable AuroraOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp AuroraFg3
hi! link moonExtendedOp AuroraFg3
hi! link moonFunction AuroraFg3
hi! link moonObject AuroraYellow

" }}}
" Java: {{{

hi! link javaAnnotation AuroraBlue
hi! link javaDocTags AuroraAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen AuroraFg3
hi! link javaParen1 AuroraFg3
hi! link javaParen2 AuroraFg3
hi! link javaParen3 AuroraFg3
hi! link javaParen4 AuroraFg3
hi! link javaParen5 AuroraFg3
hi! link javaOperator AuroraOrange

hi! link javaVarArg AuroraGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter AuroraGreen
hi! link elixirInterpolationDelimiter AuroraAqua

hi! link elixirModuleDeclaration AuroraYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition AuroraFg1
hi! link scalaCaseFollowing AuroraFg1
hi! link scalaCapitalWord AuroraFg1
hi! link scalaTypeExtension AuroraFg1

hi! link scalaKeyword AuroraRed
hi! link scalaKeywordModifier AuroraRed

hi! link scalaSpecial AuroraAqua
hi! link scalaOperator AuroraFg1

hi! link scalaTypeDeclaration AuroraYellow
hi! link scalaTypeTypePostDeclaration AuroraYellow

hi! link scalaInstanceDeclaration AuroraFg1
hi! link scalaInterpolation AuroraAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

" hi! link markdownH1 AuroraRedBold
" hi! link markdownH2 AuroraRedBold
" hi! link markdownH3 AuroraYellowBold
" hi! link markdownH4 AuroraYellowBold
" hi! link markdownH5 AuroraYellow
" hi! link markdownH6 AuroraYellow
"
" hi! link markdownCode AuroraCyan
" hi! link markdownCodeBlock AuroraCyan
" hi! link markdownCodeDelimiter AuroraCyan
"
" hi! link markdownBlockquote AuroraGray
" hi! link markdownListMarker AuroraGray
" hi! link markdownOrderedListMarker AuroraGray
" hi! link markdownRule AuroraGray
" hi! link markdownHeadingRule AuroraGray
"
" hi! link markdownUrlDelimiter AuroraFg3
" hi! link markdownLinkDelimiter AuroraFg3
" hi! link markdownLinkTextDelimiter AuroraFg3
"
" hi! link markdownHeadingDelimiter AuroraAqua
" hi! link markdownUrl AuroraPurple
" hi! link markdownUrlTitleDelimiter AuroraGreen

hi! link markdownH1 AuroraRedBold
hi! link markdownH2 AuroraRedBold
hi! link markdownH3 AuroraYellowBold
hi! link markdownH4 AuroraYellowBold
hi! link markdownH5 AuroraYellow
hi! link markdownH6 AuroraYellow

hi! link markdownCode AuroraCyan
hi! link markdownCodeBlock AuroraCyan
hi! link markdownCodeDelimiter AuroraCyan

hi! link markdownBlockquote AuroraGray
hi! link markdownListMarker AuroraCyan
hi! link markdownOrderedListMarker AuroraCyan
hi! link markdownRule AuroraYellow
hi! link markdownHeadingRule AuroraOrange

hi! link markdownUrlDelimiter AuroraFg3
hi! link markdownLinkDelimiter AuroraFg3
hi! link markdownLinkTextDelimiter AuroraFg3

hi! link markdownHeadingDelimiter AuroraAqua
hi! link markdownUrl AuroraPurple
hi! link markdownUrlTitleDelimiter AuroraGreen


call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType AuroraYellow
" hi! link haskellOperators AuroraOrange
" hi! link haskellConditional AuroraAqua
" hi! link haskellLet AuroraOrange
"
hi! link haskellType AuroraFg1
hi! link haskellIdentifier AuroraFg1
hi! link haskellSeparator AuroraFg1
hi! link haskellDelimiter AuroraFg4
hi! link haskellOperators AuroraBlue
"
hi! link haskellBacktick AuroraOrange
hi! link haskellStatement AuroraOrange
hi! link haskellConditional AuroraOrange

hi! link haskellLet AuroraAqua
hi! link haskellDefault AuroraAqua
hi! link haskellWhere AuroraAqua
hi! link haskellBottom AuroraAqua
hi! link haskellBlockKeywords AuroraAqua
hi! link haskellImportKeywords AuroraAqua
hi! link haskellDeclKeyword AuroraAqua
hi! link haskellDeriving AuroraAqua
hi! link haskellAssocType AuroraAqua

hi! link haskellNumber AuroraPurple
hi! link haskellPragma AuroraPurple

hi! link haskellString AuroraGreen
hi! link haskellChar AuroraGreen

" }}}
" Json: {{{

hi! link jsonKeyword AuroraGreen
hi! link jsonQuote AuroraGreen
hi! link jsonBraces AuroraFg1
hi! link jsonString AuroraFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! AuroraHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! AuroraHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:


" Italics----------------------------------------------------------------------
highlight Comment gui=italic

highlight Folded gui=italic
highlight Todo gui=italic
highlight String gui=italic
highlight Spellcap gui=italic
highlight Boolean gui=italic

highlight link markdownItalic Italic
highlight link markdownBold Bold



