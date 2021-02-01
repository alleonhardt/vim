let mapleader=" "
set number
set encoding=utf-8
set fileencoding=utf-8

set hidden
call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'rust-lang/rust.vim'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'mileszs/ack.vim'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'mg979/vim-visual-multi'
Plug 'lervag/vimtex'
Plug 'itchyny/lightline.vim'
let g:yankstack_yank_keys = ['y', 'd']

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:indentLine_char = '|'
let g:UltiSnipsExpandTrigger="<C-s>"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

imap jj <Esc>
tmap jj <C-\><C-n>
imap ;; <C-c> 
nmap cs :Clap snippets<cr>
nmap cp :Clap files<cr>
nmap cb :Clap buffers<cr>
nmap cl :Clap lines<cr>
nmap ci :Gissues<cr>
nmap ca <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f)
nmap S <Plug>(easymotion-overwin-line)
nmap cj :Gcommit<cr>
nmap ck :Gpush<cr>
nmap ce :Gwrite<cr>
nmap c1 :Dox<cr>
nmap cx :call OpenTerminalOwn("")<Left><Left>
nmap ch :Clap commits<cr>
nmap cy <Plug>yankstack_substitute_older_paste
nmap cY <Plug>yankstack_substitute_newer_paste
nnoremap P <Plug>yankstack_substitute_older_paste
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap gcu :CocCommand git.chunkUndo<cr>
nmap gls :Gstatus<cr>
nmap gli <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap glc <Plug>(coc-git-commit)
nmap glo :CocCommand git.browserOpen<cr>

" navigate conflicts of current buffer
nmap cn <Plug>(coc-git-prevconflict)
nmap cN <Plug>(coc-git-nextconflict)
" show chunk diff at current position

function! OnExitJob(channel_id,data,stream_name)
  execute 'buffer' . g:allu_bufnr
  normal 0G
  nmap <buffer> q i<cr>
  nmap <buffer> e i<cr>:terminal<cr>i
  let g:allu_bufnr=0
endfunction

let g:allu_bufnr = 0
function! OpenTerminalOwn(command)
  let g:allu_last_command = a:command
  if g:allu_bufnr == 0
    enew
    let id = termopen(a:command,{'on_exit':'OnExitJob'})
    nnoremap <expr> cx ':call OpenTerminalOwn("' . g:allu_last_command . '")<Left><Left>'
    let g:allu_bufnr = bufnr("%")
    b #
  else
    echo "The old command is not finished yet!"
  endif
endfunction



let g:EasyMotion_do_mapping = 0 " Disable default mappings
" binding.
" " `s{char}{label}`
" " Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
set smartcase
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

"
call plug#end()


let $FZF_DEFAULT_COMMAND = 'rg --files '

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set updatetime=300
set shortmess+=c
set smartcase
colo minimalist
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
