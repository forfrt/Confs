"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important:
"       This requries that you install https://github.com/forfrt/vimrc !
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => MyDiff Function
""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""
" => Function to append ending tag
""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""
" => Function to add Html Title
""""""""""""""""""""""""""""""
function AddTitle()
    call setline(1,'<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">')
    endfunction

map Html :call AddTitle()<CR>
