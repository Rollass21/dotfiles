"Rolandkuv Vimrc

execute pathogen#infect()

" Vundle settings
" -----------------
set rtp+=~/.vim/bundle/Vundle.vim
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

call vundle#begin('~/.vim/bundle')
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
call vundle#end() 

"FONTS AND COLORS
set encoding=utf-8
set number
syntax on
set background=dark
colorscheme solarized

"SOME USEFUL STUFF
set nocompatible
set hidden
filetype plugin indent on
set ruler
set laststatus=2
set showcmd
set encoding=utf-8
set visualbell
set noerrorbells
set mouse=a
set autoindent
set smartindent
set cindent
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
map <C-b> :bnext<CR>
inoremap jj <ESC>


"Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:synstastic_auto_jump = 1
let g:syntastic_check_on_open = 1
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
