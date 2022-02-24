" ==================================================================================================
" Vim bundles
" ==================================================================================================

" Essentials
" --------------------------------------------------------------------------------------------------

Plugin 'VundleVim/Vundle.vim'                  " package manager
Plugin 'scrooloose/nerdtree'                   " filesystem browser
Plugin 'jistr/vim-nerdtree-tabs'               " nerdtree tabs
Plugin 'bling/vim-airline.git'                 " vim airline support
Plugin 'vim-airline/vim-airline-themes'        " vim airline themes
Plugin 'w0rp/ale'                              " linter

" Utilities
" --------------------------------------------------------------------------------------------------

Plugin 'kien/ctrlp.vim'                        " fuzzy finder for files, buffer, etc
Plugin 'mileszs/ack.vim'                       " ack support
Plugin 'airblade/vim-gitgutter'                " git diff in the gutter
Plugin 'tpope/vim-fugitive'                    " git integration
Plugin 'SirVer/ultisnips'                      " snippets
Plugin 'ycm-core/YouCompleteMe'                " autocompletion
Plugin 'mattn/emmet-vim'                       " emmet support
Plugin 'majutsushi/tagbar'                     " class outline viewer
Plugin 'severin-lemaignan/vim-minimap'         " minimap

" Editing
" --------------------------------------------------------------------------------------------------

Plugin 'tpope/vim-commentary'                  " comment handling
Plugin 'Raimondi/delimitMate'                  " delimit quotes, braces, etc
Plugin 'tpope/vim-surround'                    " wrap text
Plugin 'tpope/vim-sleuth'                      " use tabwidth of current file
Plugin 'godlygeek/tabular'                     " tab alignment tools
Plugin 'terryma/vim-expand-region'             " selection expansion/reduction
Plugin 'kristijanhusak/vim-multiple-cursors'   " allow for multiple cursors

" Buffers
" --------------------------------------------------------------------------------------------------

Plugin 'blueyed/ZoomWin'                       " zoom in and out of tabbed buffers
Plugin 'sjl/vitality.vim'                      " iterm / tmux support

" Themes
" --------------------------------------------------------------------------------------------------

Plugin 'jordwalke/flatlandia'                  " flatlandia
Plugin 'morhetz/gruvbox'                       " gruvbox
Plugin 'joshdick/onedark.vim'                  " one dark
Plugin 'drewtempelmeyer/palenight.vim'         " pale night

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