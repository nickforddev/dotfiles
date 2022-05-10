const path = require('path');
const homedir = require('os').homedir();

module.exports = (processTargets) => {
  return {
    async zsh() {
      const filePaths = [
        'zprofile.sh',
        'zshrc.sh',
        'zshrc.local.sh',
      ];
      await processTargets({
        filePaths,
        sourceDir: 'zsh',
        removeExt: true,
        targetIsHidden: true,
      });
    },
    async scripts() {
      const filePaths = [
        'scripts',
      ];
      const targetDir = path.resolve(
        homedir,
        '.config/zsh/'
      );
      await processTargets({
        filePaths,
        sourceDir: 'zsh',
        targetDir,
      });
    },
    async p10k() {
      const filePaths = [
        'p10k.zsh',
      ];
      await processTargets({
        filePaths,
        sourceDir: 'p10k',
        targetIsHidden: true,
      });
    },
    async iterm() {
      const filePaths = [
        'profiles.json',
      ];
      await processTargets({
        filePaths,
        sourceDir: 'iterm',
      });
    },
    // async macos() {
    //   const filePaths = [
    //     'macos'
    //   ];
    //   await processTargets({
    //     filePaths,
    //     sourceDir: 'macos',
    //     targetIsHidden: true
    //   });
    // },
    async vim() {
      const filePaths = [
        'vimrc.vim',
        'vimrc.local.vim',
        'vimrc.bundles.vim',
        'vimrc.bundles.local.vim',
      ];
      await processTargets({
        filePaths,
        sourceDir: 'vim',
        removeExt: true,
        targetIsHidden: true,
      });
    },
    async neovim() {
      const filePaths = [
        'init.vim',
      ];
      const targetDir = path.resolve(
        homedir,
        '.config/nvim/'
      );
      await processTargets({
        filePaths,
        sourceDir: 'neovim',
        targetDir,
      });
    },
    async vscode() {
      const filePaths = [
        'User',
      ];
      const targetDir = path.resolve(
        homedir,
        'Library/Application Support/Code'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'vscode',
      });
    },
    async quicksilver() {
      const filePaths = [
        'Triggers.plist',
      ];
      const targetDir = path.resolve(
        homedir,
        'Library/Application Support/Quicksilver'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'quicksilver',
      });
    },
    async musikcube() {
      const filePaths = [
        'themes',
      ];
      const targetDir = path.resolve(
        homedir,
        '.config/musikcube'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'musikcube',
      });
    },
    async vis() {
      const filePaths = [
        'config',
        'colors',
      ];
      const targetDir = path.resolve(
        homedir,
        '.config/vis'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'vis',
      });
    },
    async cava() {
      const filePaths = [
        'config.sh',
      ];
      const targetDir = path.resolve(
        homedir,
        '.config/cava'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'cava',
        removeExt: true,
      });
    },
    async uebersicht() {
      const filePaths = [
        'widgets',
      ];
      const targetDir = path.resolve(
        homedir,
        'Library/Application Support/Übersicht'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'uebersicht',
      });
    },
    async yabai() {
      const filePaths = [
        'yabairc.sh',
        'scripts',
      ];
      const targetDir = path.resolve(
        homedir,
        '.config/yabai'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'yabai',
        removeExt: true,
      });
    },
    async skhd() {
      const filePaths = [
        'skhdrc.sh',
        'scripts',
      ];
      const targetDir = path.resolve(
        homedir,
        '.config/skhd'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'skhd',
        removeExt: true,
      });
    },
    async btop() {
      const filePaths = [
        'themes',
        'btop.conf.conf',
      ];
      const targetDir = path.resolve(
        homedir,
        '.config/btop'
      );
      await processTargets({
        filePaths,
        targetDir,
        sourceDir: 'btop',
        removeExt: true,
      });
    },
  };
};
