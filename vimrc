 " __  __        __     ___
" |  \/  |_   _  \ \   / (_)_ __ ___  _ __ ___
" | |\/| | | | |  \ \ / /| | '_ ` _ \| '__/ __|
" | |  | | |_| |   \ V / | | | | | | | | | (__
" |_|  |_|\__, |    \_/  |_|_| |_| |_|_|  \___|
"         |___/

" ===
" === Auto load for first time use it
" ===
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

" Themes
Plug 'dracula/vim'
Plug 'connorholyday/vim-snazzy'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/vim-cursorword'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" CrtlP
Plug 'ctrlpvim/ctrlp.vim'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

" Markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] } " this only effective in neovim
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Other useful utilities
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim' " distraction free writing mode
Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line or select area, `<leader>c<leader>' to (uncomment) toggle commented state.

" Dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'fadein/vim-FIGlet'

call plug#end()

" vim 中 Leader 前缀键默认是 '\'
let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
" 命令模式下之按TAB来选择要使用的命令
set wildmenu

" Some Extra Settings
" Recognise File Type
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

set nocompatible
set mouse=a
set encoding=utf-8

" ===
" === Editor behavior
" ===
" Better tab 缩进相关
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" 显示隐藏字符
set list
set listchars=tab:▶\ ,trail:.
" 屏幕滚动上、下都保留5行
set scrolloff=5

" Prevent auto line split
set wrap 
set tw=0

set indentexpr=

" Better backspace
set backspace=indent,eol,start

set foldmethod=indent
set foldlevel=99

" 启动不同的光标样式
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"

" ===
" === Window behaviors
" ===
set splitright
set splitbelow

" ===
" === Status/command bar
" ===
set laststatus=2
set autochdir
set showcmd
set formatoptions-=tc

"===
"=== Other useful stuff
"===
" <++> is a placeholder, in normol mode just press twise space to find next <++> and income to edit mode
" in colemak keyboard layout, there i map to l, means change forward 4 chars
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Call figlet
map tx :r !figlet 

" ===
" === Spelling Check with <space>sc
" ===
map <LEADER>sc :set spell!<CR>

" ===" vim 颜色配置相关
let &t_ut=''


" 下次打开文件时，光标回到上一次退出时的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif

" Theme
"  Window Transparent
" let g:SnazzyTransparent = 1
" colorscheme snazzy
colorscheme dracula

" 去掉工具栏、菜单栏
set guioptions-=T
set guioptions-=m
"  Remove Left, Bottom, Reght scrollbar, refer `help gui-scrollbars'
set guioptions-=lbr
noremap <LEADER><CR> :nohlsearch<CR>

" noremap n j
" noremap N 5jzz
" noremap e k
" noremap E 5kzz
" noremap i l
" noremap u i
" noremap U I
" noremap l u
" noremap L U

map ; :
map s <nop>
map S :w<CR>
map Q :q<CR>
map Qa :qall<CR>
map R :source $MYVIMRC<CR>

" Search
set hlsearch
" exec "COMMAND"
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

noremap = nzz
noremap - Nzz

" Find Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Others
map <LEADER>o o<Esc>u

" Split Window
map s/  :set splitright<CR>:vsplit<CR>
map sn/ :set nosplitright<CR>:vsplit<CR>
map s-  :set splitbelow<CR>:split<CR>
map sn- :set nosplitbelow<CR>:split<CR>

" You can only operate in multiple Window
" sv: change vertical window split to horizontal
" sh: change horizontal window split to vertical
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

" keyboard shortcuts
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Resize split window size

map <up>    :resize +5<CR>
map <down>  :resize -5<CR>
map <left>  :vertical resize -5<CR>
map <right> :vertical resize +5<CR>

" Tab
map tu :tabedit<CR>
map tp :tabprevious<CR>
map tn :tabnext<CR>

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "1"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"

" ===
" === NERDTree-git
" ===
let g:NESDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_python_interpreter_path = system('which python')
" let g:ycm_python_binary_path = system('which python')

" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '【${name}】'

" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig

" ===
" === Goyo
" ===
map <LEADER>gy :Goyo<CR>

" ===
" === vim-signature
" ===
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" ===
" === UndoTree
" ===
let g:undotree_DiffAutoOpen = 0
map L :UndotreeToggle<CR>

set tags=~/.vim/tags/python.ctag
set tags+=tags
autocmd BufWritePost *.py silent! !ctags --exclude=.git --exclude='*.log' -R --python-kinds=-i --languages=python 2> /dev/null &

set clipboard=unnamed
