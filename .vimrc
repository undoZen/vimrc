set nocompatible
autocmd! bufwritepost .vimrc source % " 自动刷新
" 关闭遇到错误时的声音提示
set noerrorbells

filetype off " required for vundle

colo torte " enough
syntax off " not needed

set number " 显示行号
if v:version >= 703
  set rnu " VIM 7.3 以上使用相对行号
endif
set ruler " 在右下角显示当前行列等信息

" 使用 2 个空格缩进而不用 Tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" 方便切换 splits
nmap <C-Tab> <C-w><C-w>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" 方便切换 tabs
nmap <C-t> :tabnew<cr>
nmap <C-p> :tabprevious<cr>
nmap <C-n> :tabnext<cr>

" 快捷键
imap <C-d> <DEL>
map <C-g> <ESC>:w<CR>
imap <C-g> <ESC>:w<CR>
cmap w!! w !sudo tee % >/dev/null
map <f3> :w\|!node %<cr>
map <f4> :w\|!python -i %<cr>
"map <f3> :w\|!gcc  % && cat %.input \| ./a.out<cr>
"map <f4> :w\|!gcc -ggdb3 % && ./a.out<cr>
map <f5> :w\|!gccgo % && ./a.out<cr>
set pastetoggle=<F7> " 粘贴代码可能有用

" Emacs 式快捷键
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>

au BufRead,BufNewFile *.j2,*.mustache set filetype=html

" Tab键和行尾空格可见
set list
set listchars=tab:>\ ,trail:_

set wrap "自动折行
"set linebreak "折行不断词，让英文阅读更舒服些
set nolinebreak "这是为了适应中文换行
set backspace=start,indent,eol "让 Backspace 键可以删除换行
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk "中文支持
set hidden "让切换 buffer 保持 undo 记录
set undofile "开启持久化撤销 (7.3)
set viminfo='1000,f1,<500,%,h "持久保存文件光标位置等信息
set autochdir "自动更换工作目录到当前编辑文件的目录

"高亮搜索、渐进式搜索、忽略大小写
set hlsearch
set incsearch
set ignorecase
set smartcase
" 按空格或,/取消搜索高亮
nmap <silent> <leader>/ :nohlsearch<CR>
noremap <silent> <Space> :silent noh<CR> 

set mouse=nv "在 Normal 和 Visual 模式下使用鼠标

"高亮所在行、列
set cursorline
set cursorcolumn

set foldmethod=indent "以缩自动折叠显示文档
set scrolloff=5 "光标碰到第五行、倒数第五行时就上下卷屏
set autoread "如果正在编辑的文件在打开后又有其他程序更新，则自动加载

" 命令行与状态行
set cmdheight=1 " 设置命令行的高度
set laststatus=2 " 始终显示状态行
set stl=%F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w%h\ %=\ %l/%L,%c\ %m "设置状态栏的信息

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 " Bundle 'tpope/vim-fugitive'
 " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
 " Bundle 'L9'
 " Bundle 'FuzzyFinder'
 " non github repos
 " Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
map <F8> :NERDTreeToggle<CR>

