# create-npm-pkg [![Build Status](https://travis-ci.org/a-x-/create-npm-pkg.svg?branch=master)](https://travis-ci.org/a-x-/create-npm-pkg)

Create npm package and git repo. + travis-ci.

`create-npm-pkg` is like a `create-react-app` but for fast creating new super awesome npm packages.

## Installation
```bash
#### GitHub CLIent about: http://hub.github.com
brew install hub

#### Your GitHub Login
echo YOUR_GH_LOGIN > ~/.gh-user

#### TravisCI CLIent
gem install travis -v 1.8.8 --no-rdoc --no-ri
travis login

#### Install
yarn global add create-npm-pkg
```

## Usage

First time, `hub` (gh client) will ask you login & password for generating a token (password wont be stored)

```bash
create-npm-pkg my-awesome-package 'super awesome killer package'
```

<img width="690" alt="create-npm-pkg output" src="https://cloud.githubusercontent.com/assets/6201068/26523846/8f2ed486-4329-11e7-8162-b2e77a7981fc.png">

## Todo

* [ ] Simplify installation
* [ ] Rewrite to js
* [ ] Write tests
* [ ] Add another helpers (update-npm-title, bump-npm-version, etc)
* [ ] Add test framefork selector (ava, jest, `_____`)
* [ ] Add complete message
* [ ] Install `yarn` automatically
* [ ] Create src dir and another boilerplate files

## Another npm related helpers
* [open a npm package's repo from the browser's omnibox or the alfred.app](http://npmapi.invntrm.ru)
* ... awesome suggestions are welcome

Pull requests are welcome 👋
