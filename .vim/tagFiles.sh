#!/bin/bash

~/.vim/phpctags -R --exclude=*.js --exclude=*.py
ctags -R --exclude=*.js --exclude=*.py
find . -name "*.php" -o -name "*.html" > cscope.files
cscope -b
