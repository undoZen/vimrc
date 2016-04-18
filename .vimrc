set nocompatible
cd%:p:h
filetype off " required for vundle

if has('win32')
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#rc(path)
else
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
endif



 " let Vundle manage Vundle
 " required! 

Plugin 'VundleVim/Vundle.vim'

Plugin 'gkz/vim-ls'

 " My Plugins here:
 "
 " original repos on github
 " Plugin 'tpope/vim-fugitive'
 " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Plugin 'tpope/vim-rails.git'
 " vim-scripts repos
 " Plugin 'L9'
 " Plugin 'FuzzyFinder'
 " non github repos
 " Plugin 'git://git.wincent.com/command-t.git'
 " ...

 "
 " Brief help
 " :PluginList          - list configured bundles
 " :PluginInstall(!)    - install(update) bundles
 " :PluginSearch(!) foo - search(or refresh cache first) for foo
 " :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Plugin command are not allowed..

Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
nmap <C-T> :NERDTreeToggle<CR>
"Plugin 'c9s/bufexplorer'
"nmap <C-E> :BufExplorer<CR>

"Plugin 'Raimondi/delimitMate'
" 修复 Emacs 式编辑快捷键
"imap <C-A> <Plug>delimitMateHome
"imap <C-E> <Plug>delimitMateEnd
"imap <C-F> <Plug>delimitMateRight
"imap <C-B> <Plug>delimitMateLeft
"let g:delimitMate_autoclose=0
"let g:delimitMate_expand_cr=1
"let g:delimitMate_expand_space=1

Plugin 'groenewege/vim-less'
Plugin 'digitaltoad/vim-jade'
Plugin 'tpope/vim-markdown'
Plugin 'wavded/vim-stylus'
"Plugin 'slimv.vim'
"Plugin 'vimwiki'
" vimwiki
" 参考了 ktmud 的设置
" auto_export 是否在词条文件保存时就输出html
"      \ 'html_header': 'E:/My Dropbox/Public/vimwiki_template/header.htm',
"      \ 'html_footer': 'E:/My Dropbox/Public/vimwiki_template/footer.htm',
"
"let g:vimwiki_list = [{
"      \ 'path': '~/vimwiki/minitrue',
"      \ 'auto_export': 0,
"      \ 'diary_link_count': 5,
"      \ 'syntax': 'markdown', 'ext': '.mkd' }]
"
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
" let g:vimwiki_camel_case = 0
"
" 标记为完成的 checklist 项目会有特别的颜色
"let g:vimwiki_hl_cb_checked = 1
"
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
" let g:vimwiki_menu = ''

" 是否开启按语法折叠  会让文件比较慢
" let g:vimwiki_folding = 1

" 是否在计算字串长度时用特别考虑中文字符
"let g:vimwiki_CJK_length = 1
"
" 支持的 HTML tags
"let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

"Plugin 'mattn/zencoding-vim'
Plugin 'kchmck/vim-coffee-script'

Plugin 'wesgibbs/vim-irblack'

Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
let g:gist_open_browser_after_post=1

Plugin 'Shougo/unite.vim'
nmap <C-E> :Unite buffer<CR>i
"nmap <C-T> :Unite file<CR>

Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
autocmd FileType html,css,less EmmetInstall
autocmd FileType html,css,less set iskeyword+=-

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'jwhitley/vim-literate-coffeescript'


Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'

Plugin 'sukima/xmledit'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-repeat'

Plugin 'wincent/command-t'

call vundle#end()            " required

autocmd BufEnter * silent! :cd%:p:h
let mapleader=","
autocmd! bufwritepost .{,g}vimrc source % " 自动刷新
" 关闭遇到错误时的声音提示
set noerrorbells

syntax on
colo ir_black
"colo reloaded

nmap <leader>n :cnext<cr>
nmap <leader>p :cprevious<cr>

" 在 iTerm/tmux 里面自动打开关闭 paste 模式
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

set number " 显示行号
if v:version >= 703
  " set rnu " VIM 7.3 以上使用相对行号
  set nonumber  relativenumber " 奇怪要这样才能确保用上相对行号
endif
set ruler " 在右下角显示当前行列等信息

" 使用 2 个空格缩进而不用 Tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
:autocmd BufRead,BufNewFile ~/cc/DysonShell/*.hbs setlocal ts=4 sts=4 sw=4
set expandtab
set smarttab

" 方便切换 splits
nmap <C-Tab> <C-w><C-w>
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" 方便切换 tabs
" nmap <C-t> :tabnew<cr>
nmap <C-p> :tabprevious<cr>
nmap <C-n> :tabnext<cr>

" 快捷键
imap <leader><leader> <ESC>
imap ，， <ESC>
imap <C-d> <DEL>
map <C-s> <ESC>:w<CR>
imap <C-s> <ESC>:w<CR>
map <C-g> <ESC>:w<CR>
imap <C-g> <ESC>:w<CR>
cmap w!! w !sudo tee % >/dev/null
map <f2> :w !pbcopy<cr>
map <leader>r :w\|!node %<cr>
map <f4> :w\|!lsc %<cr>
"map <f3> :w\|!gcc  % && cat %.input \| ./a.out<cr>
"map <f4> :w\|!gcc -ggdb3 % && ./a.out<cr>
map <f5> :w\|!gccgo % && ./a.out<cr>
set pastetoggle=<F7> " 粘贴代码可能有用

" Emacs 式快捷键
imap <C-A> <Home>
imap <C-E> <End>
imap <C-F> <Right>
imap <C-B> <Left>
cmap <C-A> <Home>
cmap <C-E> <End>
cmap <C-F> <Right>
cmap <C-B> <Left>

" normal 模式按 esc 存储
"nmap <ESC> :w<CR>

au BufRead,BufNewFile *.j2,*.mustache,*.hbs,*.handlebars,*.htmlx set filetype=html

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
set history=1000
set viminfo='1000,f1,<500,%,h "持久保存文件光标位置等信息
runtime macros/matchit.vim " %支持 if/end 关键词跳转和 xml tag 跳转等
set wildmode=list:longest "打开文件时候的文件名补全类似 bash

" backup files
set backupdir=~/.vim-tmp,~/_vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/_vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

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

" for mac 中文输入法，一定要去掉 cmd+, 里面 Draw marked text inline 这个选项
if has('mac')
  set noimdisable
  "set ims=1
  "set imactivatekey=C-space
  autocmd! InsertLeave * set imdisable|set iminsert=0
  autocmd! InsertEnter * set noimdisable|set iminsert=0
endif

" 用 ma 创建的书签可以用 ` 和 ' 跳转，他们两个互换一下比较自然
nnoremap ' `
nnoremap ` '


au BufWritePost *.ls silent LiveScriptMake! -b | cwindow | redraw!
autocmd BufNewFile,BufReadPost *.less set filetype=less
autocmd BufNewFile,BufReadPost *.jade set filetype=jade
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd BufNewFile,BufReadPost *.styl{,us} set filetype=stylus
au BufWritePost *.styl,*.stylus silent !stylus > %:r.css < %:p
autocmd BufNewFile,BufRead *.coffee,*.iced set filetype=coffee
au BufWritePost *.coffee,*.iced CoffeeLint | cwindow
autocmd FileType javascript,html,css,less EmmetInstall
autocmd BufNewFile,BufRead *.coffee.md set filetype=litcoffee
autocmd FileType litcoffee runtime ftplugin/coffee.vim

set wildignore+=.o,.obj,.git,node_modules/**
nmap <leader>t :CommandT<CR>

" autocmd BufWritePre *.js call JsBeautify()

" Run checktime in buffers, but avoiding the "Command Line" (q:) window
" 自动载入被修改过的文件
au CursorHold,FocusGained,BufEnter * if getcmdtype() == '' | checktime | endif

filetype plugin indent on    " required
autocmd BufNewFile,BufReadPost * syntax on
"set autochdir "自动更换工作目录到当前编辑文件的目录
