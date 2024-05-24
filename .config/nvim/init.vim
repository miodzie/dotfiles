let mapleader = ','

call plug#begin('~/.local/share/nvim/plugged') 

Plug 'vimwiki/vimwiki' 

" how does he do it
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired' 

Plug 'miodzie/monokai-pro.nvim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree'
nmap \F :NERDTreeFind 
nmap \e :NERDTreeToggle<CR><C-w>=
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/nvim-cmp'

" vsnip
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
xmap        <C-l>  <Plug>(vsnip-cut-text)
imap <expr> <C-l>  vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

" Using Lua functions
nnoremap <leader>a <cmd>lua require('telescope.builtin').treesitter()<cr>
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>F <cmd>lua require('telescope.builtin').find_files({ no_ignore = true, search_dirs = {"vendor"} })<cr>
nnoremap <leader>G <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap ; <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>H <cmd>lua require('telescope.builtin').help_tags()<cr>
" git
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
" lsp
nnoremap <leader>r <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>i <cmd>lua require('telescope.builtin').lsp_implementations()<cr>

call plug#end()

lua require('plugins')

set cursorline " i unironically like this
set relativenumber 
set clipboard+=unnamedplus 
set number
set autowriteall 
set splitbelow " switch to splits
set splitright

" qq to record, Q to replay
nnoremap Q @q
xnoremap > >gv
xnoremap < <gv 
" Maintain the cursor position when yanking a visual selection http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y
nmap \r :!tmux send-keys -t bottom C-p C-j <CR><CR>

" Print time
inoremap <silent> <F4> <C-R>=strftime("11/20/21 03:35:43%m/%d/%y %H:%M:%S")<CR>
nnoremap <silent> <F5> "=strftime("%m/%d/%y %H:%M:%S")<CR>P
inoremap <silent> <F5> <C-R>=strftime("%m/%d/%y %H:%M:%S")<CR>
" Print git branch (work commits)
nnoremap <silent> <F2> :.!git rev-parse --abbrev-ref HEAD<CR>A 
inoremap <silent> <F2> <Esc>:.!git rev-parse --abbrev-ref HEAD<CR>A 

nmap <Leader>ev :tabnew ~/.config/nvim/init.vim<cr> 
nmap <Leader>es :e ~/.config/nvim/snippets/
nmap <Leader><space> :nohlsearch<cr>

" Easy moving between splits
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-h> <C-W><C-H>
nmap <C-l> <C-W><C-L>

" Move lines up and down with ctrl-alt+j,k
nnoremap <C-A-j> :m .+1<CR>==
nnoremap <C-A-k> :m .-2<CR>==
inoremap <C-A-j> <Esc>:m .+1<CR>==gi
inoremap <C-A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-A-j> :m '>+1<CR>gv=gv
vnoremap <C-A-k> :m '<-2<CR>gv=gv

inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>Q :qa!<cr>

nnoremap <C-w>+ 10<C-w>+
nnoremap <C-w>- 10<C-w>- 
nnoremap <C-w>> 10<C-w>>
nnoremap <C-w>< 10<C-w>< 

nnoremap <C-w>k 10<C-w>+
nnoremap <C-w>j 10<C-w>-
nnoremap <C-w>l 10<C-w>>
nnoremap <C-w>h 10<C-w><

nnoremap <C-]> g<C-]> 

" Better tab movement
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Highlight TODO: 
syn keyword   cTodo   contained    TODO FIXME XXX
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|IDEA|TODOs|TODOS):/
                \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo


colorscheme monokai-pro
lua << EOF
require("monokai-pro").setup({
  transparent_background = false,
  terminal_colors = true,
  devicons = true, -- highlight the icons of `nvim-web-devicons`
  styles = {
    comment = { italic = true },
    keyword = { italic = true }, -- any other keyword
    type = { italic = true }, -- (preferred) int, long, char, etc
    storageclass = { italic = true }, -- static, register, volatile, etc
    structure = { italic = true }, -- struct, union, enum, etc
    parameter = { italic = true }, -- parameter pass in function
    annotation = { italic = true },
    tag_attribute = { italic = true }, -- attribute of tag in reactjs
  },
  filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
  -- Enable this will disable filter option
  day_night = {
    enable = false, -- turn off by default
    day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  },
  inc_search = "background", -- underline | background
  background_clear = {
    -- "float_win",
    "toggleterm",
    "telescope",
    -- "which-key",
    "renamer",
    "notify",
    "nvim-tree",
    -- "neo-tree",
    -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
  },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible = false,
    },
    indent_blankline = {
      context_highlight = "default", -- default | pro
      context_start_underline = false,
    },
  },
  ---@param c Colorscheme
  override = function(c) end,
})
EOF

