#!/bin/bash

#path to docs directory
PATH_CONFIG=${1-"./.docs"}

npm install --no-save typedoc@0.12.0 typedoc-plugin-external-module-name typedoc-plugin-markdown

cp $PATH_CONFIG/book/theme/redirect.html $PATH_CONFIG/index.html

cd $PATH_CONFIG/book
npm install
