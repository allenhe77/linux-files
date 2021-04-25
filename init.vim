call plug#begin()

Plug 'rakr/vim-one'

" install language sever
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" for close brackets
Plug 'jiangmiao/auto-pairs'

" settings for defx plugin, for exploring files
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Initialize plugin system
call plug#end()



let g:airline_theme='one'
colorscheme one
"set background=dark " for the dark version
"Credit joshdick
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

set background=light " for the light version



" set timeout for tmux settings
set ttimeoutlen=100
" Faster diagnostic messages (defaults 4000)
set updatetime=150

" set blink cursor off
set guicursor=n:blinkon0
" enable block cursor

set guicursor=i:block

	inoremap <silent><expr> <TAB>
	  \ pumvisible() ? coc#_select_confirm() :
	  \ coc#expandableOrJumpable() ?
	  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	let g:coc_snippet_next = '<tab>'

" " Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" set search to be case insensitive
set ignorecase
set infercase


" keymap for coc-explorer 
nnoremap <space>e :CocCommand explorer<CR>


"set absolute line numbers
set number


"set cursor colours

highlight iCursor gui=NONE guifg=bg guibg=#5fd700
set guicursor=i:iCursor


" set line number color 
highlight LineNr guifg=#87afff

" set cursor line and color
set cursorline
highlight CursorLine guibg=#dadada

" set cursorline number color
highlight CursorLineNr guifg=#ff0087

