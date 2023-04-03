"source $VIMRUNTIME/defaults.vim

" --- vim-plug ----------------------------------------------------------

" automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" in case i need vim help for vim-plug
Plug 'junegunn/vim-plug'

Plug 'preservim/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'MattesGroeger/vim-bookmarks'

call plug#end()



" --- MISC --------------------------------------------------------------

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
set formatoptions=ql
set noarabicshape

set pastetoggle=<F1>

colorscheme default

" fuzzy finding
set path+=**
set wildmenu

" use HTML syntax highlighting for EJS files
au BufNewFile,BufRead *.ejs set filetype=html

" configure correct indentation for YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" fix broken indentation on paste in tmux (see https://vi.stackexchange.com/questions/23110/pasting-text-on-vim-inside-tmux-breaks-indentation)
if &term =~ "screen"
    let &t_BE = "\e[?2004h"
    let &t_BD = "\e[?2004l"
    exec "set t_PS=\e[200~"
    exec "set t_PE=\e[201~"
endif



" --- REMAPS ----------------------------------------------------------------

" buffer switching
let mapleader=";"
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>

" autocomplete (files)
inoremap <C-f> <C-x><C-f>



" --- COMMANDS --------------------------------------------------------------

command! GenTags !ctags -R -a --exclude=node_modules .

" refresh UltiSnips Snippets
command! RefreshSnippets call UltiSnips#RefreshSnippets()



" --- PLUGINS ---------------------------------------------------------------

" ------ netrw --------------------------------------------------------------

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 15


" ------ NERDTree -----------------------------------------------------------

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" show hidden files in NERDTree
let NERDTreeShowHidden=1


" ------ UltiSnips ----------------------------------------------------------

let g:UltiSnipsListSnippets="<C-l>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" ------ vim-bookmarks ------------------------------------------------------

let g:bookmark_annotation_sign = '⚑'
let g:bookmark_save_per_working_dir = 1
let g:bookmark_display_annotation = 1
