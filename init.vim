let mapleader=" "
set number
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

set hidden
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxyGen-Syntax'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'SirVer/ultisnips'
Plug 'ycm-core/YouCompleteMe'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


nmap cs :Snippets<cr>
nmap cp :Files<cr>
nmap cb :Buffers<cr>
nmap cl :Lines<cr>
nmap cg :YcmCompleter GoTo<cr>
nmap ca <Plug>(easymotion-overwin-f)
nmap cj :Gcommit<cr>
nmap ck :Gpush<cr>
nmap ce :Gwrite<cr>
nmap cf :Dox<cr>
nmap cd :AsyncRun cd build && ninja<cr>
nmap ch :Maps<cr>




let g:EasyMotion_do_mapping = 0 " Disable default mappings
" binding.
" " `s{char}{label}`
" " Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
set smartcase

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#fnamemod = ':t'

"
call plug#end()
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

autocmd User AsyncRunStop :copen

let $FZF_DEFAULT_COMMAND = 'rg --files '

set textwidth=80
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
colo molokai
set cmdheight=2
set updatetime=300
set shortmess+=c
set smartcase
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set cursorline
autocmd FocusLost * silent! wa
autocmd BufNewFile,BufRead *.cpp set syntax=cpp.doxygen
autocmd BufNewFile,BufRead *.cc set syntax=cpp.doxygen
autocmd BufNewFile,BufRead *.h set syntax=cpp.doxygen
autocmd BufNewFile,BufRead *.hpp set syntax=cpp.doxygen
