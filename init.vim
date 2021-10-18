let mapleader=" "
set scrolloff=7
set number
set encoding=utf-8
set fileencoding=utf-8
set termguicolors

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'skywind3000/asyncrun.vim'
Plug 'rust-lang/rust.vim'
Plug 'mg979/vim-visual-multi'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'honza/vim-snippets'

Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-look'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-vsnip'
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'rafamadriz/friendly-snippets'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'

Plug 'junegunn/fzf.vim'
Plug 'wellle/targets.vim'
Plug 'camspiers/animate.vim'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'ggvgc/vim-fuzzysearch'
Plug 'folke/trouble.nvim'
Plug 'lazytanuki/nvim-mapper'
Plug 'mbbill/undotree'
Plug 'lewis6991/gitsigns.nvim'
Plug 'phaazon/hop.nvim'
Plug 'ShadowItaly/octo.nvim', { 'branch': 'fix_key_mappings_error' }
Plug 'famiu/feline.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'arecarn/vim-frisk'
Plug 'kdheepak/lazygit.nvim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'voldikss/vim-floaterm'
Plug 't9md/vim-choosewin'
Plug 'ggandor/lightspeed.nvim'
Plug 'haringsrob/nvim_context_vt'
Plug 'liuchengxu/vista.vim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'vimwiki/vimwiki'
Plug 'soywod/himalaya', {'rtp': 'vim'}
Plug 'soywod/unfog.vim'
call plug#end()
let g:vista#renderer#enable_icon = 0
let g:vimwiki_map_prefix = '<leader>v'
let g:vista_sidebar_width = 45
let g:asyncrun_open = 15
colo afterglow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:choosewin_overlay_enable = 0
let g:sneak#label = 1
let g:fuzzysearch_prompt = 'fuzzy /'
let g:fuzzysearch_hlsearch = 1
let g:fuzzysearch_ignorecase = 1
let g:fuzzysearch_max_history = 30
let g:fuzzysearch_match_spaces = 0

" let g:indentLine_char = '|'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" show chunk diff at current position

set shell=/usr/bin/zsh

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
let g:himalaya_mailbox_picker = 'fzf'

" binding.
" " `s{char}{label}`
" " Turn on case-insensitive feature
set smartcase
set ignorecase
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()


lua <<EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}

require'lightspeed'.setup {
  jump_to_first_match = true,
  jump_on_partial_input_safety_timeout = 400,
  -- This can get _really_ slow if the window has a lot of content,
  -- turn it on only if your machine can always cope with it.
  highlight_unique_chars = false,
  grey_out_search_area = true,
  match_only_the_start_of_same_char_seqs = true,
  limit_ft_matches = 5,
  full_inclusive_prefix_key = '<c-x>',
  -- By default, the values of these will be decided at runtime,
  -- based on `jump_to_first_match`.
  labels = nil,
  cycle_group_fwd_key = nil,
  cycle_group_bwd_key = nil,
}

-- nvim_lsp object
require("indent_blankline").setup {
    char = "|",
    buftype_exclude = {"terminal"}
}

require('nvim_comment').setup()
local nvim_lsp = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({
    capabilities=capabilities,
})

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
EOF


" Completion

let $FZF_DEFAULT_COMMAND = 'rg --files '

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set shortmess+=c

" Enable master mode
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set cursorline


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

set updatetime=300
" Show diagnostic popup on cursor hover

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" Enable type inlay hints

lua << EOF
  require("todo-comments").setup {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = "F", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = "T ", color = "info" },
    HACK = { icon = "H", color = "warning" },
    WARN = { icon = "W ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = "P ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "N ", color = "hint", alt = { "INFO" } },
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
    warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
    info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
    hint = { "LspDiagnosticsDefaultHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  }
  }
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
" http://blog.trk.in.rs/2015/12/01/vim-tips/
" http://modal.us/blog/2013/07/27/back-to-vim-with-nerdtree-nope-netrw/
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Default to tree mode
let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
" set autochdir
" maybe is easier within netrw just press c  help :netrw-c
" that's better than 'cd ../path' which change in all tabs
lua << EOF
  require("trouble").setup {
    fold_open = "v", -- icon used for open folds
    fold_closed = ">", -- icon used for closed folds
    icons=false,
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_lsp_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  }
EOF
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = v:false
let bufferline.clickable = v:false
let bufferline.icon_separator_active = '|'
let bufferline.icon_separator_inactive = '|'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = 'M'

lua << EOF
require("nvim-mapper").setup({})
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      }
    }
  }
})



require'telescope'.load_extension('mapper')
Mapper = require("nvim-mapper")
Mapper.map('i', 'jj', "<Esc>", {silent = true, noremap = true}, "Exit insert mode", "exit_insert", "Exit insert mode with another key mapping to speed up the process.")
Mapper.map('t','jj',"<C-\\><C-n>",{silent = true, noremap = true}, "Exit terminal insert mode", "exit_term_insert", "Exit the terminal insert mode with the same mapping as in the normal mode.")
Mapper.map('n','<leader>p',":GFiles<cr>",{silent = true, noremap = true}, "Find files","fuzzy_find_files","Fuzzy searching for files in the current working directory.")
Mapper.map('n','<leader>b',":FloatermNew broot<cr>",{silent = true, noremap = true}, "Open broot","fuzzy_find_buffer","Open broot")
Mapper.map('n','<leader>l',":Lines<cr>",{silent = true, noremap = true}, "Search open lines","fuzzy_find_lines","Fuzzy searching for through the lines in the buffer.")
Mapper.map('n','<leader>g',":LazyGit<cr>",{silent = false, noremap = true}, "Open the git console","git_console","Open the git console for commiting and changing things.")
Mapper.map('n','<leader>f',":Rg<cr>",{silent = true, noremap = true}, "Search strings in files", "live_grep","Matching the string in every file in the working directory.")
Mapper.map('n','<leader>h',":Telescope mapper<cr>",{silent = true, noremap = true}, "Show keymappings", "show_help","Show this keymapping help to support the user of this config file.")
Mapper.map('n','<leader>ss',":GFiles?<cr>",{silent = true, noremap = true}, "Search git diff","show_status","Show fuzzy search of the git status and shows a preview of the diff file.")
Mapper.map('n','<leader>sc',":Commits<cr>",{silent = true, noremap = true}, "Search git commits","show_commits","Fuzzy search git commits with telescope plugin.")
Mapper.map('n','<leader>sb',":Telescope git_branches<cr>",{silent = true, noremap = true}, "Search git branches", "show_branches","Fuzzy search git branches with the telescope plugin.")
Mapper.map('n','<leader>st',":Vista finder<cr>",{silent = true, noremap = true}, "Search git branches", "show_vista_finder","Fuzzy search git branches with the telescope plugin.")
Mapper.map('n','<leader>t',":TodoTrouble<cr>",{silent = true, noremap = true}, "Show project todos/notes","show_todos","Shows a nice overview of the todos and notes in the current working directory.")
Mapper.map('n','<leader>m',":BufferPick<cr>",{silent = true, noremap = true}, "Buffer picker","pick_buffer","Pick a buffer by doing selecting the buffer in the tab bar.")
Mapper.map('n','<leader>u',"<cmd>lua require\"gitsigns\".reset_hunk()<CR>",{silent = true, noremap = true}, "Undo git hunk","undo_git_hunk","Undo git hunk from file.")
Mapper.map('n','<leader>U',":Unfog<CR>",{silent = false, noremap = true}, "Open unfog","open_unfog","Opens the task management programm unfog")

Mapper.map('n','<leader>a',"<cmd>lua require\"gitsigns\".stage_hunk()<CR>",{silent = true, noremap = true}, "Stage git hunk","stage_git_hunk","Stage the current git hunk for the next commit.")
Mapper.map('v','<leader>a',"<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line('v')})<CR>",{silent = true, noremap = true}, "Stage visual git hunk","stage_vis_git_hunk","Stage selected hunk from visual mode for the next commit.")

Mapper.map('n','<leader>x',"<cmd>lua require\"gitsigns\".blame_line(true)<CR>",{silent = true, noremap = true}, "Toggle Git line highlight","git_line_highlight","Toggle the git line highlighting.")
Mapper.map('n','<leader>n',"<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>",{silent = true, noremap = true}, "Next git hunk","git_next_hunk","Jump to the next git hunk in the file.")
Mapper.map('n','<leader>N',"<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>",{silent = true, noremap = true}, "Previous git hunk","git_prev_hunk","Jump to the previous git hunk in the file.")
Mapper.map('n','<leader>d',"<cmd>lua vim.lsp.diagnostic.goto_next({enable_popup=false})<CR>",{silent = true, noremap = true}, "Next diagnostic","diag_next","Jump to the next diagnostic message.")
Mapper.map('n','<leader>D',"<cmd>lua vim.lsp.diagnostic.goto_prev({enable_popup=false})<CR>",{silent = true, noremap = true}, "Previous diagnostic","diag_prev","Jump to the previous diagnostic message.")
Mapper.map('n','<leader>1',":Trouble<CR>",{silent = true, noremap = true}, "Show diagnostics","diag_nice_show","Show the file diagnostics in a file preview.")
Mapper.map('n','<leader>v',":Vista<CR>",{silent = true, noremap = true}, "Show tagbar","diag_nice_vista","Show the file diagnostics in a file preview.")
Mapper.map('n','$',":HopWord<cr>",{silent = false, noremap = false}, "Browser search for selection","browser_search_3","Search the web for the text selected with visual mode.")
Mapper.map('n','<leader>c',":HopChar1<cr>",{silent = false, noremap = false}, "Browser search for selection","browser_search_4","Search the web for the text selected with visual mode.")
Mapper.map('n','<leader>r',":AsyncRun ",{silent = false, noremap = false}, "Async run command","async_run","Asynchronously execute the command and pipe the output to copen.")
Mapper.map('n','<leader>q',":cn<cr>",{silent = false, noremap = false}, "Next entry in quickfix","quickfix_next","Select the next quickfix entry.")
Mapper.map('n','<leader>Q',":cp<cr>",{silent = false, noremap = false}, "Previous entry in quickfix","quickfix_prev","Select the previous quickfix entry.")
Mapper.map('n','<leader>z',":FloatermNew --autoclose=2<CR>",{silent = false, noremap = false}, "Opens floating terminal","float_term","Opens the floating terminal window.")
Mapper.map('n','<leader>j',"<Plug>(choosewin)",{silent = false, noremap = false}, "Selects a window","window_picker","Selects a window with a character.")
Mapper.map('n','<leader>k',":FuzzySearch<cr>",{silent = false, noremap = false}, "Selects a window","fuzzy_search","Selects a window with a character.")
Mapper.map('n','<leader>i',":Octo issue list<cr>",{silent = false, noremap = false}, "Selects a window","issues","Selects a window with a character.")
require'hop'.setup()
EOF
highlight HopNextKey1 ctermfg=red guifg=red
highlight HopNextKey2 ctermfg=cyan guifg=magenta
highlight HopNextKey ctermfg=magenta guifg=magenta


let g:floaterm_opener='edit'
hi BufferCurrent ctermfg=blue
hi BufferCurrentMod ctermfg=red
hi BufferVisibleTarget ctermfg=yellow
hi BufferCurrentTarget ctermfg=yellow
hi BufferInactiveTarget ctermfg=yellow
set relativenumber

"Taken from https://stackoverflow.com/questions/5700389/using-vims-persistent-undo/22676189
" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'

if stridx(&runtimepath, expand(vimDir)) == -1
  " vimDir is not on runtimepath, add it
  let &runtimepath.=','.vimDir
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

lua << EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000,
    follow_files = true
  },
  current_line_blame_opts = {
    delay = 1000,
    virt_text_pos = 'eol'
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  word_diff = false,
  diff_opts = {
    internal = true
  }
}

-- require('feline').setup({
--     preset = 'noicon',
-- })
EOF


lua << EOF
local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local b = vim.b
local fn = vim.fn

local M = {
    properties = {
        force_inactive = {
            filetypes = {},
            buftypes = {},
            bufnames = {}
        }
    },
    components = {
      active = {},
      inactive = {}
    }
}

table.insert(M.components.active,{})
table.insert(M.components.active,{})
table.insert(M.components.active,{})

table.insert(M.components.inactive,{})
table.insert(M.components.inactive,{})

M.properties.force_inactive.filetypes = {
    'packer',
    'startify',
    'fugitive',
    'fugitiveblame',
    'qf',
    'help'
}

M.properties.force_inactive.buftypes = {
    'terminal'
}

M.components.active[1][1] = {
    provider = '> ',
    hl = {
        fg = 'skyblue'
    }
}

M.components.active[1][2] = {
    provider = 'vi_mode',
    hl = function()
        local val = {}

        val.name = vi_mode_utils.get_mode_highlight_name()
        val.fg = vi_mode_utils.get_mode_color()
        val.style = 'bold'

        return val
    end,
    right_sep = ' ',
    icon = ''
}

M.components.active[1][3] = {
    provider = 'file_info',
    hl = {
        fg = 'white',
        bg = 'oceanblue',
        style = 'bold'
    },
    left_sep = '',
    right_sep = ' ',
    icon = ''
}

M.components.active[1][4] = {
    provider = 'file_size',
    enabled = function() return fn.getfsize(fn.expand('%:p')) > 0 end,
    right_sep = {
        ' ',
        {
            str = 'vertical_bar_thin',
            hl = {
                fg = 'fg',
                bg = 'bg'
            }
        },
    }
}

M.components.active[1][5] = {
    provider = 'position',
    left_sep = ' ',
    right_sep = {
        ' ',
        {
            str = 'vertical_bar_thin',
            hl = {
                fg = 'fg',
                bg = 'bg'
            }
        }
    }
}

M.components.active[1][6] = {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist('Error') end,
    hl = { fg = 'red' },
    icon = ' E-'
}

M.components.active[1][7] = {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist('Warning') end,
    hl = { fg = 'yellow' },
    icon = ' W-'
}

M.components.active[1][8] = {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist('Hint') end,
    hl = { fg = 'cyan' },
    icon = ' H-'
}

M.components.active[1][9] = {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist('Information') end,
    hl = { fg = 'skyblue' },
    icon = ' I-'
}

M.components.active[3][1] = {
    provider = function()
      local result = vim.lsp.buf_get_clients()
      local count = 0
      for _ in pairs(result) do count = count + 1 end
      if next(result) ~= nil then
        return "LSP: " .. (result[0] or result[1]).name
      else
        return "LSP: none"
      end

    end,
    hl = {
        fg = 'red',
        bg = 'black',
        style = 'bold'
    },
    icon = ' ',
    right_sep = {
            str = ' |',
            hl = {
                fg = 'white',
                bg = 'black'
            }
    }
}

M.components.active[3][2] = {
    provider = 'git_branch',
    hl = {
        fg = 'white',
        bg = 'black',
        style = 'bold'
    },
    right_sep = function()
        local val = {hl = {fg = 'NONE', bg = 'black'}}
        if b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

        return val
    end,
    icon = ' '
}

M.components.active[3][3] = {
    provider = 'git_diff_added',
    hl = {
        fg = 'green',
        bg = 'black'
    },
    icon = ' +'
}

M.components.active[3][4] = {
    provider = 'git_diff_changed',
    hl = {
        fg = 'orange',
        bg = 'black'
    },
    icon = ' ~'
}

M.components.active[3][5] = {
    provider = 'git_diff_removed',
    hl = {
        fg = 'red',
        bg = 'black'
    },
    right_sep = function()
        local val = {hl = {fg = 'NONE', bg = 'black'}}
        if b.gitsigns_status_dict then val.str = ' ' else val.str = '' end

        return val
    end,
    icon = ' -'
}

M.components.active[3][6] = {
    provider = 'line_percentage',
    hl = {
        style = 'bold'
    },
    left_sep = '  ',
    right_sep = ' '
}


M.components.inactive[1][1] = {
    provider = 'file_type',
    hl = {
        fg = 'white',
        bg = 'oceanblue',
        style = 'bold'
    },
    left_sep = {
        str = ' ',
        hl = {
            fg = 'NONE',
            bg = 'oceanblue'
        }
    },
    right_sep = {
        {
            str = ' ',
            hl = {
                fg = 'NONE',
                bg = 'oceanblue'
            }
        },
        ' '
    }
}

require('feline').setup({
    colors = M.colors,
    separators = M.separators,
    components = M.components,
    force_inactive =  M.properties.force_inactive,
    vi_mode_colors = M.vi_mode_colors
})
EOF
set showcmd
" vimrc

let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"


lua << EOF
local cmp = require("cmp")
    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
      local col = vim.fn.col(".") - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["UltiSnips#Anon"](args.body)
        end,
      },
      sources = {
        { name = "ultisnips" },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'nvim_lsp' },
      { name = 'look' },
        -- more sources
      },
      -- Configure for <TAB> people
      -- - <TAB> and <S-TAB>: cycle forward and backward through autocompletion items
      -- - <TAB> and <S-TAB>: cycle forward and backward through snippets tabstops and placeholders
      -- - <TAB> to expand snippet when no completion item selected (you don't need to select the snippet from completion item to expand)
      -- - <C-space> to expand the selected snippet from completion menu
      mapping = {
        ["<C-Space>"] = cmp.mapping(function(fallback)
          if vim.fn.pumvisible() == 1 then
            if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
              return vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"))
            end

            vim.fn.feedkeys(t("<C-n>"), "n")
          elseif check_back_space() then
            vim.fn.feedkeys(t("<cr>"), "n")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if vim.fn.complete_info()["selected"] == -1 and vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
            vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"))
          elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
            vim.fn.feedkeys(t("<ESC>:call UltiSnips#JumpForwards()<CR>"))
          elseif vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(t("<C-n>"), "n")
          elseif check_back_space() then
            vim.fn.feedkeys(t("<tab>"), "n")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
            return vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
          elseif vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(t("<C-p>"), "n")
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      },
    })
  vim.g.UltiSnipsRemoveSelectModeMappings = 0
EOF

lua << EOF
require('bufferline').setup({
  options = {
    numbers = function(opts) return string.format("[%s]",opts.id) end,
    close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    indicator_icon = '| ',
    buffer_close_icon = '',
    modified_icon = 'x',
    close_icon = 'k',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    show_buffer_icons = false, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    separator_style = {'|','|'},
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    sort_by = 'directory'
  }
})
EOF

set termguicolors " this variable must be enabled for colors to be applied properly

lua << EOF
  require"octo".setup({
  default_remote = {"upstream", "origin"}; -- order to try remotes
  reaction_viewer_hint_icon = "";         -- marker for user reactions
  user_icon = "";                        -- user icon
  timeline_marker = "";                   -- timeline marker
  timeline_indent = "2";                   -- timeline indentation
  right_bubble_delimiter = ")";            -- Bubble delimiter
  left_bubble_delimiter = "(";             -- Bubble delimiter
  github_hostname = "";                    -- GitHub Enterprise host
  snippet_context_lines = 4;               -- number or lines around commented lines
  file_panel = {
    size = 10,                             -- changed files panel rows
    use_icons = false                       -- use web-devicons in file panel
  },
  mappings = {
    issue = {
      close_issue = "<space>ic",           -- close issue
      reopen_issue = "<space>io",          -- reopen issue
      list_issues = "<space>il",           -- list open issues on same repo
      reload = "<C-r>",                    -- reload issue
      open_in_browser = "<C-b>",           -- open issue in browser
      copy_url = "<C-y>",                  -- copy url to system clipboard
      add_assignee = "<space>aa",          -- add assignee
      remove_assignee = "<space>ad",       -- remove assignee
      create_label = "<space>lc",          -- create label
      add_label = "<space>la",             -- add label
      remove_label = "<space>ld",          -- remove label
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    pull_request = {
      checkout_pr = "<space>po",           -- checkout PR
      merge_pr = "<space>pm",              -- merge PR
      list_commits = "<space>pc",          -- list PR commits
      list_changed_files = "<space>pf",    -- list PR changed files
      show_pr_diff = "<space>pd",          -- show PR diff
      add_reviewer = "<space>va",          -- add reviewer
      remove_reviewer = "<space>vd",       -- remove reviewer request
      close_issue = "<space>ic",           -- close PR
      reopen_issue = "<space>io",          -- reopen PR
      list_issues = "<space>il",           -- list open issues on same repo
      reload = "<C-r>",                    -- reload PR
      open_in_browser = "<C-b>",           -- open PR in browser
      copy_url = "<C-y>",                  -- copy url to system clipboard
      add_assignee = "<space>aa",          -- add assignee
      remove_assignee = "<space>ad",       -- remove assignee
      create_label = "<space>lc",          -- create label
      add_label = "<space>la",             -- add label
      remove_label = "<space>ld",          -- remove label
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    review_thread = {
      goto_issue = "<space>gi",            -- navigate to a local repo issue
      add_comment = "<space>ca",           -- add comment
      add_suggestion = "<space>sa",        -- add suggestion
      delete_comment = "<space>cd",        -- delete comment
      next_comment = "]c",                 -- go to next comment
      prev_comment = "[c",                 -- go to previous comment
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      react_hooray = "<space>rp",          -- add/remove 🎉 reaction
      react_heart = "<space>rh",           -- add/remove ❤️ reaction
      react_eyes = "<space>re",            -- add/remove 👀 reaction
      react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
      react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
      react_rocket = "<space>rr",          -- add/remove 🚀 reaction
      react_laugh = "<space>rl",           -- add/remove 😄 reaction
      react_confused = "<space>rc",        -- add/remove 😕 reaction
    },
    submit_win = {
      approve_review = "<C-a>",            -- approve review
      comment_review = "<C-m>",            -- comment review
      request_changes = "<C-r>",           -- request changes review
      close_review_tab = "<C-c>",          -- close review tab
    },
    review_diff = {
      add_review_comment = "<space>ca",    -- add a new review comment
      add_review_suggestion = "<space>sa", -- add a new review suggestion
      focus_files = "<leader>e",           -- move focus to changed file panel
      toggle_files = "<leader>b",          -- hide/show changed files panel
      next_thread = "]t",                  -- move to next thread
      prev_thread = "[t",                  -- move to previous thread
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
    },
    file_panel = {
      next_entry = "j",                    -- move to next changed file
      prev_entry = "k",                    -- move to previous changed file
      select_entry = "<cr>",               -- show selected changed file diffs
      refresh_files = "R",                 -- refresh changed files panel
      focus_files = "<leader>e",           -- move focus to changed file panel
      toggle_files = "<leader>b",          -- hide/show changed files panel
      select_next_entry = "]q",            -- move to previous changed file
      select_prev_entry = "[q",            -- move to next changed file
      close_review_tab = "<C-c>",          -- close review tab
      toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
    }
  }
})
EOF
au BufEnter octo://* nmap q :bd<cr>

imap <expr> kk   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> kk   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> KK vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> KK vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

imap <c-x><c-l> <plug>(fzf-complete-line)
map <tab> <c-w>w
let g:preview_uml_url='http://localhost:8888'
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
