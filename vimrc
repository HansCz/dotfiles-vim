" HansCz's Vim configuration.
" " Copy or symlink to ~/.vimrc or ~/_vimrc.
"
" Load pathogen
execute "source ". fnamemodify(resolve(expand('<sfile>')), ":p:h") ."/bundle/vim-pathogen/autoload/pathogen.vim"

set shell=/bin/zsh
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

set backupdir=/tmp                " Set backup directory for swap files
set directory=/tmp                " List of directory names for the swap file

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set expandtab                     " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time

set listchars=tab:▸\ ,trail:·     " Show trailing whitespace and tabs
set list

" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%{exists('g:loaded_fugitive')?fugitive#statusline():''}%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P

set mouse=a " Add mousing

" Change cursor line depending on mode

:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

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

" source my keybindings and vimrc files every time they are written to disk

if has("autocmd")
  autocmd! bufwritepost ~/bin/dotfiles/vim/vimrc call ReloadConfigs()
  autocmd! bufwritepost ~/bin/dotfiles/vim/keybindings.vim call ReloadConfigs()
  if has("gui_running")
     autocmd! bufwritepost ~/bin/dotfiles/vim/gvimrc call ReloadConfigs()
  endif
endif
autocmd BufWinEnter * set foldlevel=999999 "unfold all files before opening in a new buffer

" Automatic fold settings for specific files. Uncomment to use.

autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" Set some custom extension > filetype matches
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Gemfile.lock set filetype=ruby

" Let pathogen build the help and load all bundles
filetype off

call pathogen#infect(fnamemodify(resolve(expand('<sfile>')), ":p:h") ."/bundle")

" commented out generation of help tags, since it dirties up my checked out
" git submodule-handled bundle trees
" call pathogen#helptags()

set background=dark
colorscheme solarized " Add a nice colorscheme

" Turn on file type detection. (Must be after fugitive setup)
filetype plugin indent on

" " Remote browsing

let g:netrw_liststyle=3 " Use tree style for remote directory browsing
let g:netrw_ftp_cmd="ftp -p" " set ftp to default to passive mode
 " Keys and binds

let mapleader = "," " Set my custom modifier key

"free up Command and Alt qualifier keys in macvim
if has("gui_macvim")
  let macvim_skip_cmd_opt_movement = 1
endif
" current working dir now set when NERDTree changes root
autocmd VimEnter * if exists(":NERDTree") | exe "let NERDTreeChDirMode=2" | endif

" Setup syntastic
" " filetypes in active mode are checked on save. Ditto in passive mode are
" checked when running :SyntasticCheck

let g:syntastic_mode_map = { 'mode': 'active',
                              \ 'active_filetypes': ['ruby', 'php', 'coffee', 'javascript', 'eruby', 'less'],
                              \ 'passive_filetypes': ['css', 'html'] }

" jump to first error after execution
let g:syntastic_auto_jump=1

" Setup code folding
set foldmethod=indent " fold based on code indent
set foldnestmax=10    " maximum number of levels to fold
set nofoldenable      " don't fold by default
set foldlevel=1

" Z - cd to recent / frequent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd ' . path
  endif
endfunction

" Setup snipmate
let g:snipMate = {}
let g:snipMate.scope_aliases = {} 
let g:snipMate.scope_aliases['ruby'] = 'ruby,ruby-rails'
let g:snipMate.scope_aliases['haml'] = 'ruby,haml'

" Source other files

" Load my keybindings
execute "source ". fnamemodify(resolve(expand('<sfile>')), ":p:h") ."/keybindings.vim"