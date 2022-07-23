"-------------------------------------- Plugins --------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'    
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()
"------------------------------------------------------------------------------------------------

"-------------------------------------Basic Config ----------------------------------------------
" Disable compatibility with vi which can cause unexpected issues
set nocompatible
" Enable type file detection
filetype on
" Enable plugins and load plugin for the detected file type
filetype plugin on
" Load an indent file for the detected file type
filetype indent on
" Turn syntax highlighting on
syntax on
" Add number lines
set number
" Set tab width to 4 columns
set tabstop=4
" Use space characters instead of tabs
set expandtab
" Do not wrap lines
set nowrap
"------------------------------------------------------------------------------------------------

"---------------------------------Window Splitting -----------------------------------------------
" Expected behavior when splitting windows
set splitbelow splitright 
" Remap split nagivation to CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Remove pipe characters that separate splits
set fillchars +=vert:\  
"------------------------------------------------ -----------------------------------------------

"-------------------------------------Vim Airline -----------------------------------------------
let g:airline_theme='bubblegum'
"------------------------------------------------------------------------------------------------

"--------------------------------------Nerd Tree -----------------------------------------------
" Start NERDTree automatically
autocmd VimEnter * NERDTree
" Close the tab if NERDTree is the only window remaining in it
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" NERDTree settings
nnoremap <C-f> :NERDTreeToggle<CR>
"------------------------------------------------------------------------------------------------
