syntax on

set encoding=utf-8

set mouse=a

" no error sound when endof file
set noerrorbells

" tab setting
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" hybrid line number with automatic toggling mode
set nu rnu 

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" no text wrap when overflow x
set nowrap

" set case sensitive for searching
set smartcase

set noswapfile
set nobackup

" undo file directory
set undodir=~/.vim/undodir
set undofile

set incsearch

" formatoption to not continue comment
" set formatoptions-=cro

" new split panes to right and below
set splitbelow
set splitright

" plugin
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'digitaltoad/vim-pug'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

colorscheme gruvbox
set background=dark

" map leader key to space
let mapleader = " "

" File Explorer setting
"let g:netrw_browse_split=2
"let g:netrw_banner=0
"let g:netrw_liststyle=3
"let g:netrw_winsize=25

" NERDTree    
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
" list of files that want to ignore in NERDTree
let g:NERDTreeIgnore=['\.git$', 'node_modules']
let g:NERDTreeStatusline=''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" set rg to look for root
if executable('rg')
  let g:rg_derive_root='true'
endif

" ctrlP stuff
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching=0

" quick window swap focus
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
" quick open undotree
nnoremap <leader>u :UndotreeShow<CR>
" open new Ex and resize to 30
"nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>pt :NERDTreeToggle<CR>

" quick rg command
nnoremap <leader>ps :Rg<SPACE>
" easy resize
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>_ :resize -5<CR>
nnoremap <silent> <leader>+ :resize +5<CR>

" YCM
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>rn :YcmCompleter RefactorRename<space>
" close preview when leave insert mode
let g:ycm_autoclose_preview_window_after_insertion=1

let g:ycm_goto_buffer_command='same-buffer'

" map esc
imap jk <ESC>
imap kj <ESC>
vmap jk <ESC>
vmap kj <ESC>

" ingegrated terminal maping

" esc to normal mode terminal
tnoremap <ESC> <C-\><C-n>
" other normal switch button
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" jump between tabs in terminals
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l

