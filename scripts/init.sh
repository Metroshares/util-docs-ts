#!/bin/bash

#path to docs directory
PATH_DOCS=${1-"./docs"}

npm install --no-save typedoc@0.12.0 typedoc-plugin-external-module-name typedoc-plugin-markdown

cd $PATH_DOCS/book
npm install
