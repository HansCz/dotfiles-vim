" Remap of help navigation keys
nnoremap <buffer> <CR> <C-]>              " Follow links with RETURN
nnoremap <buffer> <BS> <C-T>              " Go back in link history with backspace
nnoremap <buffer> o /'\l\{2,\}'<CR>       " 'o' jumps to next option link
nnoremap <buffer> O ?'\l\{2,\}'<CR>       " 'O' jumps to previous option link
nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>   " 's' jumps to next section link
nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>   " 'S' jumps to previous section link

