"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Sections:
"   -> Plugins.
"   -> General.
"   -> Syntax, Language specific, auto completion.
"   -> Mappings.
"   -> Editing.
"   -> Text, tab and indent related.
"   -> Colors, Visuals, and Fonts.
"   -> Moving around, tabs, buffers, and splits.
"   -> Autocmd.
"   -> Misc.
"   -> Post plugin load.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" So it begins...
let mapleader = ','

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged') 
Plug 'vimwiki/vimwiki' 
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
let g:vimwiki_list = [{'auto_tags': 1}]

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users. I can't believe i'm forced to use a snippet engine, smh
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap        s   <Plug>(vsnip-select-text)
" xmap        s   <Plug>(vsnip-select-text)
" nmap        S   V<Plug>(vsnip-cut-text)
" xmap        S   V<Plug>(vsnip-cut-text)
xmap        <C-l>  <Plug>(vsnip-cut-text)
imap <expr> <C-l>  vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

Plug 'skwp/greplace.vim'
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Plug 'hrsh7th/nvim-compe'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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

Plug 'ThePrimeagen/git-worktree.nvim'
nnoremap <leader>tn <cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>
nnoremap <leader>tt <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>
" <Enter> - switches to that worktree
" <c-d> - deletes that worktree
" <c-f> - toggles forcing of the next deletion

" Our one true God
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired' 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
nmap <C-_> gcc
vmap <C-_> gc

" Plug 'jiangmiao/auto-pairs'
" let g:AutoPairsFlyMode = 0 "0 is default
" System Shortcuts:
"     <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
"     <BS>  : Delete brackets in pair
"     <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
"     <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
"     <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
"     <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)

" If <M-p> <M-e> or <M-n> conflict with another keys or want to bind to another keys, add
"     let g:AutoPairsShortcutToggle = '<another key>'
" to .vimrc, if the key is empty string '', then the shortcut will be disabled.

" Visuals
Plug 'miodzie/vim-gitgutter' 
" Plug 'morhetz/gruvbox'
Plug 'miodzie/vim-deus'
"Plug 'arcticicestudio/nord-vim'
"Plug 'gruvbox-community/gruvbox'
Plug 'miodzie/monokai-pro.nvim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'
let g:airline#extensions#hunks#enabled=0
let g:airline_section_z = ''
let g:airline#extensions#whitespace#enabled = 0

" Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'akinsho/bufferline.nvim'
" lua << EOF
" require("bufferline").setup{}
" EOF

let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#h'}

Plug 'christoomey/vim-tmux-navigator'

Plug 'scrooloose/nerdtree'
nmap \F :NERDTreeFind 
nmap \e :NERDTreeToggle<CR><C-w>=
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1

call plug#end()

hi! link VimwikiHeader1 GruvboxYellowBold
hi! link VimwikiHeader3 GruvboxAquaBold

set completeopt=menu,menuone,noselect


lua require('plugins')
lua require('telescope').load_extension('git_worktree')
lua require('worktree-hooks')
lua require('test')
nnoremap T <cmd>lua require('test').nav_test_toggle()<cr>


"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                                    
filetype plugin on

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' `
set complete=.,w,b,u,t,i,kspell "Set our desired autocompletion matching

set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

set laststatus=0

set showcmd "Show (partial) command in the status line.  
set magic " For regular expressions turn magic on 
set t_vb= " Remove code to flash screen
set tm=500 " Timeout length
set backspace=indent,eol,start " Allow backspace beyond insertion point
set autoread
set undofile

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax, Language specific, auto completion. {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if hidden is not set, TextEdit might fail.
set hidden 
set nobackup
set nowritebackup 
set noswapfile 
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100 
" don't give |ins-completion-menu| messages.
set shortmess+=c 
" always show signcolumns
set signcolumn=yes

nnoremap <silent> <F4> gggqG
nnoremap <silent> <F4> gggqG
inoremap <silent> <F4> <C-R>=strftime("11/20/21 03:35:43%m/%d/%y %H:%M:%S")<CR>
nnoremap <silent> <F5> "=strftime("%m/%d/%y %H:%M:%S")<CR>P
inoremap <silent> <F5> <C-R>=strftime("%m/%d/%y %H:%M:%S")<CR>

nnoremap <silent> <F2> :.!git rev-parse --abbrev-ref HEAD<CR>A 
inoremap <silent> <F2> <Esc>:.!git rev-parse --abbrev-ref HEAD<CR>A 

"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" nnoremap <silent> <F2> :set relativenumber!<CR> 

"Make it easier to indent a visual selection several times.  
xnoremap > >gv
xnoremap < <gv 

nmap <Leader>ev :tabnew ~/.config/nvim/init.vim<cr> 
nmap <Leader>es :e ~/.config/nvim/snippets/
nmap <Leader><space> :nohlsearch<cr>

cmap w!! %!sudo tee > /dev/null %

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

nmap \x :cclose<cr>
nmap \g :GitGutterToggle<CR>
nmap \G :GitGutterLineHighlightsToggle<CR>
command! Gqf GitGutterQuickFix | copen
nmap \r :!tmux send-keys -t bottom C-p C-j <CR><CR>
nmap \z :e! %<CR>

" Move lines up and down with ctrl-alt+j,k
nnoremap <C-A-j> :m .+1<CR>==
nnoremap <C-A-k> :m .-2<CR>==
inoremap <C-A-j> <Esc>:m .+1<CR>==gi
inoremap <C-A-k> <Esc>:m .-2<CR>==gi
vnoremap <C-A-j> :m '>+1<CR>gv=gv
vnoremap <C-A-k> :m '<-2<CR>gv=gv

" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
" nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Zoom
function! s:zoom()
    if winnr('$') > 1
        tab split
    elseif len(filter(map(range(tabpagenr('$')), 'tabpagebuflist(v:val + 1)'),
                \ 'index(v:val, '.bufnr('').') >= 0')) > 1
        tabclose
    endif
endfunction
nnoremap <silent> <leader>z :call <sid>zoom()<cr>

" qq to record, Q to replay
nnoremap Q @q

" Quickfix
nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz
nnoremap ]l :lnext<cr>zz
nnoremap [l :lprev<cr>zz

" #!! | Shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" ----------------------------------------------------------------------------
" :A
" ----------------------------------------------------------------------------
function! s:a(cmd)
    let name = expand('%:r')
    let ext = tolower(expand('%:e'))
    let sources = ['c', 'cc', 'cpp', 'cxx']
    let headers = ['h', 'hh', 'hpp', 'hxx']
    for pair in [[sources, headers], [headers, sources]]
        let [set1, set2] = pair
        if index(set1, ext) >= 0
            for h in set2
                let aname = name.'.'.h
                for a in [aname, toupper(aname)]
                    if filereadable(a)
                        execute a:cmd a
                        return
                    end
                endfor
            endfor
        endif
    endfor
endfunction
command! A call s:a('e')
command! AV call s:a('botright vertical split')

" ----------------------------------------------------------------------------
" <F1> | Run script
" ----------------------------------------------------------------------------
function! s:run_this_script(output)
  let head   = getline(1)
  let pos    = stridx(head, '#!')
  let file   = expand('%:p')
  let ofile  = tempname()
  let rdr    = " 2>&1 | tee ".ofile
  let win    = winnr()
  let prefix = a:output ? 'silent !' : '!'
  " Shebang found
  if pos != -1
    execute prefix.strpart(head, pos + 2).' '.file.rdr
  " Shebang not found but executable
  elseif executable(file)
    execute prefix.file.rdr
  elseif &filetype == 'ruby'
    execute prefix.'/usr/bin/env ruby '.file.rdr
  elseif &filetype == 'tex'
    execute prefix.'latex '.file. '; [ $? -eq 0 ] && xdvi '. expand('%:r').rdr
  elseif &filetype == 'dot'
    let svg = expand('%:r') . '.svg'
    let png = expand('%:r') . '.png'
    " librsvg >> imagemagick + ghostscript
    execute 'silent !dot -Tsvg '.file.' -o '.svg.' && '
          \ 'rsvg-convert -z 2 '.svg.' > '.png.' && open '.png.rdr
  else
    return
  end
  redraw!
  if !a:output | return | endif

  " Scratch buffer
  if exists('s:vim_exec_buf') && bufexists(s:vim_exec_buf)
    execute bufwinnr(s:vim_exec_buf).'wincmd w'
    %d
  else
    silent!  bdelete [vim-exec-output]
    silent!  vertical botright split new
    silent!  file [vim-exec-output]
    setlocal buftype=nofile bufhidden=wipe noswapfile
    let      s:vim_exec_buf = winnr()
  endif
  execute 'silent! read' ofile
  normal! gg"_dd
  execute win.'wincmd w'
endfunction
" nnoremap <silent> <F1> :call <SID>run_this_script(0)<cr>
nnoremap <silent> <F1> :call <SID>run_this_script(1)<cr>

" ----------------------------------------------------------------------------
" Todo
" ----------------------------------------------------------------------------
function! s:todo() abort
    let entries = []
    for cmd in ['git grep -niI -e TODO -e FIXME -e XXX 2> /dev/null',
                \ 'grep -rniI -e TODO -e FIXME -e XXX * 2> /dev/null']
        let lines = split(system(cmd), '\n')
        if v:shell_error != 0 | continue | endif
        for line in lines
            let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
            call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
        endfor
        break
    endfor

    if !empty(entries)
        call setqflist(entries)
        copen
    endif
endfunction
command! Todo call s:todo()
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set relativenumber 
set clipboard=unnamedplus 
set number

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr> 
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related. {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase              " Case insensitive
set smartcase               " Lets you search for ALL CAPS 
set autoindent              " Auto indents new lines.
set expandtab 
set tabstop=2
set shiftwidth=2
set softtabstop=2
autocmd Filetype php setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
set copyindent 
set smarttab 
set lbr
set infercase               " Completion recognizes capitalization
set linebreak               " Break long lines by word, not char 
set nowrap
set textwidth=72
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
nnoremap <space> za
vnoremap <space> zf 
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

map <F7> gg=G<C-o><C-o>
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Visuals, and Fonts. {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
syntax on 
set termguicolors
set background=dark
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
  filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
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
colorscheme deus
let g:deus_termcolors=256
" For transparent term
" hi Normal guibg=NONE ctermbg=NONE

" Highlight TODO: 
syn keyword   cTodo   contained    TODO FIXME XXX
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|IDEA|TODOs|TODOS):/
                \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers. {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set hlsearch
set incsearch
highlight Search cterm=underline

" Make it easier to move through wrapped lines.
" nnoremap j gj
" nnoremap k gk

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
nnoremap tl  :tablast<CR>
" nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Move between open buffers.
nmap <C-n> :bnext<CR><C-g>
nmap <C-p> :bprev<CR><C-g>

" Automatically write the file when switching buffers.
set autowriteall 

" More natural split opening
set splitbelow
set splitright

" Easy moving between splits
nmap <C-j> <C-W><C-J>
nmap <C-k> <C-W><C-K>
nmap <C-h> <C-W><C-H>
nmap <C-l> <C-W><C-L>

let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-j> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmd. {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize panes when window/terminal gets resize
autocmd VimResized * :wincmd =

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif 

"Automatically source the Vimrc file on save."
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END

" Remember info about open buffers on close
"Disabled because it's annoying when you have multiple open sessions
"set viminfo^=% 
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" An additional vimrc settings file specific to the machine i'm working on.
source ~/.vimrc_specific
