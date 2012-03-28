map <F1> :NERDTreeToggle<CR>
map <S-F1> :MRU<CR>

" ,vrc opens my vimrc in a new tab
nmap <leader>vrc :tabedit ~/bin/dotfiles/vim/vimrc<CR>

"vimdiff current vs git head (fugitive extension)
nnoremap <Leader>gd :Gdiff<cr>

"switch back to current file and closes fugitive buffer
nnoremap <Leader>gD :diffoff!<cr><c-w>h:bd<cr>

