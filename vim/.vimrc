" .vimrc
"

let mapleader = " "  " Set leader key to space

                   " Vim General Settings
syntax on
set scrolloff=8
set sidescrolloff=8
set laststatus=2
set number
set relativenumber
set mouse=a
set wrap
" set backup
" set swapfile
set undofile 
let NERDTreeShowHidden=1
set tabstop=4            
set shiftwidth=4        
set expandtab          
set smartindent         
set autoindent
set hlsearch 
set incsearch 
set ignorecase           
set smartcase             
set cmdheight=3           
set ttyfast              
set termguicolors 
set showmatch             
set timeoutlen=300        
filetype plugin indent on
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set pumheight=8        
set completeopt+=preview  
set selection=exclusive
set background=dark
set showtabline=2
set colorcolumn=80
set foldenable
set foldmethod=manual   
set foldlevelstart=99    
set foldcolumn=1

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END


if has("autocmd")
  au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


nnoremap <Leader>c ggVG" +y 
nnoremap <C-p> :Files<CR>  
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
nnoremap <C-d> :bd<CR> 
nnoremap <C-b> :Buffers<CR>
nnoremap <C-t> :History<CR>
nmap <C-n> :let NERDTreeShowHidden=1<CR>:NERDTreeToggle<CR>
nnoremap <F5> :UndotreeToggle<CR>
"nmap <silent> K :call CocActionAsync('doHover')<CR>
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"


" Use xsel for clipboard integration in Vim
if executable('xsel')
    set clipboard+=unnamedplus
    let g:clipboard = {
        \   'name': 'xsel',
        \   'copy': {
        \      '+': 'xsel --input --clipboard',
        \      '*': 'xsel --input --primary',
        \    },
        \   'paste': {
        \      '+': 'xsel --output --clipboard',
        \      '*': 'xsel --output --primary',
        \   },
        \   'cache_enabled': 1,
        \ }
endif


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
