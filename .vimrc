call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/limelight.vim'
Plug 'davidhalter/jedi-vim'
Plug 'fatih/vim-go',
call plug#end()

syntax on
filetype plugin indent on
colorscheme Tomorrow-Night-Bright
set cursorline
set fileencodings=utf-8
set tabstop=4
set number

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:ackprg = 'ag --nogroup --nocolor --column'

function! FZFOpen(command_str)
    if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
	exe "normal! \<c-w>\<c-w>"
    endif
    exe 'normal! ' . a:command_str . "\<cr>"
endfunction

"File navigation and search mappings

map <C-n> :NERDTreeToggle<CR> 
map <C-k> :NERDTreeFind<CR>  
map <C-o> :call FZFOpen(':Files')<CR>
map <C-e> :call FZFOpen(':Buffers')<CR>
map <C-f> :call FZFOpen(':Ag')<CR>

"Git mappings

nmap <Leader>g :GitGutterSignsToggle<CR>
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterUndoHunk
nmap <Leader>hv <Plug>GitGutterPreviewHunk
