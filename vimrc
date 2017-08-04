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
set cc=80
set cursorcolumn

" filetype off                 
filetype plugin on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'dbext.vim'
" Plugin 'ervandew/supertab'
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
Plugin 'davidhalter/jedi-vim'
Plugin 'valloric/youcompleteme'
" Plugin 'klen/python-mode'
Plugin 'coacher/vim-virtualenv'
Plugin 'tell-k/vim-autopep8'
Plugin 'fatih/vim-go'
Plugin 'mxw/vim-jsx'
Plugin 'ensime/ensime-vim'
Plugin 'derekwyatt/vim-scala'

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

let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['java'] }

let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$']

let g:airline#extensions#branch#enabled = 1


let g:EclimCompletionMethod = 'omnifunc'


let delimitMate_expand_cr = 0


let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0

let g:jedi#show_call_signatures = 0
let g:jedi#popup_on_dot = 0

let g:pymode_rope_goto_definition_bind = "<C-d>"
let g:pymode_doc_bind = "<C-d>"

let GOPATH = "/home/svetlin/workspace/go"

let g:jsx_ext_required = 0 " Allow JSX in normal JS files"

let g:NERDSpaceDelims = 1

"key mappings
let mapleader = "\<Space>"


" Java eclim mappings
autocmd Filetype java nnoremap <Leader>i :JavaImport<CR>
autocmd Filetype java nnoremap <Leader>d :JavaDocPreview<CR>
autocmd Filetype java nnoremap <Leader>f :JavaSearchContext<CR>
autocmd Filetype java nnoremap <Leader>n :JavaNew class 
autocmd Filetype java nnoremap <Leader>r :JavaRename
autocmd Filetype java nnoremap <Leader>c :JavaCallHierarchy<CR>
autocmd Filetype java nnoremap <Leader>k :JavaCorrect<CR>
" autocmd Filetype java nnoremap <Leader>d :call DeleteEclimProjects(rootFolder)

" Scala eclim mappings
autocmd Filetype scala nnoremap <leader>f :ScalaSearch<CR>
autocmd Filetype scala nnoremap <leader>i :ScalaImport<CR>

autocmd BufWritePost *.scala silent :EnTypeCheck
nnoremap <localleader>t :EnTypeCheck<CR>
let ensime_server_v2=1

" Python mappings
autocmd Filetype python nnoremap <leader>f :YcmCompleter GoTo<CR>
autocmd Filetype python nnoremap <leader>r :YcmCompleter GoToReferences<CR>
autocmd Filetype python nnoremap <leader>d :YcmCompleter GetDoc<CR>
autocmd Filetype python nnoremap <Leader>b :call InsertPdb()<CR>
autocmd Filetype python nnoremap <Leader>v :call InsertPytestdebuger()<CR>
autocmd Filetype python nnoremap <Leader>p :!python % <CR>

" Go mappings
autocmd Filetype go nnoremap <Leader>b :call InsertGoBreakpoint()<CR>
au FileType go nmap <Leader>r <Plug>(go-run)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>t <Plug>(go-test)
au FileType go nmap <Leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>f <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>d <Plug>(go-doc)
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

function! InsertGoBreakpoint()
    let trace = expand("runtime.Breakpoint()")
    execute "normal o".trace
endfunction

function! InsertPdb()
    let trace = expand("import ipdb; ipdb.set_trace()")
    execute "normal o".trace
endfunction

function! InsertPytestdebuger()
    let trace = expand("import pytest; pytest.set_trace()")
    execute "normal o".trace
endfunction

" function! DeleteEclimProjects(rootFolder)
" let folders = systemlist("find " . a:rootFolder ." -name .project -printf '%h\n'")
    " for fo in folders
        " execute ':ProjectDelete ' . fo
    " endfor
    " echo "Done."
" endfunction
