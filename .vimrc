set number
set incsearch
syntax enable
set mouse=a
set mousemodel=popup
:menu PopUp.Paste :normal! "0p
let g:rightclick_normal_items =  ['save' , 'quit' , 'undo' , 'redo' , 'paste']
let g:rightclick_normal_macros = [':w^M' , ':q^M' , 'u'    , '^R'   , 'p'    ]

let g:rightclick_visual_items =  ['copy' , 'cut' , 'paste']
let g:rightclick_visual_macros = ['y'    , 'd'   , 'p'    ]
