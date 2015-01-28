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
    "insert date��������
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
set cuc "���и���
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

 "html/xhtml editing in vim (д��>���Զ���ȫ������ǩ)

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

"html ����ͷ������

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
 
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
 
" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vimwiki'
Bundle 'SuperTab'
Bundle 'taglist.vim'
Bundle 'Markdown'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
" ...
 
filetype plugin indent on     " required!
"
" Brief help  -- �˴����涼��vundle��ʹ������
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

