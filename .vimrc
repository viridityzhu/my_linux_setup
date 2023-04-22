" color desert
" key maps
inoremap kj <Esc>
map Y y$
nnoremap U <C-r>
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

set clipboard=unnamed

set nocompatible " not compate with vi
filetype off

" ---------------------Vundle plugin management----------------
set rtp+=~/.vim/bundle/Vundle.vim " set vundle as runtime path
" set rtp+=/usr/local/opt/fzf " fzf fuzzy finder
call vundle#begin() " start vundle
" 安装插件的三种方法：
" 1. 直接在.vimrc 里填写在下面↓
" 2. 在运行vim中，用 :PluginInstall 命令
" 3. 在命令行中，用 vim +PluginInstall +qall
" ****请将安装插件的命令放在vundle#begin和vundle#end之间.****

" let vundle manage plugins
Plugin 'VundleVim/Vundle.vim'

" 以下范例用来支持不同格式的插件安装.
" Github上的插件: Plugin '用户名/插件仓库名'
" Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
" colorscheme gruvbox
Plugin 'morhetz/gruvbox'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'justinmk/vim-sneak'
Plugin 'vim-python/python-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'dyng/ctrlsf'


" http://vim-scripts.org/vim/scripts.html 的插件:
" Plugin '插件名称'
" Plugin 'L9'

" 由Git支持但不在github上的插件仓库: Plugin 'git clone 后面的地址'
" Plugin 'git://git.wincent.com/command-t.git'

" 本地的Git仓库(例如自己的插件) Plugin 'file:///+本地插件仓库绝对路径'
" Plugin 'file:///home/gmarik/path/to/plugin'

" 插件在仓库的子目录中.
" 正确指定路径用以设置runtimepath. 以下范例插件在sparkup/vim目录下
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" 安装L9，如果已经安装过这个插件，可利用以下格式避免命名冲突
" Plugin 'ascenator/L9', {'name': 'newL9'}

" 你的所有插件需要在下面这行之前
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本

" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall  	 - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件

" How to install new plugins:
" 1. :source %
" 2. :PluginInstall

"
" 查阅 :h vundle 获取更多细节和wiki以及FAQ
" 将你自己对非插件片段放在这行之后


" -------colorscheme---------
set background=dark
colorscheme gruvbox

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

autocmd vimenter * ++nested colorscheme gruvbox

" -------------------My basic configurations----------------
let g:python_highlight_all = 1
set mouse=a
" 行号
set number
" set relativenumber
set cursorline
set showmatch " highlight {}()[] pairs
set noai nosi
set hlsearch " when search, highlight results
" set spell spelllang=en_us " spell check 0.0
" set textwidth=80
" set wrap
" set linebreak " not wrap within a word
" set wrapmargin=2
set scrolloff=5 " 垂直滚动时，光标距离顶部or底部多少行 （？）
set sidescrolloff=15 " 水平滚动……
set laststatus=2 " 0: not show status; 1: only show when multiple windows 2:show
set ruler " show where is the cursor in status
" 语法高亮
syntax on
" 底部显示mode
set showmode
set showcmd
set encoding=utf-8
set t_Co=256
set autoindent
set tabstop=2
set shiftwidth=4
set expandtab " transfer tab as space
set softtabstop=4 " 1 tab = 4 spaces
set autoread " alert when the file is edited by other editors
" if there are extra spaces or tabs at the end of lines, show them as blocks
set listchars=tab:»■,trail:■
set list
set wildmenu " 命令自动补全，第一次按tab显示操作清单，第二次按依次选择各个操作指令
set go= " 传说中的去掉边框

if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif


" NERDTree configuration
let mapleader=","
nnoremap <silent> <leader>n :NERDTreeToggle<CR>

filetype plugin on
map <F5> :call RUN()<CR>
func! RUN()
    exec "w"
    if &filetype == 'python'
        exec "!python3 %"
    else
        if &filetype == 'scala'
            exec "!scalac % && scala %:r"
            " exec "!scala %:r"
        endif
    endif
endfunc

" source ~/.vim/markdownSnippits.vim
" autocmd Filetype markdown inoremap ,f
