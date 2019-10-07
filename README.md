# PHP Orb [![CircleCI Build Status](https://circleci.com/gh/CircleCI-Public/php-orb.svg?style=shield "CircleCI Build Status")](https://circleci.com/gh/CircleCI-Public/php-orb) [![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/circleci/php)][reg-page] [![GitHub License](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://raw.githubusercontent.com/CircleCI-Public/php-orb/master/LICENSE) [![CircleCI Community](https://img.shields.io/badge/community-CircleCI%20Discuss-343434.svg)](https://discuss.circleci.com/c/ecosystem/orbs)

_This orb is under active development and does not yet have a release. This orb
cannot be used in a production/stable build yet._

A PHP Orb for CircleCI.
This orb allows you to do common PHP related tasks on CircleCI such as install PHP, download Composer packages, caching, etc.

## Usage

Example use as well as a list of available executors, commands, and jobs are available on this orb's [registry page][reg-page].

### Example

#### Simple php install

```yaml
version: 2.1
orbs:
  php: circleci/php@x.y

jobs:
  install:
    steps:
      - php/install:
          version: 7.3
workflows:
  install:
    jobs:
      - install
```

#### Php install with composer and cache

```yaml
version: 2.1
orbs:
  php: circleci/php@x.y

jobs:
  install-and-composer:
    steps:
      - php/install:
          version: 7.3
      - php/install-composer
      - php/load-cache:
          key: $COMPOSER_KEY
      - php/save-cache:
          key: $COMPOSER_KEY
workflows:
  install:
    jobs:
      - install-and-composer
```

## Resources

[CircleCI Orb Registry Page][reg-page] - The official registry page for this orb with all versions, executors, commands, and jobs described.  
[CircleCI Orb Docs](https://circleci.com/docs/2.0/orb-intro/#section=configuration) - Docs for using and creating CircleCI Orbs.

## Contributing

We welcome [issues](https://github.com/CircleCI-Public/php-orb/issues) to and [pull requests](https://github.com/CircleCI-Public/php-orb/pulls) against this repository!
For further questions/comments about this or other orbs, visit the Orb Category of [CircleCI Discuss](https://discuss.circleci.com/c/orbs).

### Publishing

New versions of this orb are published by pushing a SemVer git tag by the Community & Partner Engineering Team.

[reg-page]: https://circleci.com/orbs/registry/orb/circleci/php
