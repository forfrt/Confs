"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/forfrt/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Vundle Plugin
""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vimwiki/vimwiki'
Plugin 'Raimondi/delimitMate'
Plugin 'Chiel92/vim-autoformat'
Plugin 'powerline/powerline'
" Need to use font like 'Dejavu Sans Mono for powerline' to work
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""
" => Vimwiki Plugin
""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/Notes/',
            \ 'path_html': '~/Notes/',
            \ 'syntax': 'markdown',
            \ 'ext': '.mkd',
            \ 'template_path': '~/Notes/',
            \ 'template_default': 'template',
            \ 'template_ext': '.html'}]
let g:vimwiki_camel_case = 0
"let g:vimwiki_file_exts = 'c, cpp,  txt, h, hpp, sh, awk'
let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown','.mkd':'markdown'}

map <F4> <Plug>Vimwiki2HTML
map <S-F4> <Plug>VimwikiAll2HTML

""""""""""""""""""""""""""""""
" => autoformatter Plugin
""""""""""""""""""""""""""""""
noremap <F2> :Autoformat<CR>
au BufWrite *.c :Autoformat
let g:formatdef_frt_custom_c = '"astyle --style=java -CKfxt"'
let g:formatters_c = ['frt_custom_c']
let g:formatters_yapf_style = 'pep8'

""""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""""
nmap <F9> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1

" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }


""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr></cr></leader></Space></leader></cr></leader>


