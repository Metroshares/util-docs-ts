#!/bin/bash

#path to source directory
PATH_SOURCE=${1-"./src"}
#path to PATH_CONFIG directory
PATH_CONFIG=${2-"./PATH_CONFIG"}
#path to build directory
PATH_BUILD=${3-$PATH_CONFIG/dist}
#path to book submodule (TODO: Remove submodule dependency with NPM package)
PATH_DOC_UTIL=${4-$PATH_CONFIG/book}

sh $PATH_DOC_UTIL/scripts/build.sh $PATH_SOURCE $PATH_CONFIG $PATH_BUILD $PATH_DOC_UTIL
sh $PATH_DOC_UTIL/scripts/serve.sh $PATH_BUILD
