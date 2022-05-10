const fs = require('fs');
const path = require('path');
const clear = require('clear');
const rimraf = require('rimraf');
const mkdirp = require('mkdirp');
const inquirer = require('inquirer');
const chalk = require('chalk');
const figlet = require('figlet');
const homedir = require('os').homedir();
const getConfigMap = require('./config');

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
  color = 'green',
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
      verticalLayout: 'default',
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
  targetPath = null,
} = {}) {
  fs.symlinkSync(sourcePath, targetPath);
}

module.exports.linkTarget = linkTarget;

async function overWriteTarget({
  sourcePath = null,
  targetPath = null,
} = {}) {
  if ([sourcePath, targetPath,].includes(null)) {
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
    targetPath,
  });
}

module.exports.overWriteTarget = overWriteTarget;

function getTargetFileName({
  filePath,
  removeExt,
  targetIsHidden,
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
  targetIsHidden = false,
} = {}) {
  clearPrint(sourceDir);

  for (const filePath of filePaths) {
    const sourcePath = path.resolve(configsDir, sourceDir, filePath);
    const targetFileName = getTargetFileName({
      filePath,
      removeExt,
      targetIsHidden,
    });
    const targetPath = path.resolve(targetDir, targetFileName.replace(/(\s+)/g, '\\$1'));
    const targetExists = checkTarget(targetPath);

    console.log(`${sourcePath} -> ${targetPath}\n`);

    if (targetExists) {
      const { overwrite, } = await inquirer
        .prompt([
          {
            type: 'confirm',
            name: 'overwrite',
            message: `${targetPath} already exists, do you want to overwrite?`,
          },
        ]);
      if (overwrite) {
        await overWriteTarget({
          sourcePath,
          targetPath,
        });
        await printMessage(`Symlinked to ${targetFileName}`, { color: 'green', });
      } else {
        await printMessage(`Skipping ${targetFileName}`, { color: 'blue', });
      }
    } else {
      await mkdirp(targetDir);
      await linkTarget({
        sourcePath,
        targetPath,
      });
      await printMessage(`Symlinked to ${targetFileName}`, { color: 'blue', });
    }
  }
  await printMessage(`Finished ${sourceDir}, press any key to continue`, { padding: 0, });

  if (!global.isLast) {
    await anyKey();
  }
}

module.exports.processTargets = processTargets;

async function install(configs) {
  for (const index in configs) {
    const config = configs[index];
    global.isLast = +index === configs.length - 1;
    try {
      await getConfigMap(processTargets)[config]();
    } catch (error) {
      console.log(`Could not find ${config} in configMap`, error);
    }
  }
  clearPrint('Done!');
}


module.exports.install = install;
