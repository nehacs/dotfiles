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

set nocompatible              " be iMproved, required
filetype off                  " required

set wildignore+=*/tmp/*,*/private/*,*/autoload/*,*/_assets/*,*/.git/*
set autoread
set shortmess+=A

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

syntax enable
colorscheme solarized
set background=dark

" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Ack
Plugin 'mileszs/ack.vim'
" Auto-pairs
Bundle 'jiangmiao/auto-pairs'
" Bufexplorer
Plugin 'jlanzarotta/bufexplorer'
" JS syntax
Plugin 'othree/javascript-libraries-syntax.vim'
" JS linting/hinting
Plugin 'walm/jshint.vim'
" Nerdtree
Plugin 'scrooloose/nerdtree'
" Supertab
Plugin 'ervandew/supertab'
" Syntastic
Plugin 'vim-syntastic/syntastic'
" Tagbar
Plugin 'majutsushi/tagbar'
" Tagbar-phpctags
Plugin 'vim-php/tagbar-phpctags.vim'
" Tcomment
Plugin 'tomtom/tcomment_vim'
" Fancy statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Vim angular
Plugin 'burnettk/vim-angular'
" Bad whitespace
Plugin 'bitc/vim-bad-whitespace'
" Color scheme
Plugin 'altercation/vim-colors-solarized'
" Go compiler
Plugin 'rjohnsondev/vim-compiler-go'
" Fugitive
Plugin 'tpope/vim-fugitive'
" Go
Plugin 'fatih/vim-go'
" Godef
Plugin 'dgryski/vim-godef'
" Javascript
Plugin 'pangloss/vim-javascript'
" JSON
Plugin 'elzr/vim-json'
" Less (CSS) highlighting
Plugin 'lunaru/vim-less'
" Nerdtree tabs
Plugin 'jistr/vim-nerdtree-tabs'
" Paste
Plugin 'sickill/vim-pasta'
" Syntax highlighting for puppet
Plugin 'rodjek/vim-puppet'
" Sensible defaults
Plugin 'tpope/vim-sensible'
" Twig
Plugin 'lumiliet/vim-twig'
" Bundles (make sure vundle manages vundle)
Plugin 'gmarik/vundle'
" Command-t
Plugin 'wincent/command-t'
" Vim-misc
Plugin 'xolox/vim-misc'
" Vim-notes
Plugin 'xolox/vim-notes'
" PEP8
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

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

" execute pathogen#infect()
" call pathogen#helptags()
filetype plugin indent on

" Set backup dirs to tmp ones to prevent clutter
set backupdir=~/vimtmp,.
set directory=~/vimtmp,.
set undodir=~/vimtmp,.

set path=$PWD/**

set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4

" for Thumbtack
set textwidth=100
set colorcolumn=+1
highlight ColorColumn ctermbg=8 guibg=Magenta
set cursorline
highlight CursorLine ctermbg=8 cterm=none
highlight CursorLineNr term=bold ctermfg=5 gui=bold guifg=Yellow
highlight Pmenu ctermfg=0 ctermbg=7 guibg=Grey90
highlight PmenuSel ctermfg=7 ctermbg=0 guibg=Grey
highlight Visual term=reverse cterm=reverse ctermfg=10 ctermbg=8 guibg=DarkGrey

" au BufWritePost *.html,*.php,*.go silent! !ctags -R --exclude=*.js --exclude=*.py &
" au BufWritePost *.php,*.html silent! !bash ~/.vim/tagFiles.sh &>/dev/null &
" au BufWritePost *.html silent! !ctags -R --exclude=*.js --exclude=*.py &
" au BufWritePost *.html silent! !ctags -R --exclude=*.js --exclude=*.py &
" au BufWritePost *.php silent! !~/.vim/phpctags -R --exclude=*.js --exclude=*.py &>/dev/null &
" au BufWritePost *.html,*.php silent! !ctags -R --exclude=*.js --exclude=*.py & | silent! !~/.vim/phpctags -R --exclude=*.js --exclude=*.py &>/dev/null &
au BufWritePost *.html,*.php silent! !ctags -R --exclude=*.js --exclude=*.py | ~/.vim/phpctags -R --exclude=*.js --exclude=*.py &>/dev/null &
au FileType python setl tabstop=2 sw=2 sts=2 et

" au BufWritePost *.go silent! !bash ~/.vim/tagGoFiles.sh &>/dev/null &
" au BufWritePost *.go silent! !bash ~/.vim/tagGoFiles.sh &
" au BufWritePost *.go silent! !gotags -R . > tags &

" for if I ever get ctags in Javascript working
" au BufWritePost *.html,*.js silent! !ctags -R --exclude=*.py &
" au BufWritePost *.php silent! !~/.vim/phpctags -R --exclude=*.js --exclude=*.py &>/dev/null &

set nohlsearch          " turn off highlight searches
map <silent> <C-N> :se invhlsearch<CR> " turn on highlights with Ctrl+N

let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_height=20
let g:ctrlp_max_files=0

" vim-notes
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
highlight link notesAtxHeading Question
highlight notesShortHeading term=bold ctermfg=3 gui=bold guifg=#60ff60
highlight notesTodo term=bold ctermfg=9 guifg=#ff80ff
highlight notesDoneMarker term=bold ctermfg=2 gui=bold guifg=#ffff60
highlight notesInProgress term=bold ctermfg=3 gui=bold guifg=#60ff60

" let g:tagbar_phpctags_bin='~/.vim/phpctags'
let g:tagbar_left = 1
let g:tagbar_phpctags_memory_limit = '512M'

let g:syntastic_quiet_messages = { "!level":  "errors" }
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = "--standard=~/Thumbtack/website/config/phpcs/ruleset.xml"
let g:syntastic_php_phpmd_post_args = "~/Thumbtack/website/config/phpmd/ruleset.xml"
let g:syntastic_aggregate_errors = 1
let g:airline_theme='molokai'

" Map Silver Surfer to Ack
let g:ackprg = "ag --vimgrep --ignore *.csv --ignore *.sql --ignore *.out --ignore *.json --ignore *.svg --ignore *.mgr_* --ignore *.all* --ignore *.pem"
cnoreabbrev Ack Ack!
noremap <Leader>a :Ack! <cword><cr>

" jj to exit Insert mode
imap jj <Esc>

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
map <leader>r :NERDTreeFind<cr>

let g:NERDTreeWinSize = 40

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
let g:golang_goroot = "/usr/local/bin"
let g:golang_cwindow = 0
let g:go_fmt_autosave=1
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

set number

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '/home/neha/Thumbtack/website/thumbprint/node_modules/eslint/bin/eslint.js'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{fugitive#statusline()}
set statusline+=%f

"Allow backspace in insert mode
"set backspace=indent,eol,start
""Show title
set title

"Strip trailing whitespace (,ss)
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
