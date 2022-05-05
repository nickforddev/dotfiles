" ==================================================================================================  
" Vim config local
" ==================================================================================================

set nocompatible                                  " Disable legacy mode

" Settings
" --------------------------------------------------------------------------------------------------

set shell=/bin/zsh                                " set shell
set ff=unix                                       " use linux line endings
let g:is_bash=1                                   " make sh a bit happier

filetype on                                       " must set to on before turning off
filetype off

syntax on                                         " turn on syntax highlighting
filetype plugin indent on                         " determine syntax via filetype and more

let mapleader=","                                 " change to easier mapleader

" Plugins
" --------------------------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()                               " begin vundle

if filereadable(expand("~/.vimrc.bundles"))       " include plugins
  source ~/.vimrc.bundles
endif

if filereadable(expand("~/.vimrc.bundles.local")) " include local plugins
  source ~/.vimrc.bundles.local
endif

call vundle#end()                                 " end vundle

" Spelling
" --------------------------------------------------------------------------------------------------

set spell spelllang=en_us                         " use english
setlocal spell spelllang=en_us
nn <F7> :setlocal spell! spelllang=en_us<CR>      " toggle spelling with the F7 key

" Layout
" --------------------------------------------------------------------------------------------------

set number                                        " line numbers
set numberwidth=5                                 " width of line number column
set autoindent                                    " tabs are fixed width
set nocursorcolumn                                " hides vertical highlight (cross-hair)
set cursorline                                    " highlights cursor line
set title                                         " Show the filename in the window title bar
set shortmess=atI                                 " hide intro
set report=0                                      " show messages
set noshowcmd
set noruler

" Buffers
" --------------------------------------------------------------------------------------------------

"set ruler                                         " coordinates bottom right
set list                                          " display whitespace
set listchars=tab:\ ·,trail:·                     " characters to represent spaces and tabs
set fillchars=vert:\ "                            "" define character to use for buffer separators
set showbreak=↪	                                  " character to represent line break
set splitbelow                                    " open new buffer below instead of above
set splitright                                    " open new vert buffer on right
set laststatus=2                                  " always show status line

if exists("&cc")                                  " colorcolumn at col 100
  set cc=100
endif

let g:netrw_silent=1                              " stop netrw
let g:netrw_quiet=1
let g:loaded_netrw=1

" Formatting
" --------------------------------------------------------------------------------------------------

set encoding=utf-8                                " file encoding
set isk+=_,$,@,%,#,-                              " word dividers
set fo+=tcqlnr                                    " avoid formatting bullets
set flp=^\\s*\\d\\+\\.\\s\\+\\\|^[-*+]\\s\\+

" Tabs
" --------------------------------------------------------------------------------------------------

set backspace=indent,eol,start                    " allow backspacing over everything in insert mode
set tabstop=2                                     " length of tabs
set shiftwidth=2                                  " length of auto tabs (inside code block)
set softtabstop=2                                 " length of tabs in insert mode
set shiftround                                    " round tabs to multiples of shiftwidth
set expandtab                                     " currently being overridden
let delimitMate_expand_cr=1                       " smart indent
let delimitMate_expand_space=1

" Wrapping
" --------------------------------------------------------------------------------------------------

set nowrap                                        " should we make shortcut to toggle?
set linebreak                                     " if wrap is on, only add a line break manually
set textwidth=200                                 " columns for text wrap

" Performance
" --------------------------------------------------------------------------------------------------

set lazyredraw                                    " only redraw when necessary
set showmatch	                                    " jump cursor to matching brace when closing block
set matchtime=3                                   " defined match hop in tenths of a second
set ttyfast                                       " optimize for fast terminal connections
set notimeout                                     " time out on key codes but not mappings
set ttimeout
set ttimeoutlen=10

" Search
" --------------------------------------------------------------------------------------------------

set hlsearch                                      " highlight search term matches
set incsearch                                     " turn incremental searching on
set ignorecase                                    " ignore case when searching
set smartcase                                     " only watch case if including an uppercase letter
let g:ackprg="ag --nogroup --nocolor --column"    " use AG
let g:ctrlp_working_path_mode='ra'                " ctrlp
let g:ctrlp_by_filename=0

if executable('fzf')
  set rtp+=/usr/local/opt/fzf

  if has('nvim')
    let $FZF_DEFAULT_OPTS='--layout=reverse'
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }

    function! FloatingFZF()
      let buf = nvim_create_buf(v:false, v:true)
      call setbufvar(buf, '&signcolumn', 'no')

      let height = &lines - 18
      let width = float2nr(&columns - (&columns * 2 / 20))
      let col = float2nr((&columns - width) / 2)

      let opts = {
        \ 'relative': 'editor',
        \ 'row': 4,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

      call nvim_open_win(buf, v:true, opts)
    endfunction
  endif
endif

" if executable('fzf')
"   let g:ctrlp_use_caching=0
"   let g:ctrlp_user_command='cd %s && find . -not \( -name .git -type d -prune \) -type f'
"   let g:ctrlp_match_func={ 'match': 'ZFZMatch' }

"   function! ZFZMatch(items, str, limit, mmode, ispath, crfile, regex)
"     let cmd='fzf -f \"'.a:str.'\"'
"     return split(system(cmd), "\n")
"   endfunction
" endif

" Autocomplete
" --------------------------------------------------------------------------------------------------

set completeopt=longest,menuone                   " display autocomplete as an optionlist like IDEs
set omnifunc=syntaxcomplete#Complete              " turn on omnicompletion

set clipboard+=unnamed                            " share your clipboard with system
set mouse=a                                       " allow mouse use
set modeline                                      " allow to change expandtab within a file
set modelines=10                                  " set range for beginning/end of file for modeline

set wildmode=list:longest,list:full               " Tab completion
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*/nimcache/*
set wildignore+=*.swp,*~,._*

" Snippets
" --------------------------------------------------------------------------------------------------

if has('conceal')                                 " for snippet_complete marker
  set conceallevel=2 concealcursor=i
endif

let g:UltiSnipsUsePythonVersion=3                 " make UltiSnips play nice with YCM
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "ultisnips"]
" let g:ulti_expand_or_jump_res=0
" function! <SID>ExpandSnippetOrReturn()
"  let snippet=UltiSnips#ExpandSnippetOrJump()
"  if g:ulti_expand_or_jump_res > 0
"    return snippet
"  else
"    return "\<C-Y>"
"  endif
" endfunction
" imap <expr> <CR> pumvisible() ? "<C-R>=<SID>ExpandSnippetOrReturn()<CR>" : "<Plug>delimitMateCR"
" imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" History / File handling
" --------------------------------------------------------------------------------------------------

set history=999                                   " increase history (default=20)
set undolevels=999                                " moar undo (default=100)
set autoread                                      " reload files if changed externally

" set showcmd                                       " show (partial) command in the status line
set showmode                                      " show what mode you are in (Normal/Insert/Visual)

set backupdir=~/.vim/tmp/backup/                  " where to put backup files.
set directory=~/.vim/tmp/swap/                    " where to put swap files.
set backupskip=/tmp/*,/private/tmp/*              " allow Vim to edit crontab files
set nobackup                                      " disable backups
set noswapfile                                    " disable swap files

if exists("&undodir")                             " persistent undo
  set undodir=~/.vim/undo/  
  set undofile  
endif 

set nostartofline                                 " dont reset cursor to start of line when moving
if !has('nvim')                                   " vertical bar in insert mode (for iTerm)
  set esckeys                                     " allow cursor keys in insert mode
endif

au FocusLost * :silent! wall                      " save when losing focus
au VimEnter * cd %:p:h                            " when we open a new session change the path
au VimResized * :wincmd=                          " resize splits when the window is resized
au VimEnter * silent! cd %:p:h                    " set current chdir

ca W! %!sudo tee > /dev/null %                    " use :W! to write to a file using sudo if needed

" Auto source when we change vimrc
" au BufWritePost {vimrc,.vimrc,.gvimrc,.nvim,.nvimrc} source %

" NERDTree
" --------------------------------------------------------------------------------------------------

let NERDTreeQuitOnOpen=0                          " dont collapse NERDTree when a file is opened
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeChDirMode=0
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', '\.iml']
let NERDTreeHijackNetrw=0
let g:nerdtree_tabs_startup_cd=0
let g:nerdtree_tabs_open_on_gui_startup=0
" nerdtree syntax"
let s:cyan = "50a6a8"
let s:magenta = "a36584"
let g:WebDevIconsDefaultFolderSymbolColor = s:cyan " sets the color for folders that did not 

autocmd VimEnter * NERDTree                       " open NERDTree on vim launch
autocmd VimEnter * wincmd p                       " try to focus document instead of NERDTree

" Minimap

" au BufReadPost,BufNewFile * Minimap               " open Minimap when files are opened

" Passwords
" --------------------------------------------------------------------------------------------------

if exists("&cryptmethod")
  set cryptmethod=blowfish                        " https://coderwall.com/p/hypjbg
endif

" Linting
" --------------------------------------------------------------------------------------------------

let g:ale_linters={
  \ 'javascript': ['standard'],
\}

let g:ale_sign_column_always=1

" Themes
" --------------------------------------------------------------------------------------------------

set background=dark
" if has('nvim')
"   colorscheme onedarker
" else
"   colorscheme onedark
" endif
colorscheme wal

let g:rehash256=1                                 " use 256 color if theme is molokai
let g:airline_theme="onedark"                     " add a more detailed theme for airline
let g:airline_powerline_fonts=1                   " use powerline fonts
let g:airline#extensions#ale#enabled=1
let g:vim_markdown_folding_disabled=1             " disable markdown folding
let g:palenight_terminal_italics=1

if has('nvim')                                    " vertical bar in insert mode (for iTerm)
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
else
  let &t_SI="\<Esc>]50;CursorShape=1\x7"
  let &t_EI="\<Esc>]50;CursorShape=0\x7"
endif

if (has("termguicolors"))
  set termguicolors
endif

" Git
" --------------------------------------------------------------------------------------------------

au Filetype gitcommit setlocal spell textwidth=72 " git commits
au BufRead,BufNewFile GHI_* set ft=gitcommit

au BufReadPost *                                  " remember position in file, but not for commits
  \ if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
  \ | exe "normal! g`\"" | endif

" Syntax / Languages
" --------------------------------------------------------------------------------------------------

" JSON
au BufNewFile,BufRead *.json set ft=javascript

" JSX
let g:jsx_pragma_required=0

" Ruby
au BufRead,BufNewFile
  \ {Gemfile,Rakefile,Guardfile,Vagrantfile,Thorfile,Do,dorc,Dofile,config.ru}
  \ set ft=ruby

" Special settings for common languages
au Filetype * set noexpandtab
au FileType {ruby,yaml}
  \ set softtabstop=2 tabstop=2 shiftwidth=2 textwidth=100 expandtab
au FileType python
  \ set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=100 expandtab

" Clojure
au BufRead,BufNewFile *.wisp set ft=clojure

" Python
let g:ycm_server_python_interpreter='python3'
let g:pymode_rope_goto_definition_bind='<Leader>gt'
let g:pymode_folding=0
let g:pymode_options_max_line_length=100
let g:pymode_lint_checkers=['pyflakes', 'pep8']
let g:pymode_rope_show_doc_bind='<Leader>gd'
let g:pymode_rope_autoimport_import_after_complete=1
let g:pymode_rope_organize_imports_bind='<Leader>is'

" Go
"  au FileType go nmap <Leader>gt <Plug>(go-def)
let g:go_snippet_engine="ultisnips"
let g:go_fmt_command="goimports"

" Terminal
" --------------------------------------------------------------------------------------------------

if has('nvim')                                    " nvim adjustments
  let g:terminal_color_256=1
  tnoremap <Leader>e <C-\><C-n>
  tnoremap <C-S-Left> <C-\><C-n>gT
  tnoremap <C-S-Right> <C-\><C-n>gt
  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l
endif

let g:always_assume_iterm=0                       " vitality

" Shortcuts
" --------------------------------------------------------------------------------------------------

imap <C-w> <Esc><C-w>                             " move through windows in insert mode
imap <C-v> <Esc><C-v>                             " allow block selection in insert mode

vmap > >gv                                        " keep visual mode during indenting
vmap < <gv

map <C-S-Left> gT                                 " tab movements & creation
map <C-S-Right> gt
imap <C-S-Left> <Esc>gT
imap <C-S-Right> <Esc>gt

" nnoremap <C-S-Left> <C-w>h
" nnoremap <C-S-Down> <C-w>j
" nnoremap <C-S-Up> <C-w>k
" nnoremap <C-S-Right> <C-w>l

nmap <leader>z :ZoomWin<CR>                       " zoomwin
nmap <leader>gs :Gstatus<CR>                      " git
nmap <leader>gd :Gdiff<CR>
nmap <leader>gp :Git push<CR>
nmap <leader>gc :Git c<CR>
nmap <leader>rr :redraw! \| :NERDTree<CR>
nmap <leader>d :NERDTreeTabsToggle<CR>
nmap <leader>ff :NERDTreeTabsFind<CR>
nmap <leader>tb :TagbarToggle<CR>
nmap <leader>ff ggVG=                             " format the entire file
nmap <leader>i :set list!<CR>                     " toggle invisible characters
nmap <Leader>o :CtrlP<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>wqa :wqa<CR>
nmap <Leader>pu :put<CR>
vmap p                                            "_dP

map <C-p> :FZF<CR>

" Create default mappings
let g:NERDCreateDefaultMappings = 1

inoremap jk <ESC>
" nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" map  <C-b> :CtrlPBufTag<CR>
" imap <C-b> <ESC>:CtrlPBufTag<CR>
