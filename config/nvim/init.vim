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

call plug#begin('~/.local/share/nvim/plugged') 

" Plebvim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Using Lua functions
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap ; <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Languages, snippets
Plug 'vim-test/vim-test'
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "neovim"
if has('nvim')
    tmap <C-o> <C-\><C-n>
endif

" Editing
Plug 'tpope/vim-commentary'
nmap <C-_> gcc
vmap <C-_> gc

Plug 'tpope/vim-unimpaired' 
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsFlyMode = 0 "0 is default

" Visuals
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' 
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ap/vim-css-color'

" Plug 'vim-airline/vim-airline'        " status bar
" Plug 'vim-airline/vim-airline-themes' " status bar themes

Plug 'junegunn/goyo.vim'
nnoremap <Leader>G :Goyo<CR>

Plug 'tpope/vim-vinegar'

Plug 'scrooloose/nerdtree'
nmap \F :NERDTreeFind 
nmap \e :NERDTreeToggle<CR><C-w>=
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1

Plug 'vimwiki/vimwiki' 
command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
hi link VimwikiHeader1 GruvboxYellowBold
hi link VimwikiHeader3 GruvboxAquaBold
let g:vimwiki_list = [{'auto_tags': 1}]

" This causes a lot of lag while NERDTree is open
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledExtensions = ['php', 'js', 'ts', 'jsx', 'tsx', 'css', 'html', 'json', 'md', 'go', 'rs'] " enabled extensions with default colors
let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico', '.env'] " enabled exact matches with default colors
Plug 'ryanoasis/vim-devicons'
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeHighlightCursorline = 0
"https://superuser.com/questions/1335155/patched-fonts-not-showing-up-on-gnome-terminal#1336614
call plug#end()


lua require("vulski")
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }, incremental_selection = { enable = true }, indent = { enable = true }}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                                    
filetype plugin on

" Marks should go to the column, not just the line. Why isn't this the default?
nnoremap ' ` 
set complete=.,w,b,u,t,i,kspell "Set our desired autocompletion matching

" set cursorline
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" Hides bar, default is 2
set laststatus=0

set showcmd "Show (partial) command in the status line.  
set magic " For regular expressions turn magic on 
set shortmess+=A            " Don't bother me when a swapfile exists 
set t_vb= " Remove code to flash screen
set tm=500 " Timeout length
set backspace=indent,eol,start " Allow backspace beyond insertion point
set autoread
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax, Language specific, auto completion.
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
inoremap <silent> <F4> <C-R>=strftime("%m/%d/%y %H:%M:%S")<CR>
nnoremap <silent> <F5> "=strftime("%m/%d/%y %H:%M:%S")<CR>P
inoremap <silent> <F5> <C-R>=strftime("%m/%d/%y %H:%M:%S")<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
nnoremap <silent> <F2> :set relativenumber!<CR> 

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set relativenumber 
set clipboard=unnamedplus 
set number

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase              " Case insensitive
set smartcase               " Lets you search for ALL CAPS 
set autoindent              " Auto indents new lines.
set expandtab 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set copyindent 
set smarttab 
set lbr
set infercase               " Completion recognizes capitalization
set linebreak               " Break long lines by word, not char 
set nowrap
set textwidth=80
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <space> za
vnoremap <space> zf 
" This is causing fzf errors?
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END

map <F7> gg=G<C-o><C-o>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors, Visuals, and Fonts.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
syntax enable 
set termguicolors

let g:gruvbox_italic=1
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox
set background=dark
" For transparent term
" hi Normal guibg=NONE ctermbg=NONE

" True color stuff
if !has('gui_running')
    set t_Co=256
endif

" Highlight TODO: 
syn keyword   cTodo   contained    TODO FIXME XXX
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|IDEA|TODOs|TODOS):/
                \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers.
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
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" Move between open buffers.
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmd.
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" An additional vimrc settings file specific to the machine i'm working on.
source ~/.vimrc_specific
