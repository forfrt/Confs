"关闭兼容模式
set nocompatible

set nu!
set list
set listchars=eol:\ 
set noundofile

"界面设置
set mouse=
colorscheme torte 
set guifont=Courier\ New:h10

syntax enable
syntax on

"关闭上侧工具栏
set guioptions-=T
"关闭右侧滚动条
set guioptions-=r

"编码设置
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
 set fileencoding=chinese
else
 set fileencoding=utf-8
endif
language messages zh_CN.utf-8

"智能缩进
set expandtab
set smarttab
set softtabstop=4
set tabstop=4
set shiftwidth=4

set scrolloff=5

set nobackup
set cuc "竖行高亮
"set cul

hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white   
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white  

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4 
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4 
let g:indent_guides_guide_size=1




