set nocompatible "不使用兼容模式
autocmd! bufwritepost .vimrc source %

" map 我的常用按键
let mapleader=","
nmap <c-e> :BufExplorer<cr>
nmap <c-d> :NERDTreeToggle<cr>
" 我使用 Dvorak 键盘布局，因此以上设置对我来说很方便
" 相当于 Qwerty 键盘上按 wf 和 wr
" 还是换成 c-e, c-d 方便

map <C-g> <ESC>
imap <C-g> <ESC>
cmap <C-g> <ESC>
imap <C-d> <DEL>
map <C-o> <ESC>:w<CR>
imap <C-o> <ESC>:w<CR>
map <F2> <ESC>:w<CR>
imap <F2> <ESC>:w<CR>
cmap w!! w !sudo tee % >/dev/null
map <f3> :w\|!node %<cr>
map <f4> :w\|!python -i %<cr>
"map <f4> :w\|!python -i %<cr>
"map <f3> :w\|!gcc-3 -ggdb3 % && cat %.input \| a.exe<cr>
"map <f4> :w\|!gcc-3 -ggdb3 % && a.exe<cr>
"map <f5> :w\|!g++-3 -ggdb3 % && cat %.input \| a.exe<cr>
"map <f6> :w\|!g++-3 -ggdb3 % && a.exe<cr>
"map <F5> :VimwikiAll2HTML<CR><CR>
map <F5> :!bash /home/yuest/y/.build.sh<CR>
set pastetoggle=<F7> "粘贴代码用

nmap <C-Tab> <C-w><C-w>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

nmap <C-t> :tabnew<cr>
nmap <C-p> :tabprevious<cr>
nmap <C-n> :tabnext<cr>
nmap <C-q> ZZ

" Tab键和行尾空格可见
set list
set listchars=tab:>\ ,trail:_

"set rnu "使用相对行号 (7.3)
set number "显示行号
set ruler "在右下角显示当前行列等信息
syntax enable "语法高亮提示
filetype indent on "根据文件类型自动缩进
filetype plugin on "根据文件类型加载插件

" 使用 4 个空格缩进而不用 Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

if has('win32')
    language message zh_CN.UTF-8
    set langmenu=en_US.GBK
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif


set wrap "自动折行
"set linebreak "折行不断词，让英文阅读更舒服些
set nolinebreak "这是为了适应中文换行
set backspace=start,indent,eol "让 Backspace 键可以删除换行
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk "中文支持
set hidden "让切换 buffer 保持 undo 记录
"set undofile "开启持久化撤销 (7.3)
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

"Emacs 式快捷键
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-B> <Left>

au BufRead,BufNewFile *.j2 set filetype=html
"autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Leeiio 童鞋对以下设置亦有贡献
" https://github.com/Leeiio/Vim/blob/master/vimrc

" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

" 关闭遇到错误时的声音提示
set noerrorbells

" 命令行与状态行
set cmdheight=1 " 设置命令行的高度
set laststatus=2 " 始终显示状态行
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P] "设置状态栏的信息


"设置配色方案
"http://www.h3rald.com/articles/herald-vim-color-scheme/
colo herald

" 安装的插件及其设置

" JavaScript syntax
" http://www.vim.org/scripts/script.php?script_id=1491

" Better JavaScript Indentation
" 这是经我使用后感觉最好的 JavaScript Indent 文件。对以匿名函数作参数都能
" 很好地缩进。
" 包括了上面的 JavaScript syntax 0.7.7 版本
" http://vim.sourceforge.net/scripts/script.php?script_id=2765

" javaScriptLint.vim
" http://www.vim.org/scripts/script.php?script_id=2578

" VimBall 安装插件必备
" http://www.vim.org/scripts/script.php?script_id=1502

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" http://www.vim.org/scripts/script.php?script_id=2332
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" delimitMate 自动补完括号等配对
" http://www.vim.org/scripts/script.php?script_id=2754
let delimitMate_expand_space = 1 "配对内按空格键在光标左右均插入空格
let delimitMate_expand_cr = 1 "配对内按回车键把光标放在中间空行
" 在 html,j2 文件内百分号也作为配对自动插入，方便 jinja2 模板开发
au FileType html,j2 let b:delimitMate_quotes = "\" ' %"
" 修复 Emacs 式编辑快捷键
imap <C-A> <Plug>delimitMateHome
imap <C-E> <Plug>delimitMateEnd
imap <C-F> <Plug>delimitMateRight
imap <C-B> <Plug>delimitMateLeft

" VimWiki 记笔记
" http://www.vim.org/scripts/script.php?script_id=2226
let g:vimwiki_menu = ''
let g:vimwiki_badsyms = ' '
let g:vimwiki_browsers = ['firefox']
let wiki1 = {}
let wiki1.path = '/home/yuest/Dropbox/vimwiki/think'
let wiki2 = {}
let wiki2.path = '/home/yuest/Dropbox/vimwiki/note'
let wiki2.netest_syntaxes = {'py': 'python', 'js': 'javascript', 'html': 'html', 'css': 'css'}
let wiki2.auto_export = 1
let wiki2.html_header = '/home/yuest/Dropbox/vimwiki/note/header.tpl'
let wiki2.html_footer = '/home/yuest/Dropbox/vimwiki/note/footer.tpl'
let g:vimwiki_list = [wiki1, wiki2]

" BufExplorer 方便切换 Buffer
" http://www.vim.org/scripts/script.php?script_id=42
map <F9> :BufExplorer<CR>

" ZenCoding 方便写HTML
" http://www.vim.org/scripts/script.php?script_id=2981
imap <C-A-E> <Plug>ZenCodingExpandNormal
vmap <C-A-E> <Plug>ZenCodingExpandVisual
let g:user_zen_settings = {
\  'indentation' : '    ',
\  'perl' : {
\    'aliases' : {
\      'req' : 'require '
\    },
\    'snippets' : {
\      'use' : "use strict\nuse warnings\n\n",
\      'warn' : "warn \"|\";",
\    }
\  }
\}

" The NERD Tree 方便打开文件
" http://www.vim.org/scripts/script.php?script_id=1658
map <F8> :NERDTreeToggle<CR>

" HTML5 syntax
" http://www.vim.org/scripts/script.php?script_id=3232

" Markdown
" https://github.com/plasticboy/vim-markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd

" vim-jade
" https://github.com/digitaltoad/vim-jade
" Jade
autocmd BufNewFile,BufReadPost *.jade set filetype=jade
" Stylus
" https://github.com/wavded/vim-stylus
autocmd BufNewFile,BufReadPost *.styl set filetype=stylus
autocmd BufNewFile,BufReadPost *.stylus set filetype=stylus
au BufWritePost *.styl,*.stylus silent !stylus > %:r.css < %:p
