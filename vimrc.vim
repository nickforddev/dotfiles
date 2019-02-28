" ==================================================================================================
" Vim config
" ==================================================================================================

set nocompatible                                " Disable legacy mode

filetype on                                     " Must set to on before turning off
filetype off

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim               " set Vundle runtime path

call vundle#begin()                             " begin Vundle

if filereadable(expand("~/.vimrc.bundles"))     " include Vundle plugin files
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
endif

call vundle#end()                               " end Vundle

" Settings
syntax on                                       " turn on syntax highlighting
filetype plugin indent on                       " determine syntax via filetype and more

let mapleader=","                               " change to easier mapleader

" Spelling                                      " does this belong here? or in .local
set spell spelllang=en_us
setlocal spell spelllang=en_us

" Toggle spelling with the F7 key (should this move?)
nn <F7> :setlocal spell! spelllang=en_us<CR>

" Formatting
set number                                      " line numbers
set numberwidth=5                               " width of line number column
set autoindent                                  " tabs are fixed width
set nocursorcolumn                              " hides vertical highlight (cross-hair)
set cursorline                                  " highlights cursor line
set encoding=utf-8                              " file encoding
set title                                       " Show the filename in the window title bar
set shortmess=atI                               " hide intro
set report=0                                    " show messages

" Tabs
set backspace=indent,eol,start                  " allow backspacing over everything in insert mode
set tabstop=2                                   " length of tabs
set shiftwidth=2                                " length of auto tabs (inside code block)
set softtabstop=2                               " length of tabs in insert mode
set shiftround                                  " round tabs to multiples of shiftwidth
set expandtab                                   " currently being overridden

" inoremap <S-Tab> <C-V><Tab><CR> this isnt working, cant toggle hard and soft tabs

" Wrapping
set nowrap                                      " should we make shortcut to toggle?
set linebreak                                   " if wrap is on, only add a line break manually
set textwidth=200                               " columns for text wrap

" Buffer options
set ruler                                       " coordinates bottom right
set list                                        " display whitespace
set listchars=tab:\ ·,trail:·                   " characters to represent spaces and tabs
set fillchars=vert:\ " empty is nicer on our term   " define character to use for buffer separators
set showbreak=↪	                                " character to represent line break
set splitbelow                                  " open new buffer below instead of above
set splitright                                  " open new vert buffer on right
set laststatus=2                                " always show status line

" Improve performance
set lazyredraw                                  " only redraw when necessary
set showmatch	                                  " jump cursor to matching brace when you close a block
set matchtime=3                                 " defined match hop in tenths of a second

" Search
set hlsearch                                    " highlight search term matches
set incsearch                                   " turn incremental searching on
set ignorecase                                  " ignore case when searching
set smartcase                                   " only watch case if including an uppercase letter

" Autocomplete
set completeopt=longest,menuone                 " display autocomplete as an optionlist like IDEs
set omnifunc=syntaxcomplete#Complete            " turn on omnicompletion

set clipboard+=unnamed                          " share your clipboard with system
set mouse=a                                     " allow mouse use
set modeline                                    " allow to change expandtab within a file
set modelines=10                                " set range for beginning or end of file for modeline
set shell=/bin/bash                              " set shell

" Tabs
set wildmode=list:longest,list:full             " Tab completion
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/nimcache/*
set wildignore+=*.swp,*~,._*

" History / File handling
set history=999                                 " increase history (default = 20)
set undolevels=999                              " moar undo (default=100)
set autoread                                    " reload files if changed externally

set showcmd                                     " show (partial) command in the status line
set showmode                                    " show what mode you are in (Normal/Insert/Visual)

set backupdir=~/.vim/tmp/backup/                " where to put backup files.
set directory=~/.vim/tmp/swap/                  " where to put swap files.
set backupskip=/tmp/*,/private/tmp/*            " allow Vim to edit crontab files
set nobackup                                    " disable backups
set noswapfile                                  " disable swap files

" Avoid formatting bullets
set fo+=tcqlnr
" set fo-=r
" set fo-=o
set flp=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

if exists("&undodir")                           " persistent undo
  set undodir=~/.vim/undo/
  set undofile
endif

set nostartofline " Don’t reset cursor to start of line when moving around.
set esckeys " Allow cursor keys in insert mode
set ttyfast " Optimize for fast terminal connections
set isk+=_,$,@,%,#,- " none word dividers

if exists("&cryptmethod")
  set cryptmethod=blowfish " https://coderwall.com/p/hypjbg
endif

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Write better
if exists("&cc")
  set cc=100
endif

" In case we use molokay
let g:rehash256 = 1

" Set colors
set background=dark
colorscheme onedark

" Add a more detailed theme for airline
let g:airline_theme = 'tomorrow'

" Use Powerline fonts
let g:airline_powerline_fonts = 1

" Disable markdown floading
let g:vim_markdown_folding_disabled=1

" Verical bar in insert mode (for iTerm users only)
if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Save when losing focus
au FocusLost * :silent! wall

" When we open a new session let's change the path
au VimEnter * cd %:p:h

" Resize splits when the window is resized
au VimResized * :wincmd =

" Set current chdir
au VimEnter * silent! cd %:p:h

" Smart indent
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Set the snippets for golang
let g:go_snippet_engine = "ultisnips"
let g:go_fmt_command = "goimports"

" Use AG
let g:ackprg = 'ag --nogroup --nocolor --column'

" au FileType *    set expandtab   " others not ///// LOOK AT THIS
" au FileType make set noexpandtab

" Thorfile, Rakefile, GuardFile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Guardfile,Vagrantfile,Thorfile,Do,dorc,Dofile,config.ru} set ft=ruby

" Auto source when we change vimrc
" au BufWritePost {vimrc,.vimrc,.gvimrc,.nvim,.nvimrc} source %

" Add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" Special settings for common languages
au Filetype * set noexpandtab
au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=100 expandtab
au FileType {ruby,yaml} set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=100 expandtab

" Iced coffee
autocmd BufNewFile,BufRead *.iced set filetype=coffee
syn match coffeeKeyword /\<\%(await\|defer\)\>/ display

" Git commits
au Filetype gitcommit setlocal spell textwidth=72
au BufRead,BufNewFile GHI_* set ft=gitcommit

" remember last location in file, but not for commit messages.
au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

au BufRead,BufNewFile *.wisp set ft=clojure

" Make sh a bit happier
let g:is_bash=1

" Vitality
let g:always_assume_iterm = 0

let g:ale_linters = {
  \ 'javascript': ['standard'],
\}

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

" Enable syntastic syntax checking
" let g:syntastic_enable_signs   = 1

" Stop netrw
let g:netrw_silent = 1
let g:netrw_quiet  = 1
let g:loaded_netrw = 1

" NERDTree configuration
let NERDTreeQuitOnOpen  = 0   " don't collapse NERDTree when a file is opened
let NERDTreeMinimalUI   = 1
let NERDTreeDirArrows   = 0
let NERDTreeChDirMode   = 0
let NERDTreeIgnore      = ['\.pyc$', '\.rbc$', '\~$', '\.iml']
let NERDTreeHijackNetrw = 0
let g:nerdtree_tabs_startup_cd = 0
let g:nerdtree_tabs_open_on_gui_startup = 0

autocmd VimEnter * NERDTree

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:ycm_server_python_interpreter = '/usr/local/bin/python'

" Select with enter
" Play nice with YCM
let g:UltiSnipsUsePythonVersion = 3
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnips"]
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" let g:ulti_expand_or_jump_res = 0
" function! <SID>ExpandSnippetOrReturn()
"  let snippet = UltiSnips#ExpandSnippetOrJump()
"  if g:ulti_expand_or_jump_res > 0
"    return snippet
"  else
"    return "\<C-Y>"
"  endif
" endfunction
" imap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "<Plug>delimitMateCR"
" imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" Shortcuts
imap <C-w> <Esc><C-w> " move through windows in insert mode
imap <C-v> <Esc><C-v> " allow block selection in insert mode

" Keep visual mode during indenting
vmap > >gv
vmap < <gv

" Tab movements & creation
map <C-S-Left> gT
map <C-S-Right> gt
imap <C-S-Left> <Esc>gT
imap <C-S-Right> <Esc>gt

" Python
let g:pymode_rope_goto_definition_bind = '<Leader>gt'
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 100
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_rope_show_doc_bind = '<Leader>gd'
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_organize_imports_bind = '<Leader>is'

" Go
"  au FileType go nmap <Leader>gt <Plug>(go-def)

" Terminal
if has('nvim')
  let g:terminal_color_256=1
  tnoremap <Leader>e <C-\><C-n>
  tnoremap <C-S-Left> <C-\><C-n>gT
  tnoremap <C-S-Right> <C-\><C-n>gt
  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l
endif
" nnoremap <C-S-Left> <C-w>h
" nnoremap <C-S-Down> <C-w>j
" nnoremap <C-S-Up> <C-w>k
" nnoremap <C-S-Right> <C-w>l

" Shortcuts
nmap <leader>z :ZoomWin<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gc :Git c<CR>
nmap <leader>rr :redraw! \| :NERDTree<CR>
nmap <leader>cc :nohlsearch<CR>
nmap <leader>d :NERDTreeTabsToggle<CR>
nmap <leader>ff :NERDTreeTabsFind<CR>
nmap <leader>tb :TagbarToggle<CR>
nmap <leader>ff ggVG=         " format the entire file
nmap <leader>i :set list!<CR> " toggle [i]nvisible characters
nmap <Leader>o :CtrlP<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wqa :wqa<CR>
nmap <Leader>pu :put<CR>
vmap p "_dP

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 0

" if executable('fzf')
"   let g:ctrlp_use_caching = 0
"   let g:ctrlp_user_command = 'cd %s && find . -not \( -name .git -type d -prune \) -type f'
"   let g:ctrlp_match_func = { 'match': 'ZFZMatch' }

"   function! ZFZMatch(items, str, limit, mmode, ispath, crfile, regex)
"     let cmd = 'fzf -f \"'.a:str.'\"'
"     return split(system(cmd), "\n")
"   endfunction
" endif

let g:jsx_pragma_required = 0

" Clang format
" let g:clang_format#auto_format = 1
" let g:clang_format#style_options = {
"   \ 'BasedOnStyle': 'llvm',
"   \ 'ColumnLimit': 100,
"   \ 'BreakBeforeBraces' : 'Stroustrup',
"   \ }
"   \ 'AlwaysBreakAfterDefinitionReturnType': 'true',

" Additional mapping for buffer search
map  <C-k> :CtrlPBuffer<CR>
imap <C-k> <ESC>:CtrlPBuffer<CR>

map  <C-b> :CtrlPBufTag<CR>
imap <C-b> <ESC>:CtrlPBufTag<CR>

" Use :W! to write to a file using sudo if you forgot to 'sudo vim file'
ca W! %!sudo tee > /dev/null %
