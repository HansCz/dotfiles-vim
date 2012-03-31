map <F1> :NERDTreeMirrorToggle<CR>
map <S-F1> :MRU<CR>

" ,vrc opens my vimrc in a new tab
nmap <leader>vrc :tabedit ~/bin/dotfiles/vim/vimrc<CR>
nmap <leader>kvrc :tabedit ~/bin/dotfiles/vim/keybindings.vim<CR>

"vimdiff current vs git head (fugitive extension)
nnoremap <Leader>gd :Gdiff<cr>

"switch back to current file and closes fugitive buffer
nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>

"Use shift-Tab and Tab in Visual mode to in- and outdent the selected block
vnoremap <Tab> >gv
vnoremap <C-S-Tab> <gv

" LustyJuggler lives on <Leader>b
nmap <leader>b :LustyJuggler<CR>

" Switch tabs with Alt-Cmd-Left and Alt-Cmd-Right
map <D-M-Right> :tabnext<CR>
map <D-M-Left> :tabprevious<CR>

" git stuff

nnoremap <leader>gdc :Git diff --cached<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gst :Gstatus<CR>

" fold it!

" " toggle single fold
inoremap <F2> <C-O>za
nnoremap <F2> za
onoremap <F2> <C-C>za

" " unfold recursively
inoremap <F3> <C-O>zR
nnoremap <F3> zR
onoremap <F3> <C-C>zR

" " fold recursively
inoremap <S-F3> <C-O>zM
nnoremap <S-F3> zM
onoremap <S-F3> <C-C>zM

" TComment remappings
nmap <D-/> gcc<CR>
vmap <D-/> gcgv<CR>
