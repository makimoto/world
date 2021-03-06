scriptencoding utf-8
set backspace=indent,eol,start
set textwidth=0
set nobackup
set viminfo='500,<10000,s1000,\"500
set history=1000
set ruler

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set modelines=2

set smartindent
set ignorecase
set smartcase
set wrapscan
set hlsearch

set list
set listchars=tab:>-,trail:\ 

set showcmd
set showmatch
set laststatus=2
set wildmode=list:longest
set hidden
set autoread
set noincsearch

set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#enable_notification = 1

let s:dein_dir = expand('~/.config/nvim/dein')
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

nnoremap <ESC><ESC> :nohl<CR>

let g:rustfmt_autosave = 1
let g:rustfmt_command = expand('~/.cargo/bin/rustfmt')
let g:rustfmt_fail_silently = 1
let g:racer_cmd = expand('~/.cargo/bin/racer')
let g:racer_experimental_completer = 1
let $RUST_SRC_PATH=expand('~/src/rust/src')

let g:python3_host_prog = expand('~/.pyenv/shims/python3')
let g:deoplete#enable_at_startup = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_javascript_enabled_makers = ['eslint']

nnoremap [denite] <Nop>
nmap <C-u> [denite]
nnoremap <silent> [denite]<C-g>  :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
nnoremap <silent> [denite]<C-f>  :<C-u>Denite file_rec -buffer-name=search-buffer-denite<CR>
nnoremap <silent> [denite]<C-d>  :<C-u>Denite directory_rec -buffer-name=search-buffer-denite<CR>

nnoremap <silent> [denite]<C-r> :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
nnoremap <silent> [denite]<C-n> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
nnoremap <silent> [denite]<C-p> :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
