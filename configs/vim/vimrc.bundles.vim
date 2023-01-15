" ==================================================================================================
" Vim plugins
" ==================================================================================================

" Essentials
" --------------------------------------------------------------------------------------------------

Plugin 'VundleVim/Vundle.vim'                  " package manager
Plugin 'preservim/nerdtree'                   " filesystem browser
Plugin 'Xuyuanp/nerdtree-git-plugin'           " add git diff icons to nerdtree
Plugin 'jistr/vim-nerdtree-tabs'               " nerdtree tabs
Plugin 'bling/vim-airline'                     " vim airline support
Plugin 'vim-airline/vim-airline-themes'        " vim airline themes
" Plugin 'w0rp/ale'                              " linter

" Utilities
" --------------------------------------------------------------------------------------------------

Plugin 'mileszs/ack.vim'                       " ack support
Plugin 'airblade/vim-gitgutter'                " git diff in the gutter
" Plugin 'SirVer/ultisnips'                      " snippets
" Plugin 'ycm-core/YouCompleteMe'                " autocompletion
Plugin 'neoclide/coc.nvim'
Plugin 'mattn/emmet-vim'                       " emmet support
Plugin 'preservim/tagbar'                     " class outline viewer
" Plugin 'severin-lemaignan/vim-minimap'         " minimap
Plugin 'ryanoasis/vim-devicons'                " file icons
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'airblade/vim-rooter'                     " find git root

" Editing
" --------------------------------------------------------------------------------------------------

Plugin 'Raimondi/delimitMate'                  " delimit quotes, braces, etc
Plugin 'tpope/vim-surround'                    " wrap text
Plugin 'tpope/vim-sleuth'                      " use tabwidth of current file
Plugin 'godlygeek/tabular'                     " tab alignment tools
Plugin 'terryma/vim-expand-region'             " selection expansion/reduction
Plugin 'kristijanhusak/vim-multiple-cursors'   " allow for multiple cursors
Plugin 'preservim/nerdcommenter'               " comment management

" Buffers
" --------------------------------------------------------------------------------------------------

Plugin 'blueyed/ZoomWin'                       " zoom in and out of tabbed buffers
Plugin 'sjl/vitality.vim'                      " iterm / tmux support

" Themes
" --------------------------------------------------------------------------------------------------

Plugin 'jordwalke/flatlandia'                  " flatlandia
Plugin 'morhetz/gruvbox'                       " gruvbox
Plugin 'drewtempelmeyer/palenight.vim'         " pale night
Plugin 'joshdick/onedark.vim'                  " one dark
Plugin 'dylanaraps/wal.vim'

if has('nvim')
  Plugin 'navarasu/onedark.nvim'               " one dark
  Plugin 'lunarvim/darkplus.nvim'
  Plugin 'lunarvim/onedarker.nvim'
endif

" Syntax
" --------------------------------------------------------------------------------------------------

Plugin 'python-mode/python-mode'               " python
Plugin 'plasticboy/vim-markdown'               " markdown
Plugin 'othree/html5.vim'                      " html5
Plugin 'hail2u/vim-css3-syntax'                " css3
Plugin 'groenewege/vim-less'                   " less
Plugin 'vim-ruby/vim-ruby'                     " ruby
Plugin 'isRuslan/vim-es6'                      " es6
Plugin 'posva/vim-vue'                         " vue