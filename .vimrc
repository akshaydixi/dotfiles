set nocompatible  " don't be system wide
filetype off      " required for plugins

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" See vimawesome.com/ for more vim plugins.

" Git helper
Plugin 'tpope/vim-fugitive'

" Fuzzy file path helper
Plugin 'kien/ctrlp.vim'

" Speedup plugin for matching
Plugin 'FelikZ/ctrlp-py-matcher'

" Directory navigation
Plugin 'scrooloose/nerdtree'

" Python shell
Plugin 'ivanov/vim-ipython'

" Json plugin
Plugin 'elzr/vim-json'
"
" Auto-completion
Plugin 'Valloric/YouCompleteMe'

" Surround tag completion
Plugin 'tpope/vim-surround'

" Indent guides
Plugin 'nathanaelkane/vim-indent-guides'

" Trailing whitespaces
Plugin 'bronson/vim-trailing-whitespace'

" Minitabs at top of buffer
Plugin 'fholgado/minibufexpl.vim'

" Status line
Plugin 'bling/vim-airline'
Plugin 'paranoida/vim-airlineish'

" Color schemes
Plugin 'altercation/vim-colors-solarized'

"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"----------------------------------------------------------
" Vim default options
"----------------------------------------------------------
syntax enable
set encoding=utf-8      " utf-8 encoding by default
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab   " Expand tabs to spaces
" set mouse=a           " Enable mouse-selection (not reliable in my experience)
set nofoldenable        " Don't use folds
set number              " Show line numbers by default
set laststatus=2        " Always show the status bar
set listchars=tab:▸\ ,eol:¬  " Show tabs, end-of-line as special characters with :set list
set nopaste             " Don't auto-indent when pasting from clipboard
                        " On downside, seems to affect whether plugins can trigger

"----------------------------------------------------------
" For powerline / airline
"----------------------------------------------------------
set t_Co=256
set guifont=Inconsolata\ for\ Powerline
let g:airline_theme = 'airlineish'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

"let g:airline#extensions#tabline#enabled = 1

"----------------------------------------------------------
" For NERD Tree
"----------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1    " Open NERDTree automatically on startup if no files were specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"----------------------------------------------------------
" For CtrlP
"----------------------------------------------------------
" Speed ctrl p fuzzy matching: https://github.com/FelikZ/ctrlp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'
  " See http://blog.patspam.com/2014/super-fast-ctrlp
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/\.git/*,*.pyc

let g:ctrlp_custom_ignore = 'tmp$\|\.git$\|\.hg$\|\.svn$\|.rvm$|.bundle$\|node_modules'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=25
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1


let g:ctrlp_clear_cache_on_exit=0

"----------------------------------------------------------
" For YouCompleteMe, with logging at :YcmDebugInfo
"----------------------------------------------------------

let g:ycm_global_ycm_extra_conf = ' /home/akshayd/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_key_list_select_completion = ['<TAB>', '<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 0


"----------------------------------------------------------
" For using solarized
"----------------------------------------------------------
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"----------------------------------------------------------
"minibufexplorer
"----------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg

nnoremap <leader>] :MBEbn<CR>
nnoremap <leader>[ :MBEbp<CR>

"----------------------------------------------------------
" For indent-guide / whitespace
"----------------------------------------------------------
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235

"----------------------------------------------------------
" Shortcuts
"----------------------------------------------------------
command! Ig IndentGuidesToggle          " Toggle on/off indentation helper lines
command! Fix FixWhitespace               " Remove end-of-line whitespace
command! TT TagbarToggle                " Show tags in file
command! Go YcmCompleter GoToImprecise  " Jump to definition of code
command! Compile YcmForceCompileAndDiagnostics  " Compile for you complete me

" Toggle paste mode (prefer this over 'pastetoggle' to echo current state)
nmap <leader>p :setlocal paste! paste?<cr>


" Save myself from random typos
cab Wq wq
cab WQ wq
cab wQ wq
cab W w
cab Q q


if has('statusline')
set laststatus=1 " show statusline only if there are &gt; 1 windows
endif





" ENVIRONMENT

set backspace=indent,eol,start " backspace for dummys
set showmatch " show matching brackets/parenthesis
set wildmenu

set wildmode=list:longest,full " comand <tab> completion, list matches and

set showmode " display the current mode

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

set tabpagemax=20 " only show 15 tabs

filetype plugin indent on " Automatically detect file types.
set incsearch " find as you type search
set hlsearch " highlight search terms
set ignorecase
set smartcase


function! FoldPreprocessor()
  set foldmarker=#ifdef,#endif
  set foldmethod=marker
endfunction

