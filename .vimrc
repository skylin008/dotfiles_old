if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" all files
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" which key
Plug 'liuchengxu/vim-which-key'
set timeoutlen=300 

call plug#end()

let g:mapleader = "\<space>"
nnoremap <silent> <leader> :<c-u>WhichKey '<space>'<CR>
let g:maplocalleader = ','
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>

filetype plugin indent on
syntax on
set autoindent
set incsearch
set number relativenumber
set ruler
set hidden
set undodir=~/.vim/undodir
set undofile
set clipboard+=unnamed
highlight Comment ctermfg=green

set path=$PWD/**

noremap <silent> gn :bn<cr>
noremap <silent> gp :bp<cr>

nnoremap <silent> <leader>e :e ~/.vimrc<CR>
nnoremap <silent> <leader>r :source $MYVIMRC<CR>
nnoremap <silent> <leader>d :bd<CR>
nnoremap <silent> <leader>D :bd!<CR>
nnoremap <silent> <leader><leader> :b#<CR>

" fzf bindings
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>F :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>T :Tags<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>L :Lines<CR>
nnoremap <leader>' :Marks<CR>
nnoremap <leader>/ :Rg<CR>
nnoremap <leader>H :Helptags!<CR>
nnoremap <leader>C :Commands<CR>
nnoremap <leader>: :History:<CR>
nnoremap <leader>M :Maps<CR>
nnoremap <leader>s :Filetypes<CR>

" clipboard bindings
nnoremap <leader>y "*y
nnoremap <leader>p "*p
nnoremap <leader>Y "+y
nnoremap <leader>P "+p

" ftplugin
augroup filetype_python
    autocmd!
    autocmd Filetype python let g:python_recommended_style = 1
augroup END

" Automatically save the file notes when idle
autocmd CursorHold .notes :write
