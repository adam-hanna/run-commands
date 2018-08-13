call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTree' }
Plug 'scrooloose/nerdcommenter'

Plug 'fatih/vim-go'
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go', { 'do': 'make'}

"Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
"Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

"Plug 'SirVer/ultisnips'
"Plug 'Valloric/YouCompleteMe'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'wikitopian/hardmode'

" Plug 'vim-airline/vim-airline'

call plug#end()

" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:deoplete#enable_at_startup = 1

" General VIM
set clipboard=unnamed
set number
syntax enable
set ts=2
set autoindent
set expandtab
set shiftwidth=2
set showmatch
let python_highlight_all = 1
set nocursorcolumn
set ttimeoutlen=100
set ttyfast
set lazyredraw
set nocursorline
set norelativenumber
syntax sync minlines=256
set synmaxcol=128
set re=1

" SirVer/ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsUsePythonVersion = 3

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/snips"

" NERDTree
let NERDTreeShowHidden = 1

" fatih/vim-go
set autowrite

" mappings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" prefs
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1 
"let g:go_metalinter_autosave = 1
"let g:go_metalinter_autosave_enabled = ['gofmt', 'vet', 'golint', 'errcheck']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'gosec', 'deadcode', 'gotype']
let g:go_metalinter_deadline = "90s"
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
" let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_list_type = "quickfix"
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

" color scheme
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
set term=screen-256color
hi QuickFixLine term=reverse ctermbg=52

" statusline
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256

" autocomplete
filetype plugin on
setlocal omnifunc=go#complete#Complete
