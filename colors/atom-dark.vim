" Vim color file
"
" Author: Federico Ramirez
" https://github.com/gosukiwi/vim-atom-dark
"
" Note: Based on the Monokai theme variation by Tomas Restrepo
" https://github.com/tomasr/molokai

hi clear

if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="atom-dark"

hi Boolean         guifg=#99CC99
hi Character       guifg=#05f57d
hi Number          guifg=#99CC99
hi String          guifg=#05f57d
hi Conditional     guifg=#92C5F7               gui=none
hi Constant        guifg=#99CC99               gui=none
hi Cursor          guifg=#F1F1F1 guibg=#777777
hi iCursor         guifg=#F1F1F1 guibg=#777777
hi Debug           guifg=#616e88               gui=none
hi Define          guifg=#66D9EF
hi Delimiter       guifg=#c2c2ff
hi DiffAdd                       guibg=#13354A
hi DiffChange      guifg=#ffffff guibg=#616e88
hi DiffDelete      guifg=#960050 guibg=#1E0010
hi DiffText                      guibg=#c2c2ff gui=none

hi Directory       guifg=#616e88               gui=none
hi Error           guifg=#05f57d guibg=#1E0010
hi ErrorMsg        guifg=#92C5F7 guibg=#232526 gui=none
hi Exception       guifg=#c2c2ff               gui=none
hi Float           guifg=#99CC99
hi FoldColumn      guifg=#616e88 guibg=#000000
hi Folded          guifg=#616e88 guibg=#000000
hi Function        guifg=#c2c2ff
hi Identifier      guifg=#B6B7EB
hi Ignore          guifg=#2c232d guibg=bg
hi IncSearch       guifg=#C4BE89 guibg=#000000

hi Keyword         guifg=#92C5F7               gui=none
hi Label           guifg=#05f57d               gui=none
hi Macro           guifg=#C4BE89               gui=none
hi SpecialKey      guifg=#66D9EF               gui=none

hi MatchParen      guifg=#ffffff guibg=#3e4452 gui=none
hi ModeMsg         guifg=#05f57d
hi MoreMsg         guifg=#05f57d
hi Operator        guifg=#92C5F7

" complete menu
hi Pmenu           guifg=#c2c2ff guibg=#2c323d
hi PmenuSel                      guibg=#3e4452
hi PmenuSbar                     guibg=#00010695
hi PmenuThumb      guifg=#66D9EF

hi PreCondit       guifg=#c2c2ff               gui=none
hi PreProc         guifg=#c2c2ff
hi Question        guifg=#66D9EF
hi Repeat          guifg=#92C5F7               gui=none
hi Search          guifg=#000000 guibg=#B4EC85
" marks
hi SignColumn      guifg=#c2c2ff guibg=#00010695
hi SpecialChar     guifg=#92C5F7               gui=none
hi SpecialComment  guifg=#3e4452               gui=none
hi Special         guifg=#66D9EF guibg=bg      gui=none
if has("spell")
    hi SpellBad    guisp=#FF00F5 gui=undercurl
    hi SpellCap    guisp=#7070F0 gui=undercurl
    hi SpellLocal  guisp=#70F0F0 gui=undercurl
    hi SpellRare   guisp=#FFFFFF gui=undercurl
endif
hi Statement       guifg=#92C5F7               gui=none
hi StatusLine      guifg=#2c232d guibg=fg      gui=none
hi StatusLineNC    guifg=#2c232d guibg=#00010695
hi StorageClass    guifg=#B6B7EB               gui=none
hi Structure       guifg=#66D9EF
hi Tag             guifg=#92C5F7               gui=none
hi Title           guifg=#B6B7EB               gui=none
hi Todo            guifg=#FFFFFF guibg=bg      gui=none

hi Typedef         guifg=#66D9EF
hi Type            guifg=#66D9EF               gui=none
hi Underlined      guifg=#2c232d               gui=underline

hi VertSplit       guifg=#2c232d guibg=#00010695
hi VisualNOS                     guibg=#403D3D
hi Visual                        guibg=#403D3D
hi WarningMsg      guifg=#FFFFFF guibg=#333333
hi WildMenu        guifg=#66D9EF guibg=#000000

hi TabLineFill     guifg=#00010695 guibg=#00010695
hi TabLine         guibg=#F8F8F2 guifg=#00010695 gui=none

hi Normal          guifg=#F8F8F2 guibg=#00010695
hi Comment         guifg=#616e88
hi CursorLine                    guibg=#2c232d
hi CursorLineNr    guifg=#B6B7EB               gui=none
hi CursorColumn                  guibg=#00010695
hi ColorColumn     guifg=#9500ff guibg=#00010695
hi LineNr          guifg=#616e88 guibg=#00010695
hi NonText         guifg=#616e88
hi SpecialKey      guifg=#616e88

" Must be at the end, because of ctermbg=234 bug.
" https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
set background=dark

" 616e88
" 2c323d
