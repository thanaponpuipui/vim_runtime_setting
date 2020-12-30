syntax on

filetype plugin indent on

set encoding=utf-8

set guifont=DaddyTimeMono_Nerd_Font_Mono:h12

" backspace allow for every thing.
set backspace=indent,eol,start

"set termguicolors

set mouse=a

" set displaying message at the bottom 2 spacehight
set cmdheight=2

" set shorter updatetime (default at 4000ms)
set updatetime=500

" Don't pass message in |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes

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
" Plug 'ycm-core/YouCompleteMe'
Plug 'digitaltoad/vim-pug'
Plug 'jremmen/vim-ripgrep'
" tsx, jsx plugin vim-jsx-pretty work well with ts syntax hightlight
"Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
" typescript-vim not working with tsx, jsx syntax hightlight plugins
"Plug 'leafgarland/typescript-vim'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" indent line
Plug 'yggdroot/indentline'

" Plugin for markdown
" Plug 'JamshedVesuna/vim-markdown-preview'

call plug#end()

colorscheme gruvbox
set background=dark

"set indent line guide
let g:indentLine_setColors=0
let g:indentLine_char_list=['|', '¦', '┆', '┊']

" map leader key to space
let mapleader = " "

" set filetypes as typescriptreact
"autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

let g:vim_jsx_pretty_colorful_config = 1
let g:vim_jsx_pretty_highlight_close_tag = 1

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
"fun! GoYCM()
"  nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
"  nnoremap <buffer> <silent> <leader>gf :YcmCompleter FixIt<CR>
"  nnoremap <buffer> <silent> <leader>rn :YcmCompleter RefactorRename<space>
"endfun
" close preview when leave insert mode
"let g:ycm_autoclose_preview_window_after_insertion=1

"let g:ycm_goto_buffer_command='same-buffer'

" COC
" from github page.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
" shift tab
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" ctrl space
inoremap <silent><expr> <C-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expend('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and refaerences when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" map esc
imap jk <ESC>
imap kj <ESC>

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
" open terminal with ctrl+n
nnoremap <C-n> :call OpenTerminal()<CR>

" markdown preview setting
let vim_markdown_preview_toggle = 1
let vim_markdown_preview_hotkey = '<leader>md'

