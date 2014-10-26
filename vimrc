
set nocompatible            
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
Plugin 'Solarized'
Bundle 'joonty/vdebug.git'
Plugin 'bling/vim-airline'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'terryma/vim-expand-region' 
Plugin 'vcscommand.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mkitt/tabline.vim'

call vundle#end()           
if has("autocmd")
  filetype plugin indent on
endif
if has("syntax")
  syntax on
endif

"Plugins configuration
let g:dbext_default_profile_mysql_local = 'type=MYSQL:user=rc:passwd=ala_rc:dbname=dpapp:extra=-t'

let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir = 0

set t_Co=256
set background=dark
let g:solarize_termcolors=256
colorscheme solarized

"vim configuration
set showmatch 
set tabstop=4
set shiftwidth=4
set expandtab

"key mappings
let mapleader = "\<Space>"
"nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
"nnoremap <Leader><Leader> V
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
vnoremap <C-c> "+y
inoremap jj <Esc>
nmap <cr> i<cr><esc>
noremap <Leader>b :call InsertPdb()<CR>
function! InsertPdb()
    let trace = expand("import pdb; pdb.set_trace()")
    execute "normal o".trace
endfunction
nnoremap <silent> t :TagbarToggle<CR>
nnoremap <silent> d <C-]><CR> 
nnoremap <silent> db <C-T><CR> 
