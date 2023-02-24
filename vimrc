" Leader
let mapleader = " "

set autowrite     " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set et            " Expand tabs to spaces
set ff=unix       " Something about unix
set history=50
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set nobackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup
" set ruler         " show the cursor position all the time
set shell=/bin/bash
set showcmd       " display incomplete commands
set shiftround    " When at 3 spaces and I hit >>, go to 4, not 5.
set t_Co=256      " Use more colors
set colorcolumn=49

set nowrap

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

colorscheme night-owl


" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" File explorer
nmap <Leader>r :NvimTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>
nnoremap <silent> <Leader>v :NvimTreeFindFile<CR>
nnoremap <Leader>f :NvimTreeToggle<Enter>
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>h :TestNearest<CR>
nmap <silent> <leader>g :TestFile<CR>
nmap <silent> <leader>f :TestSuite<CR>

lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
EOF

nmap <c-p> :FZF<cr>
map <Leader>f :files<CR>
map <Leader>a :Ag<CR>

set number
set relativenumber
set numberwidth=5


" Switch between the last two files
nnoremap <leader><leader> <c-^>

" " vim-rspec mappings
" let g:rspec_command = "!bundle exec rspec {spec}"
" nnoremap <Leader>e :call RunAllSpecs()<CR>
" nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>s :call RunNearestSpec()<CR>
" " nnoremap <Leader>l :call RunLastSpec()<CR>
" nnoremap <Leader>c :RuboCop<CR>


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
set list listchars=trail:.,extends:>

" oops commands
command WQ wq                       "meant wq
command Wq wq                       "meant wq
command W w                         "meant w
command Q q                         "meant q
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>

" copy visualy selected text to clip board
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
