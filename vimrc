" HansCz's Vim configuration.
" " Copy or symlink to ~/.vimrc or ~/_vimrc.
"
" Load pathogen
source ~/bin/dotfiles/vim/bundle/vim-pathogen/autoload/pathogen.vim

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
" filetype plugin indent on         " Turn on file type detection.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set wrap                          " word wrapping,
                                  " but only line breaks inserted
                                  " when press the Enter key explicitly
set linebreak                     "

set nolist                        " list disables linebreak

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

set listchars=tab:▸\ ,trail:·     " Show trailing whitespace and tabs
set list

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%{fugitive#statusline()}%=%-16(\ %l,%c-%v\ %)%P

set mouse=a " Add mousing

set background=dark
colorscheme solarized " Add a nice colorscheme

" Change cursor line depending on mode

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

" source my keybindings and vimrc files every time they are written to disk

if has("autocmd")
  autocmd! bufwritepost ~/bin/dotfiles/vim/vimrc source $MYVIMRC
  autocmd! bufwritepost ~/bin/dotfiles/vim/keybindings.vim source ~/bin/dotfiles/vim/keybindings.vim
  if has("gui_running")
     autocmd! bufwritepost ~/bin/dotfiles/vim/gvimrc source ~/.gvimrc
  endif
endif
autocmd BufWinEnter * set foldlevel=999999 "unfold all files before opening in a new buffer

" Automatic fold settings for specific files. Uncomment to use.

autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" Let pathogen build the help and load all bundles
filetype off

call pathogen#infect('~/bin/dotfiles/vim/bundle')

" commented out generation of help tags, since it dirties up my checked out
" git submodule-handled bundle trees
" call pathogen#helptags()

" Turn on file type detection. (Must be after fugitive setup)
filetype plugin indent on

" " Remote browsing

let g:netrw_liststyle=3 " Use tree style for remote directory browsing
let g:netrw_ftp_cmd="ftp -p" " set ftp to default to passive mode
 " Keys and binds

let mapleader = "," " Set my custom modifier key

source $HOME/bin/dotfiles/vim/keybindings.vim " Load my keybindings

" I need some special settings for MacVim. these should only be loaded if
" it's a gui version of vim (of which MacVim is one)
if !exists("*ReloadConfigs")
  function ReloadConfigs()
      :source ~/.vimrc
      if has("gui_running")
          :source ~/.gvimrc
      endif
  endfunction
  command! Recfg call ReloadConfigs()
endif
