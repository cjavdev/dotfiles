" Leader
let mapleader = " "

set autowrite     " Automatically :write before running commands
set backspace=2   " Backspace deletes like most programs in insert mode
set et            " Expand tabs to spaces
set ff=unix       " Something about unix
set history=50
set incsearch     " do incremental searching
" set laststatus=2  " Always display the status line
set nobackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowritebackup
" set ruler         " show the cursor position all the time
set shell=/bin/bash
set showcmd       " display incomplete commands
set shiftround    " When at 3 spaces and I hit >>, go to 4, not 5.
set t_Co=256      " Use more colors

set nowrap

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

colorscheme onedark

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" onedark.vim override: Set a custom background color in the terminal
if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  augroup END
endif
set background=dark
filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
autocmd FileType python set sts=4
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype xsd setlocal ts=4 sts=4 sw=4
autocmd Filetype cs set textwidth=100

au BufNewFile,BufRead *php set filetype=html
au BufNewFile,BufRead *ejs set filetype=html
au BufNewFile,BufRead *html.erb set filetype=html
au BufNewFile,BufRead *blade.php set filetype=html
au BufNewFile,BufRead *js.erb set filetype=javascript


hi Sig               cterm=italic ctermfg=1 ctermbg=11
hi SigBlockDelimiter cterm=italic ctermfg=9 ctermbg=11
hi StatusLine ctermbg=425466 ctermfg=425466
hi Comment ctermfg=246
hi LineNr ctermfg=242

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore\ "docs/*"

  " " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
  "
  " " ag is fast enough that CtrlP doesn't need to cache
  " " let g:ctrlp_use_caching = 0
  " let g:ctrlp_match_window = 'min:4,max:72'

  let g:ag_working_path_mode="r"
endif
let NERDTreeShowHidden=1
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>
nmap <c-p> :FZF<cr>
" nmap <c-p> :GFiles<cr>
map <Leader>f :files<CR>
map <Leader>a :Ag<CR>

" Make it obvious where 80 characters is
" Removing for demos.
" set textwidth=80
" set colorcolumn=+1

hi StatusLine cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40
hi Visual cterm=NONE ctermbg=0 ctermfg=NONE guibg=Grey40
" hi ColorColumn ctermbg=0 guibg=lightgrey
hi SpellBad ctermfg=052 ctermbg=198 guifg=#FF5191 guibg=#FF5191
hi SpellCap ctermfg=052 ctermbg=198 guifg=#FF5191 guibg=#FF5191
hi Folded guibg=#A0A0A0

" Numbers
set number
set relativenumber
set numberwidth=5

" Make it obvious which paren i'm on
hi MatchParen cterm=underline ctermbg=none ctermfg=none

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <C-P> <c-r>=InsertTabWrapper()<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" vim-rspec mappings
let g:rspec_command = "!bundle exec rspec {spec}"
nnoremap <Leader>e :call RunAllSpecs()<CR>
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>c :RuboCop<CR>

function! MissingImportCheck()
  execute "!git diff HEAD --name-only --cached | xargs sfood-checker 2>&1 | grep -v 'migration' | grep -v '_doc.py' | grep -v 'tools'"
endfunction
nnoremap <c-s> :call MissingImportCheck()<CR>

let g:test#csharp#runner = 'dotnettest'
nmap <silent> <leader>h :TestNearest<CR>
nmap <silent> <leader>l :TestFile<CR>
function! Testing()
  VtrSendCommandToRunner! echo test
endfunction
nmap <silent> <leader>k :call Testing()<CR>


" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Autosave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" ======= coc settings
set updatetime=300
set shortmess+=c

" deconflict ruby and rails snippets
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate = { 'snippet_version' : 1 }
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = ''
let g:snipMate.no_default_aliases = 1

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

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical

" oops commands
command WQ wq                       "meant wq
command Wq wq                       "meant wq
command W w                         "meant w
command Q q                         "meant q
command Vsplit vsplit               "meant vsplit
command VSplit vsplit               "meant vsplit
command Split split                 "meant split

nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>

" copy visualy selected text to clip board
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" copy from buffer into temp file to paste in another vim buffer
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P
nnoremap <Leader>p :set paste<CR>"*p:set nopaste<CR>
