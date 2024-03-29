if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-git'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/html5.vim'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'ElmCast/elm-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'tpope/vim-sleuth'
Plug 'tweekmonster/django-plus.vim'

Plug 'vimlab/split-term.vim'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-ragtag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'thinca/vim-visualstar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'Shougo/neosnippet.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'janko-m/vim-test'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Yggdroot/indentLine'

call plug#end()

set nocompatible
filetype plugin indent on

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }

" the Flow plugin is useful but by default it type checks on save
" don't need this to happen because Ale does that for us instead
let g:flow#enable = 0

" turns on Flow syntax highlighting
" let g:javascript_plugin_flow = 1

" looks for JSX in just .js files
let g:jsx_ext_required = 0

set go-=R
set go-=L

syntax on
" color dracula


let g:neosnippet#snippets_directory = '~/.config/nvim/UltiSnips'
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

let g:tsuquyomi_disable_default_mappings = 1

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set shiftround
set noshowcmd
set nofoldenable
map K <Nop>

runtime macros/matchit.vim

" wrap quickfix window
autocmd FileType qf setlocal wrap linebreak

autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json

function! SyntaxItem()
  echo synIDattr(synID(line("."),col("."),1),"name")
endfunction

" status bar
set statusline=%F%m%r%h%w\  "fullpath and status modified sign
set statusline+=\ %y "filetype
set statusline+=\ %{fugitive#statusline()}
" this line below pushes everything below it to the right hand side
set statusline+=%=
set statusline+=\%l

" assume the /g flag on :s substitutions to replace all matches in a line
" set gdefault

set autoread

set breakindent

" fix slight delay after pressing ESC then O http://ksjoberg.com/vim-esckeys.html
set timeout timeoutlen=500 ttimeoutlen=100

set history=500
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set ignorecase smartcase

set spelllang=en_gb
syntax spell toplevel

if (has("termguicolors"))
   " set termguicolors
endif

set background=dark
colorscheme PaperColor

autocmd FileType markdown setlocal shiftwidth=4 softtabstop=4 tabstop=4 wrap linebreak nolist wrap lbr colorcolumn=0 synmaxcol=999999
autocmd FileType elm setlocal shiftwidth=4 softtabstop=4 tabstop=4

set laststatus=2

set colorcolumn=65

set linebreak

set incsearch
set hlsearch

set scrolloff=5

set nobackup
set nowritebackup
set noswapfile

set backspace=indent,eol,start

set wildmode=full
set wildmenu

let mapleader=","
noremap \ ,

set wildignore+=*.o,*.obj,.git,node_modules,_site,*.class,*.zip,*.aux

set number
" set relativenumber
" set cursorline

" clear highlights by hitting ESC
" or by hitting enter in normal mode
nnoremap <CR> :noh<CR><CR>

set list listchars=tab:»·,trail:·

command! Q q

set splitbelow
set splitright

set tags=./.tags;

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx

" make the completion menu a bit more readable
highlight PmenuSel ctermbg=white ctermfg=black
highlight Pmenu ctermbg=black ctermfg=white

" so it's clear which paren I'm on and which is matched
highlight MatchParen cterm=none ctermbg=none ctermfg=yellow

"few nicer JS colours
" highlight xmlAttrib ctermfg=121
" highlight jsThis ctermfg=224
" highlight jsSuper ctermfg=13
" highlight jsFuncCall ctermfg=cyan
" highlight jsComment ctermfg=245 ctermbg=none
" highlight jsClassProperty ctermfg=14 cterm=bold

" ~~~ MAPPINGS BELOW ~~~

"gtfo ex mode
map Q <Nop>

" vim-test
map <Leader>e :TestFile<CR>
map <Leader>n :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>s :TestSuite<CR>

" new file in current directory
map <Leader>nf :e <C-R>=expand("%:p:h") . "/" <CR>

" toggle spellcheck
map <leader>sc :setlocal spell!<CR>

map <leader>v :vsplit<CR>

" clean up any trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Don't add the comment prefix when I hit enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

noremap H ^
noremap L $

" http://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
" better jk normally but don't remap when it's called with a count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" FZF.vim
nnoremap <leader>t :Files<cr>
nnoremap <leader>b :Buffers<cr>

" let g:fzf_prefer_tmux = 1

" Elm.vim settings
let g:elm_format_autosave = 1
let g:elm_setup_keybindings = 0

" make copy/paste from system clip easier
vnoremap <leader>8 "*y
vnoremap <leader>9 "*p
nnoremap <leader>8 "*p

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
" disable the Ale HTML linters
let g:ale_linters = {
\   'html': [],
\}
let g:ale_set_highlights = 0

" stop Elm.vim trying to show compiler erorrs in Vim
let g:elm_format_fail_silently = 1

" set Prettier up to run on save
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = [
\  'prettier'
\]
let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5 --no-semi'

if has('nvim')
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-l> <c-\><c-n><c-w>l
  tnoremap <Esc> <C-\><C-n>
  set inccommand=split

  autocmd BufWinEnter,WinEnter term://* startinsert

  let test#strategy = 'neovim'
endif

set completeopt-=preview

" so Emmet.vim will work in JSX
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends': 'jsx',
\      'quote_char': '"',
\  },
\}

let g:localvimrc_persistent = 2

