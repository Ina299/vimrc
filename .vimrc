if !&compatible
  set nocompatible
endif
augroup MyAutoCmd
autocmd!
augroup END
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim ' s:dein_repo_dir
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
let g:rc_dir = expand('~/.vim/rc')
let g:toml = g:rc_dir . '/dein.toml'
let g:lazy_toml = g:rc_dir . '/dein_lazy.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(g:toml, {'lazy':0})
  call dein#load_toml(g:lazy_toml, {'lazy':1})
  call dein#end()
  call dein#save_state()
endif
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
if has('nvim')
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#auto_complete_delay = 0
  let g:deoplete#auto_complete_start_length = 1
  let g:deoplete#enable_camel_case = 0
  let g:deoplete#enable_ignore_case = 0
  let g:deoplete#enable_refresh_always = 0
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#file#enable_buffer_path = 1
  let g:deoplete#max_list = 10000
endif
if !has('nvim')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
  let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme'   : $HOME.'/.gosh_completions'
    \ }
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'
  inoremap <expr><C-g>  neocomplete#undo_completion()
  inoremap <expr><C-l>  neocomplete#complete_common_string()
  inoremap <expr><C-h>  neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>   neocomplete#smart_close_popup()."\<C-h>"
  if !exists('g:neocomplete#source#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
endif
let g:neosnippet#snippets_directory = '~/.vim/snippets/'
let g:airline_theme='base16_default'
let g:ale_javascript_eslint_use_global = 1
let g:ale_sign_column_always = 1
set fenc=utf-8 
set clipboard+=unnamed
set expandtab
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set cursorline
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set list listchars=eol:~,tab:>\ ,extends:<
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set wrapscan
set hlsearch
set backspace=indent,eol,start
set completeopt=menuone
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <Esc><Esc> :nohlsearch<CR><Esc>
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <expr><TAB> pumvisible() ? "\<C-n>\<C-y>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><Enter> pumvisible() ? "\<C-y>" : "\<Enter>"
inoremap <expr><C-k>   pumvisible() ? "\<C-y>\<C-k>" : "\<C-k>"
imap jj <Esc>
imap <C-k>    <Plug>(neosnippet_expand_or_jump)
smap <C-k>    <Plug>(neosnippet_expand_or_jump)
nnoremap j gj
nnoremap k gk
nnoremap <silent><C-e> :NERDTreeToggle<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
syntax on

