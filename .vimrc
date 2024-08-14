set number
set incsearch
colorscheme gruvbox
syntax enable
set mouse=a
set mousemodel=popup
:menu PopUp.Paste :normal! "0p
let g:rightclick_normal_items =  ['save' , 'quit' , 'undo' , 'redo' , 'paste']
let g:rightclick_normal_macros = [':w^M' , ':q^M' , 'u'    , '^R'   , 'p'    ]

let g:rightclick_visual_items =  ['copy' , 'cut' , 'paste']
let g:rightclick_visual_macros = ['y'    , 'd'   , 'p'    ]

function! IsHexColorLight(color) abort

  let l:raw_color = trim(a:color, '#')



  let l:red = str2nr(substitute(l:raw_color, '.{0}(.{2})', '1', 'g'), 16)

  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)

  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)



  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000



  return l:brightness > 155

endfunction`
