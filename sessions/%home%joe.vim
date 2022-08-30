let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 .config/nvim/lua/user/plugins.lua
badd +32 .local/share/nvim/site/pack/packer/start/catppuccin/lua/catppuccin/groups/editor.lua
badd +17 .local/share/nvim/site/pack/packer/start/catppuccin/lua/catppuccin/palettes/frappe.lua
badd +20 .local/share/nvim/site/pack/packer/start/catppuccin/lua/catppuccin/groups/integrations/nvimtree.lua
badd +5 .local/share/nvim/site/pack/packer/start/catppuccin/lua/catppuccin/groups/integrations/which_key.lua
argglobal
%argdel
$argadd .config/nvim/lua/user/plugins.lua
edit .local/share/nvim/site/pack/packer/start/catppuccin/lua/catppuccin/palettes/frappe.lua
argglobal
balt .local/share/nvim/site/pack/packer/start/catppuccin/lua/catppuccin/groups/integrations/nvimtree.lua
let s:l = 15 - ((14 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 020|
lcd ~
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
