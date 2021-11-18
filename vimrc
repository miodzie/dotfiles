" Bare bones .vimrc, for when I don't want the nvim or plugins

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','
set nocompatible                                    

" Hides bar, default is 2
set laststatus=0

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
nnoremap <silent> <F4> gggqG
nnoremap <silent> <F4> gggqG
inoremap <silent> <F4> <C-R>=strftime("%m/%d/%y %H:%M:%S")<CR>
nnoremap <silent> <F5> "=strftime("%m/%d/%y %H:%M:%S")<CR>P
inoremap <silent> <F5> <C-R>=strftime("%m/%d/%y %H:%M:%S")<CR>

nnoremap <silent> <F2> :set relativenumber!<CR> 

"Make it easier to indent a visual selection several times.  
xnoremap > >gv
xnoremap < <gv 

nmap <Leader>ev :tabnew ~/.vimrc<cr> 
nmap <Leader>es :e ~/.vim/snippets/
nmap <Leader><space> :nohlsearch<cr>

cmap w!! %!sudo tee > /dev/null %

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

nmap \x :cclose<cr>
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

" qq to record, Q to replay
nnoremap Q @q

" #!! | Shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

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
" what the heck does this do?
highlight Search cterm=underline 

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
    autocmd BufWritePost .vimrc source %
augroup END
