" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set cindent
set showcmd		   " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden        " Hide buffers when they are abandoned
set mouse=a		   " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

execute pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

set noswapfile

set path=$PWD/**

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" for Thumbtack
set textwidth=100

au BufWritePost *.php,*.html silent! !bash ~/.vim/tagFiles.sh &>/dev/null &
" au BufWritePost *.html silent! !ctags -R --exclude=*.js --exclude=*.py &
" au BufWritePost *.html silent! !ctags -R --exclude=*.js --exclude=*.py &
" au BufWritePost *.php silent! !~/.vim/phpctags -R --exclude=*.js --exclude=*.py &>/dev/null &
" au BufWritePost *.html,*.php silent! !ctags -R --exclude=*.js --exclude=*.py & | silent! !~/.vim/phpctags -R --exclude=*.js --exclude=*.py &>/dev/null &
" au BufWritePost *.html,*.php silent! !ctags -R --exclude=*.js --exclude=*.py | ~/.vim/phpctags -R --exclude=*.js --exclude=*.py &>/dev/null &

au BufWritePost *.go silent! !bash ~/.vim/tagGoFiles.sh &>/dev/null &
" au BufWritePost *.go silent! !bash ~/.vim/tagGoFiles.sh &
" au BufWritePost *.go silent! !gotags -R . > tags &


" for if I ever get ctags in Javascript working
" au BufWritePost *.html,*.js silent! !ctags -R --exclude=*.py &
" au BufWritePost *.php silent! !~/.vim/phpctags -R --exclude=*.js --exclude=*.py &>/dev/null &

set nohlsearch          " turn off highlight searches
map <silent> <C-N> :se invhlsearch<CR> " turn on highlights with Ctrl+N

let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_height = 20

" Currently deprecated (EasyGrep removed due to speed)
let g:EasyGrepRecursive = 1
" let g:EasyGrepMode = 0
let g:EasyGrepMode = 2

let g:tagbar_phpctags_bin='~/.vim/phpctags'
let g:tagbar_left = 1
let g:tagbar_phpctags_memory_limit = '512M'

let g:golang_goroot = "/usr/local/bin"
let g:golang_cwindow = 0

" Map Silver Surfer to Ack
let g:ackprg = "ag --vimgrep --ignore *.csv --ignore *.sql --ignore *.out --ignore *.json --ignore *.svg --ignore *.mgr_* --ignore *.all* --ignore *.pem"
cnoreabbrev Ack Ack!
noremap <Leader>a :Ack! <cword><cr>

" For twig syntax highlighting
au BufNewFile,BufRead *.twig.html set filetype=twig.html

" enable below commands to open NERDTree and Taglist automatically when
" starting vim
" autocmd VimEnter * NERDTreeTabsToggle
" autocmd VimEnter * wincmd p
" autocmd VimEnter * TlistOpen
" autocmd VimEnter * wincmd p

" Quick write session with F2
map <F2> :mksession! ~/vim_session <cr>
" And load session with F3
map <F3> :source ~/vim_session <cr>
" F4: Switch on/off TagList
" nnoremap <silent> <F4> :TlistToggle<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>
" F5: Switch on/off NERDTree
nnoremap <silent> <F5> :NERDTreeTabsToggle<CR>

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Go settings for tagging (Tagbar)
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
" nnoremap <silent><A-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
" nnoremap <silent><A-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><C-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><C-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>
