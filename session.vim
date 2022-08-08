let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Projets/testu-sveltkit
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +2 ~/Projets/testu-sveltkit/src/routes/index.svelte
badd +10 src/routes/__layout.svelte
badd +1 ~/Projets/testu-sveltkit/src/lib/components/app/NavContent.svelte
badd +11 ~/Projets/testu-sveltkit/src/lib/components/app/HeadContent.svelte
badd +12 ~/Projets/testu-sveltkit/src/app.html
badd +18 package.json
badd +9 ~/Projets/testu-sveltkit/src/routes/register/index.ts
badd +45 src/routes/register/index.svelte
badd +8 ~/Projets/testu-sveltkit/src/lib/db.js
badd +9 ~/Projets/testu-sveltkit/src/routes/login/index.ts
badd +22 ~/Projets/testu-sveltkit/src/routes/login/index.svelte
badd +6 src/routes/logging-in@blank.svelte
badd +13 src/routes/__layout-blank.svelte
argglobal
%argdel
edit ~/Projets/testu-sveltkit/src/lib/components/app/HeadContent.svelte
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 98 + 99) / 198)
exe 'vert 2resize ' . ((&columns * 99 + 99) / 198)
argglobal
balt ~/Projets/testu-sveltkit/src/lib/components/app/NavContent.svelte
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 026|
wincmd w
argglobal
if bufexists(fnamemodify("~/Projets/testu-sveltkit/src/routes/register/index.ts", ":p")) | buffer ~/Projets/testu-sveltkit/src/routes/register/index.ts | else | edit ~/Projets/testu-sveltkit/src/routes/register/index.ts | endif
if &buftype ==# 'terminal'
  silent file ~/Projets/testu-sveltkit/src/routes/register/index.ts
endif
balt ~/Projets/testu-sveltkit/src/routes/login/index.ts
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 9 - ((8 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 9
normal! 014|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 98 + 99) / 198)
exe 'vert 2resize ' . ((&columns * 99 + 99) / 198)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
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
