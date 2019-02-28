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

| Package                              | Description                           |
| -------------------------------------|---------------------------------------|
| **Essentials**                                                               |
| VundleVim/Vundle.vim                 | *package manager*                     |
| scrooloose/nerdtree                  | filesystem browser                    |
| jistr/vim-nerdtree-tabs              | nerdtree tabs                         |
| bling/vim-airline.git                | vim airline support                   |
| vim-airline/vim-airline-themes       | vim airline themes                    |
| w0rp/ale                             | linter                                |
| **Utilities**                                                                |
| kien/ctrlp.vim                       | fuzzy finder for files, buffer, etc   |
| mileszs/ack.vim                      | ack support                           |
| airblade/vim-gitgutter               | git diff in the gutter                |
| tpope/vim-fugitive                   | git integration                       |
| SirVer/ultisnips                     | snippets                              |
| Valloric/YouCompleteMe               | autocompletion                        |
| mattn/emmet-vim                      | emmet support                         |
| majutsushi/tagbar                    | class outline viewer                  |
| **Editing**                                                                  |
| tpope/vim-commentary                 | comment handling                      |
| Raimondi/delimitMate                 | delimit quotes, braces, etc           |
| tpope/vim-surround                   | wrap text                             |
| tpope/vim-sleuth                     | use tabwidth of current file          |
| godlygeek/tabular                    | tab alignment tools                   |
| terryma/vim-expand-region            | selection expansion/reduction         |
| kristijanhusak/vim-multiple-cursors  | allow for multiple cursors            |
| **Buffers**                                                                  |
| blueyed/ZoomWin                      | zoom in and out of tabbed buffers     |
| sjl/vitality.vim                     | iterm / tmux support                  |
| **Themes**                                                                   |
| jordwalke/flatlandia                 | flatlandia                            |
| morhetz/gruvbox                      | gruvbox                               |
| joshdick/onedark.vim                 | one dark                              |
| **Syntax**                                                                   |
| klen/python-mode                     | python                                |
| plasticboy/vim-markdown              | markdown                              |
| othree/html5.vim                     | html5                                 |
| hail2u/vim-css3-syntax               | css3                                  |
| groenewege/vim-less                  | less                                  |
| vim-ruby/vim-ruby                    | ruby                                  |
| isRuslan/vim-es6                     | es6                                   |
| posva/vim-vue                        | vue                                   |
