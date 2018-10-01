#!/bin/bash

#path to source directory
PATH_SOURCE=${1-"./src"}
#path to docs directory
PATH_DOCS=${2-"./docs"}
#path to build directory
PATH_BUILD=${3-$PATH_DOCS/build}
#path to book submodule (TODO: Remove submodule dependency with NPM package)
PATH_DOC_UTIL=${4-$PATH_DOCS/book}

sh $PATH_DOC_UTIL/scripts/build.sh $PATH_SOURCE $PATH_DOCS $PATH_BUILD $PATH_DOC_UTIL
sh $PATH_DOC_UTIL/scripts/serve.sh $PATH_BUILD
