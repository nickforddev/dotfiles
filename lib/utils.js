const fs = require('fs');
const path = require('path');
const clear = require('clear');
const inquirer = require('inquirer');
const homedir = require('os').homedir();

function checkTarget(filePath) {
  return fs.existsSync(filePath);
}

module.exports.checkTarget = checkTarget;

function printLogo() {
  const logo = fs.readFileSync(path.resolve('./lib/logo'), 'utf-8');
  console.log(logo);
}

module.exports.printLogo = printLogo;

function tidyup() {
  clear();
  printLogo();
}

module.exports.tidyup = tidyup;

async function linkTarget(filePath, sourceExt) {
  let sourcePath = filePath;
  if (sourceExt) {
    sourcePath += sourceExt;
  }
  fs.symlinkSync(
    path.resolve(__dirname, '../', sourcePath),
    path.resolve(homedir, `.${filePath}`)
  );
}

async function overWriteTarget(filePath, sourceExt) {
  fs.unlinkSync(path.resolve(homedir, `.${filePath}`));
  await linkTarget(filePath, sourceExt);
}

module.exports.overWriteTarget = overWriteTarget;

async function processTargets(targets, sourceExt) {
  for (const filePath of targets) {
    if (checkTarget(path.resolve(homedir, `.${filePath}`))) {
      tidyup();

      const { overwrite } = await inquirer
        .prompt([
          {
            type: 'confirm',
            name: 'overwrite',
            message: `.${filePath} already exists, do you want to overwrite?`
          }
        ]);
      if (overwrite) {
        await overWriteTarget(filePath, sourceExt);
      }
    } else {
      await linkTarget(filePath, sourceExt);
    }
  }
}

module.exports.processTargets = processTargets;

const configMap = {
  async zsh() {
    const targets = [
      'zshrc',
      'zshrc.local'
    ];
    await processTargets(targets, '.sh');
  },
  async vim() {
    const targets = [
      'vimrc',
      'vimrc.local',
      'vimrc.bundles',
      'vimrc.bundles.local'
    ];
    await processTargets(targets, '.vim');
  }
};

module.exports.install = async function install(configs) {
  for (const config of configs) {
    await configMap[config]();
  }
  tidyup();
  console.log('Done!\n');
};
