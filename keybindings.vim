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

" LustyJuggler lives on <Leader>b
nmap <leader>b :LustyJuggler<CR>

" Switch tabs with Alt-Cmd-Left and Alt-Cmd-Right
let macvim_skip_cmd_opt_movement = 1
map <D-M-Right> :tabnext<CR>
map <D-M-Left> :tabprevious<CR>
