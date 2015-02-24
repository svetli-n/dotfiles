set cursorcolumn
set nocompatible            
set showmatch 
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile

filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dbext.vim'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'dkprice/vim-easygrep.git'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-expand-region' 
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mkitt/tabline.vim'
Plugin 'Tabmerge'
Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'nvie/vim-flake8'

call vundle#end()           

if has("autocmd")
  filetype plugin indent on
endif

if has("syntax")
  syntax on
endif


"Plugins configuration
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir = 0

colorscheme lucius
LuciusDark
let g:lucius_no_term_bg = 0


"key mappings
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <cr> i<cr><esc>
noremap <Leader>b :call InsertPdb()<CR>
nnoremap <silent> t :TagbarToggle<CR>
noremap <Leader>ev :vsplit $MYVIMRC<CR>
noremap <Leader>sv :source $MYVIMRC<CR>
nnoremap H ^
nnoremap L $
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <BS> <Nop>

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vnoremap <C-c> "+y

inoremap jj <Esc>
inoremap <Esc> <Nop>
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <BS> <Nop>

function! InsertPdb()
    let trace = expand("import pdb; pdb.set_trace()")
    execute "normal o".trace
endfunction

