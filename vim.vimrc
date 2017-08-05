set nocompatible

" Initiate pathogen.
execute pathogen#infect()

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
set pastetoggle=<F4>

" Set color scheme to seti by setting to Monokai first (strange error not sure why)
colorscheme molokai
set background=dark

syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1

" Vim status line settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
" Populate proper symbol font
let g:airline_powerline_fonts = 1
" Configure symbol
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
"let g:airline_left_sep = ':arrow_forward:'
let g:airline_left_sep = ''
"let g:airline_right_sep = ':arrow_backward:'
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

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

" GoLang settings.
autocmd FileType go nmap <Leader>gdc <Plug>(go-doc)
autocmd FileType go nmap <Leader>goi <Plug>(go-info)

autocmd FileType go nnoremap <Leader>god :GoDecls<CR>
autocmd FileType go nnoremap <Leader>gor :GoDeclsDir<CR>
autocmd FileType go nnoremap <Leader>gsi :GoSameIds<CR>
autocmd FileType go nnoremap <Leader>gsc :GoSameIdsClear<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 0
let g:go_def_mode = "godef"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
