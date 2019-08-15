if !has('nvim')
    set ttymouse=xterm2
endif
if has('win32')
    set rtp+=~/AppData/Local/nvim/bundle/Vundle.vim
    let g:python3_host_prog = 'C:\python37\python3.exe'
    let g:python2_host_prog = 'C:\python27\python.exe'
    set ff=unix
else
    let g:python2_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
    set rtp+=~/.config/nvim/vim-plug
    call plug#begin('~/.config/nvim/bundle/plugged') 
endif
set t_Co=256
set nocompatible "required
filetype on
filetype indent on
filetype plugin on 
set number
set cursorline
colorscheme synthwave   
syntax enable  
if has('macunix')
    hi CursorLine guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=54 cterm=NONE
endif
hi Normal ctermbg=none guibg=none
"=============== C/C++ ============================
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'justmao945/vim-clang', { 'for': ['cpp', 'c'] }    "autocomplete for C/C++
"============= Java/Maven =========================
Plug 'mikelue/vim-maven-plugin'
Plug 'dansomething/vim-eclim', { 'for': 'java' }
"=============== Javascript ======================= 
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd BufEnter *.tsx set filetype=typescript
Plug 'pangloss/vim-javascript' "Better javascript support for Vim
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript'
Plug 'elzr/vim-json'
"=============== Python =========================== 
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
"=============== LaTeX ============================
Plug 'lervag/vimtex', { 'for': 'tex' } "autocompletion for LaTeX
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:syntastic_tex_checkers = ['lacheck']
autocmd Filetype tex setl updatetime=100 
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us "auto turn spell check on for LaTeX files
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
"============== Clojure ===========================
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' } "cool Clojure formatting tool 
Plug 'tpope/vim-fireplace', { 'for': 'clojure' } "Repl support
Plug 'venantius/vim-eastwood', { 'for': 'clojure' }
" Plug 'tpope/vim-classpath' 

"============== Perl ==============================
Plug 'vim-perl/vim-perl6'  "Perl6 support
vmap ,pt :!perltidy<CR>
nmap ,pt <ESC>:%! perltidy<CR>

"============== Ruby ==============================
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
"============== XML  ==============================
Plug 'othree/xml.vim'      
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
autocmd Filetype xml nnoremap = :FormatXML<Cr>
"============== Setup =============================
Plug 'dense-analysis/ale'
let g:ale_linters = {
            \ 'python': ['pylint'],
            \ 'c': ['gcc']
            \}
Plug 'majutsushi/tagbar'
Plug 'martinda/Jenkinsfile-vim-syntax'
map <C-b> :TagbarToggle<CR>
Plug 'vim-airline/vim-airline' "self explanatory
Plug 'tpope/vim-fugitive'      "git wrapper for vim airline
Plug 'tpope/vim-commentary'    "commment blocks of code out
Plug 'tpope/vim-surround'      "delete, change, add surrounding
Plug 'scrooloose/nerdtree'	 "file explorer for vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
Plug 'luochen1990/rainbow'     "Rainbow Parenthesis
Plug 'jiangmiao/auto-pairs'    "Auto closing of parenthesis 
Plug 'floobits/floobits-neovim'
Plug 'kien/ctrlp.vim'          
Plug 'chriskempson/base16-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'neoclide/coc.nvim', {'branch': 'release' }
Plug 'agude/vim-eldar', { 'as': 'eldar' }
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'
call plug#end()
au BufRead,BufNewFile Jenkinsfile setfiletype Jenkinsfile
au BufRead,BufNewFile *.ts set filetype=typescript
let g:ctrlp_root_markers = ['pom.xml']
let g:ctrlp_working_path_mode = 'r'
let g:rainbow_active = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#flow#flow_bin = 'flow'
let g:EclimCompletionMethod = 'omnifunc'
let g:ctrlp_map = '<C-p>'
set ignorecase
set smartcase
set completeopt-=preview
let g:ctrlp_custom_ignore = 'node_modules\|git'
:tnoremap<Esc> <C-\><C-n>

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
if has('gui_running')
    set guifont=Nimbus\ Mono\ PS\ Bold\ 13
endif

set backspace=indent,eol,start

filetype plugin indent on
