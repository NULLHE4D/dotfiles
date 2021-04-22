"source $VIMRUNTIME/defaults.vim

" idk what this does but i like it
set nocompatible
set autoindent expandtab tabstop=4 shiftwidth=4
set cursorline
set number
set relativenumber
set backspace=indent,eol,start
set autoread
set showcmd
set showmode
set hidden
set laststatus=2
set ruler
set tabpagemax=40
set mouse=a
set title
set incsearch
set hlsearch
set ignorecase
set smartcase
set linebreak
set scrolloff=3
set confirm
set directory=$HOME/.vim/swp//
set undofile
set undodir=$HOME/.vim/undo

colorscheme default

" fuzzy finding
set path+=**
set wildmenu

" use HTML syntax highlighting for EJS files
au BufNewFile,BufRead *.ejs set filetype=html

" configure correct indentation for YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



" ===== REMAPS =====

" buffer switching
let mapleader=";"
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>

" autocomplete (files)
inoremap <C-f> <C-x><C-f>



" ===== COMMANDS =====

command! GenTags !ctags -R -a --exclude=node_modules .



" ===== PLUGINS =====

" === netrw ===

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 15


" === NERDTree ===

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files in NERDTree
let NERDTreeShowHidden=1
