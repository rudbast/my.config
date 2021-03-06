call plug#begin('~/.config/nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'myusuf3/numbers.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'yggdroot/indentline'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'flazz/vim-colorschemes'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'javascript.jsx'] }
Plug 'tpope/vim-sleuth'
Plug 'majutsushi/tagbar'
"Plug 'Valloric/YouCompleteMe'

Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'jodosha/vim-godebug'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'digitaltoad/vim-pug'
Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'cespare/vim-toml'
"Plug 'maralla/vim-toml-enhance', {'depends': 'cespare/vim-toml'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

call plug#end()

set nocompatible
filetype off
filetype plugin indent on
set ttyfast
set autoread
set autoindent
set backspace=indent,eol,start
set laststatus=2
"set hlsearch
set noerrorbells
set number
set splitright
set splitbelow
set fileformats=unix,dos,mac
set noshowmatch
set noshowmode
set nocursorcolumn
set cursorline
set lazyredraw

set noet nowrap tw=0 ww=0
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set nobackup
set pastetoggle=<F5>
set scrolloff=5

colorscheme molokai

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')

    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Vim status line settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
" Populate proper symbol font
let g:airline_powerline_fonts = 1
" Configure symbol
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" Ctrlp-funky highlight syntax
let g:ctrlp_funky_syntax_highlight = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Use Ag over Grep.
set grepprg=ag\ --nogroup\ --nocolor
"let g:ctrlp_user_command = 'ag %s -l --nocolor'
let g:ctrlp_user_command = {
  \ 'types': {
  \ 1: ['.git', 'cd %s && git ls-files'],
  \ 2: ['.hg', 'hg --cwd %s locate -I .'],
  \ },
  \ 'fallback': 'ag %s -l --nocolor --nogroup --hidden
  \ --ignore out
  \ --ignore .git
  \ --ignore .svn
  \ --ignore .hg
  \ --ignore .DS_Store
  \ --ignore "**/*.pyc"
  \ -g ""'
  \ }

let g:ctrlp_match_window = 'max:30,results=100'

let mapleader = ','

" Show invisible characters.
set listchars=eol:¬,tab:»\ ,trail:·,extends:›,precedes:‹,nbsp:·
set list

" Map Keys.
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

nnoremap nt  :NERDTreeToggle<CR>

nnoremap <F4> :set hlsearch!<CR>
nnoremap <F6> :CtrlPBuffer<CR>
nnoremap <F8> :TagbarToggle<CR>

nnoremap <Leader>yy :set clipboard=unnamedplus<CR>
nnoremap <Leader>yc :set clipboard=<CR>

" GoLang settings.
autocmd FileType go nmap <Leader>gdc <Plug>(go-doc)
autocmd FileType go nmap <Leader>goi <Plug>(go-info)

autocmd FileType go nnoremap <Leader>god :GoDecls<CR>
autocmd FileType go nnoremap <Leader>gor :GoDeclsDir<CR>
autocmd FileType go nnoremap <Leader>gsi :GoSameIds<CR>
autocmd FileType go nnoremap <Leader>gsc :GoSameIdsClear<CR>
autocmd FileType go nnoremap <Leader>gof :GoFmt<CR>

let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1

let g:go_auto_type_info = 0

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 0
let g:go_def_mode = "godef"
let g:go_info_mode = "gocode"
let g:go_decls_include = "func,type"

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = '/home/rudolf/workspace/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:javascript_plugin_jsdoc = 1

" Let <Tab> also do completion
inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:goyo_width = 100

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
