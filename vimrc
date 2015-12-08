set cursorcolumn
set colorcolumn=80
set nocompatible            
set showmatch 
set tabstop=4
set shiftwidth=4
set expandtab
set noswapfile
set incsearch
set hlsearch
set tags=tags;
set number
set ignorecase
set smartcase
set wildmode=list,full

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
Plugin 'tpope/vim-obsession'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'rking/ag.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'elzr/vim-json'

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

set t_Co=256
set background=dark
colorscheme solarized 

let g:syntastic_python_python_exec = '/usr/bin/python'
let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_checker_args="--ignore=E501"
"autocmd BufWritePost *.py call Flake8()

"let g:syntastic_java_checkers = ['checkstyle', 'javac']
"let g:syntastic_java_javac_classpath = './*.java:/home/svetlin/workspace/sandbox/java/spring_restful_web_service/build/libs/lib/*.jar'

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['java'] }

let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$']
"let NERDTreeWinSize=81
"
"
let g:airline#extensions#branch#enabled = 1

let delimitMate_expand_cr = 0


"key mappings
let mapleader = "\<Space>"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <cr> i<cr><esc>
noremap <Leader>b :call InsertPdb()<CR>
noremap <Leader>v :call InsertPytestdebuger()<CR>
nnoremap <silent> t :TagbarToggle<CR>
noremap <Leader>ev :vsplit $MYVIMRC<CR>
noremap <Leader>sv :source $MYVIMRC<CR>
nnoremap H ^
nnoremap L $
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <BS> :nohlsearch<CR> 
nnoremap ss <C-]> 
nnoremap <silent>nt :NERDTreeFind<CR>

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


""Eclim mappings
"nnoremap jd :JavaDocPreview<CR>
"nnoremap js :JavaSearch<CR>
"nnoremap ji :JavaImport<CR>

function! InsertPdb()
    let trace = expand("import ipdb; ipdb.set_trace()")
    execute "normal o".trace
endfunction

function! InsertPytestdebuger()
    let trace = expand("import pytest; pytest.set_trace()")
    execute "normal o".trace
endfunction
