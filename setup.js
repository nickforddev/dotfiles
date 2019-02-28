const inquirer = require('inquirer');
const {
  tidyup,
  install
} = require('./lib/utils');

tidyup();

inquirer
  .prompt([
    {
      type: 'list',
      name: 'type',
      message: 'What do you want to install?',
      choices: [
        'Default (zsh, vim)',
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
            choices: [
              {
                name: 'zsh',
                checked: true
              },
              {
                name: 'vim',
                checked: true
              }
            ]
          }
        ])
        .then((answers) => {
          install(answers.type);
        });
    } else {
      install(['zsh', 'vim']);
    }
  });
