#!/bin/bash
cd
rm -rf .git
git init
git remote add origin https://github.com/3lv/dot
git fetch origin master
git reset --hard origin/master
