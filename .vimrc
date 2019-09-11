"Rolandkuv Vimrc

execute pathogen#infect()

" Vundle settings
" -----------------
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle')
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'scrooloose/syntastic'
    Plugin 'scrooloose/nerdtree'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'VimIRC.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'Valloric/YouCompleteMe'
call vundle#end() 

"FONTS AND COLORS
set encoding=utf-8
set number
syntax on
set background=dark
colorscheme solarized

"columns
augroup ColorcolumnOnlyInInsertMode
  autocmd!
  autocmd InsertLeave * setlocal cc=0
  autocmd InsertEnter c,cpp,h setlocal cc=85,120
augroup END
highlight OverLength ctermfg=darkred 
match OverLength /\%>120v.\+/


"SOME USEFUL STUFF
set nocompatible
set hidden
filetype plugin indent on
set cursorline
set ruler
set laststatus=2
set scrolloff=6
set showcmd
set encoding=utf-8
set visualbell
set noerrorbells
set mouse=a
set autoindent
set smartindent
set cindent
set cinoptions=(0,:0,l1,t0,L3
set tabstop=4
set shiftwidth=4
set expandtab

"Mappings
noremap % v%
nnoremap j gj
nnoremap k gk
nnoremap p gp
nnoremap P gP
nnoremap qb :bd<CR>
nnoremap qB :bd!<CR>
nnoremap <F5> :!make<CR>
map <C-l> :bnext<CR>
map <C-h> :bprevious<CR>
inoremap jj <ESC>


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:synstastic_auto_jump = 1
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "X"
let g:syntastic_warning_symbol = "!"

"NERDTree settings 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='solarized'

"YouCompleteMe settings
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0

"Fugitive settings
nnoremap gst :Gstatus<CR>
nnoremap gca :Gcommit<CR>

"Ctags settings
set tags=./tags;

"Functions

"For use when tidying long variable declarations at the top of functions
function! SortLinesDescending() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
    execute a:firstline . "," . a:lastline . '%sort! n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction

function! SortLinesAscending() range
    execute a:firstline . "," . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
        execute a:firstline . "," . a:lastline . 'sort n'
    execute a:firstline . "," . a:lastline . 's/^\d\+\s//'
endfunction
