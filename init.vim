if !has('nvim')
    set ttymouse=xterm2
endif
call plug#begin('~/.local/share/nvim/plugged') "only needed for neovim with eclim
Plug '~/.vim/bundle/eclim'
call plug#end()
set t_Co=256
set nocompatible "required
filetype on
filetype indent on
filetype plugin on 
set termguicolors
set number
set rtp+=~/.config/nvim/bundle/Vundle.vim
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
    hi CursorLine term=bold cterm=bold guibg=#5c2782
endif
hi Normal ctermbg=none guibg=none
"required
Plugin 'VundleVim/Vundle.vim'

"=============== C/C++ ============================
Plugin 'vim-syntastic/syntastic' "syntax checker 
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'justmao945/vim-clang'    "autocomplete for C/C++
"============= Java/Maven =========================
Plugin 'mikelue/vim-maven-plugin'
" autocmd VimLeave *.java ShutdownEclim
"=============== Javascript ======================= 
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
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
" Plugin 'venatius/vim-cljfmt' "cool Clojure formatting tool 
" Plugin 'tpope/vim-fireplace' "Repl support
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
map <C-n> :NERDTreeToggle<CR>
Plugin 'pangloss/vim-javascript' "Better javascript support for Vim
Plugin 'luochen1990/rainbow'     "Rainbow Parenthesis
Plugin 'jiangmiao/auto-pairs'    "Auto closing of parenthesis 
Plugin 'floobits/floobits-neovim'
let g:rainbow_active = 1
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1
:tnoremap<Esc> <C-\><C-n>

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
if has('gui_running')
    set guifont=Nimbus\ Mono\ PS\ Bold\ 13
endif

set backspace=indent,eol,start

call vundle#end()
filetype plugin indent on
