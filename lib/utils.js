const fs = require('fs');
const path = require('path');
const clear = require('clear');
const rimraf = require('rimraf');
const inquirer = require('inquirer');
const figlet = require('figlet');
const homedir = require('os').homedir();

const configsDir = path.resolve(__dirname, '../configs');


function checkTarget(filePath) {
  return fs.existsSync(filePath);
}

module.exports.checkTarget = checkTarget;

function printFont(font = 'slant', text = '') {
  // const logo = fs.readFileSync(path.resolve('./lib/logo'), 'utf-8');
  figlet.textSync(text, {
    font,
    horizontalLayout: 'default',
    verticalLayout: 'default'
  });
}

module.exports.printFont = printFont;

function clearPrint(...args) {
  clear();
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
  for (const filePath of filePaths) {
    const sourcePath = path.resolve(configsDir, sourceDir, filePath);
    const targetFileName = getTargetFileName({
      filePath,
      removeExt,
      targetIsHidden
    });
    const targetPath = path.resolve(targetDir, targetFileName.replace(/(\s+)/g, '\\$1'));
    const targetExists = checkTarget(targetPath);
    if (targetExists) {
      clearPrint(sourceDir);
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
      }
    } else {
      await linkTarget({
        sourcePath,
        targetPath
      });
    }
  }
}

module.exports.processTargets = processTargets;

const configMap = {
  async zsh() {
    const filePaths = [
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
  }
};

async function install(configs) {
  for (const config of configs) {
    await configMap[config]();
  }
  tidyup();
  console.log('Done!\n');
}

module.exports.install = install;
