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
"Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
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
Plugin 'avakhov/vim-yaml'
"Plugin 'davidhalter/jedi-vim'
Plugin 'valloric/youcompleteme'
Plugin 'coacher/vim-virtualenv'
Plugin 'tell-k/vim-autopep8'
Plugin 'fatih/vim-go'

call vundle#end()           

if has("autocmd")
  filetype plugin indent on
endif

"syntax off
if has("syntax")
  syntax on
endif

" Use ag over grep
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ -U
endif


"Plugins configuration
"
set t_Co=256
set background=dark
colorscheme solarized 

let g:syntastic_python_python_exec = '/usr/bin/python'
let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_checker_args="--ignore=E501"
"autocmd BufWritePost *.py call Flake8()


let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['java'] }

let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$']

let g:airline#extensions#branch#enabled = 1


let g:EclimCompletionMethod = 'omnifunc'


let delimitMate_expand_cr = 0


let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_goto_buffer_command = 'horizontal-split'



"key mappings
let mapleader = "\<Space>"


autocmd Filetype python nnoremap <leader>f :YcmCompleter GoTo<CR>
autocmd Filetype python nnoremap <leader>r :YcmCompleter GoToReferences<CR>
autocmd Filetype python nnoremap <leader>d :YcmCompleter GetDoc<CR>
autocmd Filetype python nnoremap <Leader>b :call InsertPdb()<CR>
autocmd Filetype python nnoremap <Leader>v :call InsertPytestdebuger()<CR>


au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>b <Plug>(go-build)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <cr> i<cr><esc>
"noremap <Leader>b :call InsertPdb()<CR>
"noremap <Leader>v :call InsertPytestdebuger()<CR>
nnoremap <silent> t :TagbarToggle<CR>
nnoremap H ^
nnoremap L $
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <BS> :nohlsearch<CR> 
nnoremap ss <C-]> 
nnoremap <silent>nt :NERDTreeFind<CR>
nnoremap sp :set paste!<CR>

"Eclim Java mappings
autocmd Filetype java nnoremap <Leader>i :JavaImport<CR>
autocmd Filetype java nnoremap <Leader>d :JavaDocPreview<CR>
autocmd Filetype java nnoremap <Leader>f :JavaSearchContext<CR>
autocmd Filetype java nnoremap <Leader>n :JavaNew class 
autocmd Filetype java nnoremap <Leader>r :JavaRename


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

"autocmd CompleteDone * pclose

"" bind K to grep word under cursor
"nnoremap <Leader>f :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


function! InsertPdb()
    let trace = expand("import ipdb; ipdb.set_trace()")
    execute "normal o".trace
endfunction

function! InsertPytestdebuger()
    let trace = expand("import pytest; pytest.set_trace()")
    execute "normal o".trace
endfunction
