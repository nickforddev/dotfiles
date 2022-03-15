const fs = require('fs');
const path = require('path');
const clear = require('clear');
const rimraf = require('rimraf');
const inquirer = require('inquirer');
const chalk = require('chalk');
const figlet = require('figlet');
const homedir = require('os').homedir();

const configsDir = path.resolve(__dirname, '../configs');

function sleep(duration) {
  return new Promise((resolve) => setTimeout(resolve, duration));
}

module.exports.sleep = sleep;

function anyKey() {
  return new Promise((resolve) => {
    process.stdin.setRawMode(true);
    process.stdin.resume();
    process.stdin.on('data', resolve);
  });
}

async function printMessage(message, {
  pause = 0,
  padding = 1,
  paddingChar = '\n',
  color = 'green'
} = {}) {
  const pad = new Array(padding).fill(paddingChar).join('');
  console.log(chalk[color](`${pad}${message}${pad}`));
  await sleep(pause);
}

function getConfigNames() {
  return fs.readdirSync(configsDir)
    .filter((item) => !/^\./.test(item));
}

module.exports.getConfigNames = getConfigNames;

function checkTarget(filePath) {
  return fs.existsSync(filePath);
}

module.exports.checkTarget = checkTarget;

function printFont(text = '', font = 'Big Money-ne') {
  console.log(
    figlet.textSync(text, {
      font,
      horizontalLayout: 'default',
      verticalLayout: 'default'
    })
  );
}

module.exports.printFont = printFont;

function clearPrint(...args) {
  clear();
  console.log();
  printFont(args);
}

module.exports.clearPrint = clearPrint;

async function linkTarget({
  sourcePath = null,
  targetPath = null
} = {}) {
  fs.symlinkSync(sourcePath, targetPath);
}

module.exports.linkTarget = linkTarget;

async function overWriteTarget({
  sourcePath = null,
  targetPath = null
} = {}) {
  if ([sourcePath, targetPath].includes(null)) {
    throw new ReferenceError('Empty path is invalid');
  }
  const isDir = fs.lstatSync(targetPath).isDirectory();
  if (isDir) {
    rimraf.sync(targetPath);
  } else {
    fs.unlinkSync(targetPath);
  }
  await linkTarget({
    sourcePath,
    targetPath
  });
}

module.exports.overWriteTarget = overWriteTarget;

function getTargetFileName({
  filePath,
  removeExt,
  targetIsHidden
} = {}) {
  const name = removeExt
    ? filePath.replace(/\.[^.]*$/gi, '')
    : filePath;
  return targetIsHidden ? `.${name}` : name;
}

module.exports.getTargetFileName = getTargetFileName;

async function processTargets({
  filePaths = [],
  removeExt = false,
  sourceDir = '',
  targetDir = homedir,
  targetIsHidden = false
} = {}) {
  clearPrint(sourceDir);

  for (const filePath of filePaths) {
    const sourcePath = path.resolve(configsDir, sourceDir, filePath);
    const targetFileName = getTargetFileName({
      filePath,
      removeExt,
      targetIsHidden
    });
    const targetPath = path.resolve(targetDir, targetFileName.replace(/(\s+)/g, '\\$1'));
    const targetExists = checkTarget(targetPath);

    console.log(`${sourcePath} -> ${targetPath}\n`);

    if (targetExists) {
      const { overwrite } = await inquirer
        .prompt([
          {
            type: 'confirm',
            name: 'overwrite',
            message: `${targetPath} already exists, do you want to overwrite?`
          }
        ]);
      if (overwrite) {
        await overWriteTarget({
          sourcePath,
          targetPath
        });
        await printMessage(`Symlinked to ${targetFileName}`, { color: 'green' });
      } else {
        await printMessage(`Skipping ${targetFileName}`, { color: 'blue' });
      }
    } else {
      await linkTarget({
        sourcePath,
        targetPath
      });
      await printMessage(`Symlinked to ${targetFileName}`, { color: 'blue' });
    }
  }
  await printMessage(`Finished ${sourceDir}, press any key to continue`, { padding: 0 });

  if (!global.isLast) {
    await anyKey();
  }
}

module.exports.processTargets = processTargets;

const configMap = {
  async zsh() {
    const filePaths = [
      'zprofile.sh',
      'zshrc.sh',
      'zshrc.local.sh'
    ];
    await processTargets({
      filePaths,
      sourceDir: 'zsh',
      removeExt: true,
      targetIsHidden: true
    });
  },
  async p10k() {
    const filePaths = [
      'p10k.zsh'
    ];
    await processTargets({
      filePaths,
      sourceDir: 'p10k',
      targetIsHidden: true
    });
  },
  async macos() {
    const filePaths = [
      'macos'
    ];
    await processTargets({
      filePaths,
      sourceDir: 'macos',
      targetIsHidden: true
    });
  },
  async vim() {
    const filePaths = [
      'vimrc.vim',
      'vimrc.local.vim',
      'vimrc.bundles.vim',
      'vimrc.bundles.local.vim'
    ];
    await processTargets({
      filePaths,
      sourceDir: 'vim',
      removeExt: true,
      targetIsHidden: true
    });
  },
  async neovim() {
    const filePaths = [
      'init.vim'
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
      'User'
    ];
    const targetDir = path.resolve(
      homedir,
      'Library/Application Support/Code'
    );
    await processTargets({
      filePaths,
      targetDir,
      sourceDir: 'vscode'
    });
  },
  async quicksilver() {
    const filePaths = [
      'Triggers.plist'
    ];
    const targetDir = path.resolve(
      homedir,
      'Library/Application Support/Quicksilver'
    );
    await processTargets({
      filePaths,
      targetDir,
      sourceDir: 'quicksilver'
    });
  }
};

async function install(configs) {
  for (const index in configs) {
    const config = configs[index];
    global.isLast = +index === configs.length - 1;
    await configMap[config]();
  }
  clearPrint('Done!');
}

module.exports.install = install;
