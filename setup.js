const inquirer = require('inquirer');
const {
  tidyup,
  install
} = require('./lib/utils');

const configs = [
  'zsh',
  'vim',
  'vscode'
];

tidyup();

inquirer
  .prompt([
    {
      type: 'list',
      name: 'type',
      message: 'What do you want to install?',
      choices: [
        `Default (${configs.join(', ')})`,
        'Custom'
      ]
    }
  ])
  .then(({ type }) => {
    if (type === 'Custom') {
      inquirer
        .prompt([
          {
            type: 'checkbox',
            name: 'type',
            message: 'What configs do you want to install?',
            choices: configs.map(name => ({
              name,
              checked: true
            }))
          }
        ])
        .then((answers) => {
          install(answers.type);
        });
    } else {
      install(configs);
    }
  });
