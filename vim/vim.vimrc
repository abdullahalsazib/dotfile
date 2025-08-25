
" =============================
"          BASIC SETTINGS
" =============================
set nocompatible
filetype plugin indent on
syntax enable
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set clipboard=unnamedplus

set colorcolumn=80
set cursorline
" set cursorcolumn
set termguicolors
set background=dark
set scrolloff=8
set hlsearch

let mapleader=" "


" =============================
"        PLUGIN MANAGER
" =============================
call plug#begin('~/.vim/plugged')

" File Navigation
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"undoTree"
Plug 'mbbill/undotree'

" Commenting
Plug 'tpope/vim-commentary'

" LSP / Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"transparent"
Plug 'tribela/vim-transparent'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Syntax Highlighting
Plug 'sheerun/vimrc'
Plug 'sheerun/vim-polyglot'

" Linting & Fixing
Plug 'w0rp/ale'

" Git
Plug 'tpope/vim-fugitive'

" Statusline
Plug 'itchyny/lightline.vim'


Plug 'jeetsukumaran/vim-buffergator'

call plug#end()



Plug 'tribela/vim-transparent'

" default
let g:transparent_groups = ['Normal', 'Comment', 'Constant', 'Special', 'Identifier',
                            \ 'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
                            \ 'Function', 'Conditional', 'Repeat', 'Operator', 'Structure',
                            \ 'LineNr', 'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer']

" Pmenu
let g:transparent_groups += ['Pmenu']

" coc.nvim
let g:transparent_groups += ['NormalFloat', 'CocFloating']

augroup transparent
    autocmd VimEnter,ColorScheme * call MyTransparent()
augroup END

function! MyTransparent()
    " Customize the highlight groups for transparency in here.

     " CursorLine
    hi CursorLine ctermfg=NONE ctermbg=239 guibg=NONE guibg=#4e4e4e
    
     " coc.nvim
    hi CocMenuSel ctermbg=239 guibg=#4e4e4e
endfunction

" =============================
"         COLORS & THEME
" =============================
let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = "dark"
colorscheme gruvbox

if has("gui_running") || &termguicolors
  set termguicolors
  highlight Normal guibg=NONE
  highlight NonText guibg=NONE
  highlight EndOfBuffer guibg=NONE
  highlight LineNr guibg=NONE
  highlight SignColumn guibg=NONE
  highlight VertSplit guibg=NONE
endif

" =============================
"          KEYBINDINGS
" =============================
" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>

nnoremap <leader>u :UndotreeToggle<CR>
" Enable saving by `Ctrl-s`
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :Rg<CR>

" Auto pairs
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" =============================
"         Coc.nvim CONFIG
" =============================
" Use popup menu for autocomplete
set completeopt=menuone,noinsert,noselect

" Enter confirms autocomplete suggestion
inoremap <expr><Enter> pumvisible() ? coc#_select_confirm() : "\<CR>"

inoremap <expr> <Tab>   coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Coc.nvim keybindings
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> K :call CocActionAsync('doHover')<CR>
" Compile current C++ file
nnoremap <leader>c :w<CR>:!g++ % -o %:r && ./ %:r<CR>

" =============================
"          ALE CONFIG
" =============================
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_virtualtext_cursor = 1
let g:ale_fix_on_save = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}

let g:ale_linters = {
\   'cpp': ['clangd', 'gcc']
\}
let g:ale_fixers = {
\   'cpp': ['clang-format']
\}
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1

" =============================
"        LIGHTLINE CONFIG
" =============================
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }


" Open Buffergator sidebar
nnoremap <leader>bg :BuffergatorToggle<CR>
" Navigate buffers
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
" Open file prompt
nnoremap <leader>bf :edit <C-R>=input("File: ")<CR><CR>

" Close buffer
nnoremap <leader>bd :bdelete<CR>

" " Optional: jump to buffer by number
" nnoremap <leader>1 :b1<CR>
" nnoremap <leader>2 :b2<CR>
" nnoremap <leader>3 :b3<CR>
