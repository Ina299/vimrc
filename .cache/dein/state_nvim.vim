if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/kaine/.config/nvim/init.vim', '/home/kaine/.vim/rc/dein.toml', '/home/kaine/.vim/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/kaine/.cache/dein'
let g:dein#_runtime_path = '/home/kaine/.cache/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/kaine/.cache/dein/.cache/init.vim'
let &runtimepath = '/home/kaine/.cache/dein/repos/github.com/Shougo/dein.vim,/home/kaine/.config/nvim,/etc/xdg/nvim,/home/kaine/.local/share/nvim/site,/usr/local/share/nvim/site,/home/kaine/.cache/dein/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/share/nvim/runtime,/home/kaine/.cache/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/kaine/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/kaine/.config/nvim/after'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['deoplete.nvim', 'neosnippet'])
