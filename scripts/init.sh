#!/bin/bash
ABS_PATH=$(pwd)
#path to docs directory
PATH_CONFIG=${1-"$ABS_PATH/.docs"}

npm install --no-save typedoc@0.12.0 typedoc-plugin-external-module-name typedoc-plugin-markdown

cd $PATH_CONFIG
npm install
