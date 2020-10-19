let mapleader=" "
set number

set hidden
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/DoxyGen-Syntax'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'bling/vim-bufferline'
Plug 'wikitopian/hardmode'
Plug 'Yggdroot/indentLine',{ 'for': 'cpp' }


inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:indentLine_char = '|'

nmap cs :Snippets<cr>
nmap cp :Files<cr>
nmap cb :Buffers<cr>
nmap cl :Lines<cr>
nmap ca <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f)
nmap S <Plug>(easymotion-overwin-line)
nmap cj :Gcommit<cr>
nmap ck :Gpush<cr>
nmap ce :Gwrite<cr>
nmap cf :Dox<cr>
nmap cx :call OpenTerminalOwn("")<Left><Left>
nmap ch :Maps<cr>

autocmd VimEnter *
  \ let &statusline='%{bufferline#refresh_status()}'
  \ .bufferline#get_status_string()

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

set textwidth=80
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set updatetime=300
set shortmess+=c
set smartcase
colo desert
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


hi StatusLine cterm=None ctermbg=Red ctermfg=Black
hi StatusLineNC cterm=None ctermbg=Black ctermfg=White
hi Visual cterm=None ctermfg=Black ctermbg=White
hi PmenuSel cterm=Bold ctermbg=Red ctermbg=Black


autocmd BufNewFile,BufRead *.cpp set syntax=cpp.doxygen
autocmd BufNewFile,BufRead *.cc set syntax=cpp.doxygen
autocmd BufNewFile,BufRead *.h set syntax=cpp.doxygen
autocmd BufNewFile,BufRead *.hpp set syntax=cpp.doxygen


let g:bufferline_modified = '[+]'
let g:bufferline_echo = 0
