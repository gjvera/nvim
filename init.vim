if !has('nvim')
    set ttymouse=xterm2
endif
if has('win32')
    set rtp+=~/AppData/Local/nvim/bundle/Vundle.vim
    let g:python3_host_prog = 'C:\python37\python3.exe'
    let g:python2_host_prog = 'C:\python27\python.exe'
    set ff=unix
else
    set rtp+=~/.config/nvim/bundle/Vundle.vim
    let g:python2_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
    call plug#begin('~/.local/share/nvim/plugged') "only needed for neovim with eclim
    Plug '~/.vim/bundle/eclim'
    call plug#end()
endif
set t_Co=256
set nocompatible "required
filetype on
filetype indent on
filetype plugin on 
set number
set cursorline
call vundle#begin()
if has('nvim')
    Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    if empty(v:servername) && exists('*remote_startserver')
        call remote_startserver('VIM')
    endif
endif
colorscheme synthwave
syntax on
if has('macunix')
    hi CursorLine guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=54 cterm=NONE
endif
hi Normal ctermbg=none guibg=none
"required
Plugin 'VundleVim/Vundle.vim'
"=============== C/C++ ============================
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'justmao945/vim-clang'    "autocomplete for C/C++
"============= Java/Maven =========================
Plugin 'mikelue/vim-maven-plugin'
"=============== Javascript ======================= 
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd BufEnter *.tsx set filetype=typescript
Plugin 'pangloss/vim-javascript' "Better javascript support for Vim
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhartington/nvim-typescript'
"=============== Python =========================== 
Plugin 'davidhalter/jedi-vim'
"=============== LaTeX ============================
Plugin 'lervag/vimtex' "autocompletion for LaTeX
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:syntastic_tex_checkers = ['lacheck']
autocmd Filetype tex setl updatetime=100 
autocmd BufRead,BufNewFile *.tex setlocal spell spelllang=en_us "auto turn spell check on for LaTeX files
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:vimtex#re#deoplete = '\\(?:'
            \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \ . '|(text|block)cquote\*?(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \ . '|(for|hy)\w*cquote\*?{[^}]*}(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
            \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
            \ . '|hyperref\s*\[[^]]*'
            \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|(?:include(?:only)?|input|subfile)\s*\{[^}]*'
            \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
            \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|(usepackage|RequirePackage)(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|documentclass(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|begin(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|end(\s*\[[^]]*\])?\s*\{[^}]*'
            \ . '|\w*'
            \ .')'
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
"============== Clojure ===========================
Plugin 'venantius/vim-cljfmt' "cool Clojure formatting tool 
Plugin 'tpope/vim-fireplace' "Repl support
Plugin 'venantius/vim-eastwood'
" Plugin 'tpope/vim-classpath' 

"============== Perl ==============================
Plugin 'vim-perl/vim-perl6'  "Perl6 support
vmap ,pt :!perltidy<CR>
nmap ,pt <ESC>:%! perltidy<CR>

"============== Ruby ==============================
Plugin 'vim-ruby/vim-ruby' "Ruby support
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby inoremap <expr> <buffer> . <SID>CompleteDot()
func! s:CompleteDot()
    return ".\<C-x>\<C-o>"
endfunction
"============== XML  ==============================
Plugin 'othree/xml.vim'      
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
autocmd Filetype xml nnoremap = :FormatXML<Cr>
"============== Setup =============================
Plugin 'w0rp/ale'
let g:ale_linters = {
            \ 'python': ['pylint'],
            \ 'c': ['gcc']
            \}
Plugin 'majutsushi/tagbar'
map <C-b> :TagbarToggle<CR>
Plugin 'vim-airline/vim-airline' "self explanatory
Plugin 'tpope/vim-fugitive'      "git wrapper for vim airline
Plugin 'tpope/vim-commentary'    "commment blocks of code out
Plugin 'tpope/vim-surround'      "delete, change, add surrounding
Plugin 'scrooloose/nerdtree'	 "file explorer for vim
autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>
Plugin 'luochen1990/rainbow'     "Rainbow Parenthesis
Plugin 'jiangmiao/auto-pairs'    "Auto closing of parenthesis 
Plugin 'floobits/floobits-neovim'
Plugin 'kien/ctrlp.vim'          
let g:ctrlp_root_markers = ['pom.xml']
let g:ctrlp_working_path_mode = 'r'
let g:rainbow_active = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#flow#flow_bin = 'flow'
let g:EclimCompletionMethod = 'omnifunc'
let g:ctrlp_map = '<C-p>'
set ignorecase
set smartcase
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

call vundle#end()
filetype plugin indent on
