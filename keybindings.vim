map <F1> :NERDTreeMirrorToggle<CR>
map <S-F1> :MRU<CR>

" ,vrc opens my vimrc in a new tab
nmap <leader>vrc :tabedit ~/bin/dotfiles/vim/vimrc<CR>

"vimdiff current vs git head (fugitive extension)
nnoremap <Leader>gd :Gdiff<cr>

"switch back to current file and closes fugitive buffer
nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>

"Use shift-Tab and Tab in Visual mode to in- and outdent the selected block
vnoremap <Tab> >gv
vnoremap <C-S-Tab> <gv

