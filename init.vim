let mapleader=" "
set number
tnoremap <Esc> <C-\><C-n>
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/DoxyGen-Syntax'

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

nmap <leader>c :Gcommit<cr>
nmap <leader>p :Gpush<cr>
nmap <leader>w :Gwrite<cr>
nmap <leader>d :Dox<cr>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

