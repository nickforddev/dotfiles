# dotfiles

My dotfiles for zsh and vim, based on the  [CTRL-FREAKZ dotfiles](https://github.com/ctrl-freaks/configs)

## Installation

Install dependencies

```bash
npm run install
```

Run the setup script, which will create symlinks for the dotfiles:

```bash
npm run setup
```

## ZSH

Fairly uninteresting config with [Powerlevel9k](https://github.com/bhilburn/powerlevel9k) theme.

### Plugins

- oh-my-zsh
- powerlevel9k

## Vim

Opinionated Vim config tha

### Vim bundles

| Package                                                                                       | Description                           |
|-----------------------------------------------------------------------------------------------|---------------------------------------|
| **Essentials**                                                                                |                                       |
| [VundleVim/Vundle.vim](https://github.com/VundleVim/Vundle.vim)                               | _package manager_                     |
| [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)                                 | _filesystem browser_                  |
| [jistr/vim-nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs)                         | _nerdtree tabs_                       |
| [bling/vim-airline.git](https://github.com/bling/vim-airline.git)                             | _vim airline support_                 |
| [vim-airline/vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)           | _vim airline themes_                  |
| [w0rp/ale](https://github.com/w0rp/ale)                                                       | _linter_                              |
| **Utilities**                                                                                 |                                       |
| [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)                                           | _fuzzy finder for files, buffer, etc_ |
| [mileszs/ack.vim](https://github.com/mileszs/ack.vim)                                         | _ack support_                         |
| [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)                           | _git diff in the gutter_              |
| [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)                                   | _git integration_                     |
| [SirVer/ultisnips](https://github.com/SirVer/ultisnips)                                       | _snippets_                            |
| [Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)                           | _autocompletion_                      |
| [mattn/emmet-vim](https://github.com/mattn/emmet-vim)                                         | _emmet support_                       |
| [majutsushi/tagbar](https://github.com/majutsushi/tagbar)                                     | _class outline viewer_                |
| **Editing**                                                                                   |                                       |
| [tpope/vim-commentary](https://github.com/tpope/vim-commentary)                               | _comment handling_                    |
| [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)                               | _delimit quotes, braces, etc_         |
| [tpope/vim-surround](https://github.com/tpope/vim-surround)                                   | _wrap text_                           |
| [tpope/vim-sleuth](https://github.com/tpope/vim-sleuth)                                       | _use tabwidth of current file_        |
| [godlygeek/tabular](https://github.com/godlygeek/tabular)                                     | _tab alignment tools_                 |
| [terryma/vim-expand-region](https://github.com/terryma/vim-expand-region)                     | _selection expansion/reduction_       |
| [kristijanhusak/vim-multiple-cursors](https://github.com/kristijanhusak/vim-multiple-cursors) | _allow for multiple cursors_          |
| [**Buffers**](https://github.com/**Buffers**)                                                 |                                       |
| [blueyed/ZoomWin](https://github.com/blueyed/ZoomWin)                                         | _zoom in and out of tabbed buffers_   |
| [sjl/vitality.vim](https://github.com/sjl/vitality.vim)                                       | _iterm / tmux support_                |
| **Themes**                                                                                    |                                       |
| [jordwalke/flatlandia](https://github.com/jordwalke/flatlandia)                               | _flatlandia_                          |
| [morhetz/gruvbox](https://github.com/morhetz/gruvbox)                                         | _gruvbox_                             |
| [joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)                               | _one dark_                            |
| **Syntax**                                                                                    |                                       |
| [klen/python-mode](https://github.com/klen/python-mode)                                       | _python_                              |
| [vim-ruby/vim-ruby](https://github.com/vim-ruby/vim-ruby)                                     | _ruby_                                |
| [plasticboy/vim-markdown](https://github.com/plasticboy/vim-markdown)                         | _markdown_                            |
| [othree/html5.vim](https://github.com/othree/html5.vim)                                       | _html5_                               |
| [hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)                           | _css3_                                |
| [groenewege/vim-less](https://github.com/groenewege/vim-less)                                 | _less_                                |
| [isRuslan/vim-es6](https://github.com/isRuslan/vim-es6)                                       | _es6 (javascript)_                    |
| [posva/vim-vue](https://github.com/posva/vim-vue)                                             | _vue_                                 |
