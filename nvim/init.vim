"Rolandkuv Vimrc

" Vundle settings
" -----------------
"set rtp+=~/.config/nvim/bundle/Vundle.vim
set nocompatible

call plug#begin()
    Plug 'VundleVim/Vundle.vim'
    Plug 'scrooloose/syntastic'
    Plug 'scrooloose/nerdtree'
    Plug 'airblade/vim-gitgutter'
    Plug 'majutsushi/tagbar'
    Plug 'yggdroot/indentline'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-eunuch'
    Plug 'valloric/youcompleteme'
call plug#end()

"FONTS AND COLORS
set encoding=utf-8
set number
syntax on
set background=dark
"colorscheme solarized

"automatically remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"SOME USEFUL STUFF
set hidden
filetype plugin indent on
set cursorline
set ruler
set laststatus=2
set scrolloff=8
set showcmd
set showmatch
set encoding=utf-8
set visualbell
set noerrorbells
set mouse=a
set autoindent
set smartindent
set ic
set smartcase
set cindent
set cinoptions=(0,:0,l1,t0,L3)
set tabstop=4
set shiftwidth=4
set expandtab
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

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
"Search for visually selected text
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

"TagBar settings
let g:tagbar_autofocus=1
let g:tagbar_case_insensitive = 1
nmap <C-t> :TagbarToggle<CR>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 1
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
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1

"YouCompleteMe settings
let g:ycm_key_list_select_completion = ['<TAB>']
let g:ycm_key_list_previous_completion = ['<S-TAB>']
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0

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
