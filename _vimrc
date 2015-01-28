set nu!
set list
set nocompatible
set listchars=tab:>-,trail:-
set mouse=
set guifont=Courier\ New:h10

"vimwiki markdown
let g:vimwiki_list = [{'path': 'F:/study/Notes/',
    \ 'path_html': 'F:/study/Notes/',
    \ 'syntax': 'markdown',
    \ 'ext': '.mkd',
    \ 'template_path': 'F:/Fengrt/Notes/',
    \ 'template_default': 'template',
    \ 'template_ext': '.html'}]
    let g:vimwiki_camel_case = 0
    "let g:vimwiki_file_exts = 'c, cpp,  txt, h, hpp, sh, awk'
    let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown','.mkd':'markdown'}
    
    map <F4> <Plug>Vimwiki2HTML
    map <S-F4> <Plug>VimwikiAll2HTML
    "insert date插入日期
    nmap <F3> a<C-R>=strftime("%Y-%m-%d %I:%M %p")<CR><Esc>
    imap <F3> <C-R>=strftime("%Y-%m-%d %I:%M %p")<CR>

colorscheme torte 
syntax enable
syntax on
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
 set fileencoding=chinese
else
 set fileencoding=utf-8
endif
language messages zh_CN.utf-8

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


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4 
hi IndentGuidesOdd  guibg=red   ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4 
let g:indent_guides_guide_size=1

 "html/xhtml editing in vim (写完>后自动不全结束标签)

  function! InsertHtmlTag()

          let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'

          normal! a>

          let save_cursor = getpos('.')

          let result = matchstr(getline(save_cursor[1]), pat)

          "if (search(pat, 'b', save_cursor[1]) && searchpair('<','','>', 'bn',0,getline('.')) > 0)

          if (search(pat, 'b', save_cursor[1]))

             normal! lyiwf>

               normal! a</

                   normal! p

                      normal! a>

                     endif

                      :call cursor(save_cursor[1], save_cursor[2], save_cursor[3])

          endfunction

          inoremap > <ESC>:call InsertHtmlTag()<CR>a

"html 插入头部申明

function AddTitle()
              call setline(1,'<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">')
              endfunction

map Html :call AddTitle()<CR>


"vim vundle

set nocompatible               " be iMproved
filetype off                   " required!
 
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
let path='$VIM/vimfiles/bundle'
call vundle#begin(path)


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

