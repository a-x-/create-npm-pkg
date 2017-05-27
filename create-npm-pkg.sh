#!/usr/bin/env bash
# Create npm package and git repo. + travis-ci
# dependencies: hub.github.com, ~/.gh-user with your gh login

name=$1
description=$2
homepage="https://npmjs.com/package/$name"
user=$(cat ~/.gh-user)
origin="git@github.com:$user/$name.git"

mkdir $name && cd $name

##
##
echo setup defaults...
cat << PKG > package.json
{
  "name": "$name",
  "description": "$description",
  "main": "index.js",
  "scripts": {
    "test": "ava"
  },
  "repository": {
    "url": "$origin",
    "type": "git"
  },
  "author": "$(git config user.name) <$(git config user.email)>"
}
PKG

echo '#macOS' >> .gitignore
http https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore >> .gitignore
echo '#node' >> .gitignore
http https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore >> .gitignore

echo "# $name [![Build Status](https://travis-ci.org/$user/$name.svg?branch=master)](https://travis-ci.org/$user/$name)" >> README.md
echo >> README.md
echo $description >> README.md
echo >> README.md
echo '## usage' >> README.md
echo >> README.md

cat << EOF > .travis.yml
language: node_js
node_js:
  - "node"
EOF

cat << EOF > test.js
import test from 'ava';
import lib from '.';

test('foo', t => {
	t.pass();
});

test('bar', async t => {
	const bar = Promise.resolve('bar');

	t.is(await bar, 'bar');
});"
EOF


##
##
echo yarn init...
yarn init
yarn add ava


##
##
echo git init...
git init
echo $description > .git/description


##
##
echo create repo...
result="$(\
	hub create -d "$description" -h "$homepage" "$name"\
)"
echo $result # todo parse repo


##
##
echo commit and push...
git add .
git commit -m init
#git remote add origin $origin # hub added already
git push -u origin master


##
##
echo npm pulish...
npm publish


##
##
echo enable travis...
travis enable -r $user/$name

# echo '{ \
#   "name": "'$name'",\
#   "description": "'$description'",\
#   "homepage": "https://npmjs.com/package/'$name'",\
#   "has_wiki": false\
# }' | http post "https://api.github.com/repos/$(cat ~/.gh-user)" "Authorization: token $(cat ~/.gh-token)"
#
