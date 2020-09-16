let mapleader=" "
set number
tnoremap <Esc> <C-\><C-n>
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
Plug 'rafi/any-jump.vim'
Plug 'skywind3000/asyncrun.vim'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

nmap <leader>p :Files<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <C-p> :Files<cr>
nmap <C-b> :Buffers<cr>
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" " Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#fnamemod = ':t'
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"
nmap <leader>rn <Plug>(coc-rename)
"
""show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>

call plug#end()
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler'

autocmd User AsyncRunStop :copen

nmap <leader>c :Gcommit<cr>
nmap <leader>p :Gpush<cr>
nmap <leader>w :Gwrite<cr>
nmap <leader>d :Dox<cr>
nmap <leader>b :AsyncRun cd build && ninja<cr>
let $FZF_DEFAULT_COMMAND = 'rg --files '

set textwidth=80
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
colo gruvbox
set cmdheight=2
set updatetime=300
set shortmess+=c

set cursorline
