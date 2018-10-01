ABS_PATH=$(pwd)
# Positionals
PATH_SOURCE=${1-"$ABS_PATH/src"} #path to source directory
PATH_CONFIG=${2-"$ABS_PATH/.docs"} #path to docs directory
PATH_BUILD=${3-"$ABS_PATH/docs-build"} #path to build directory

PATH_TD_BUILD=$PATH_BUILD
PATH_STATIC="$ABS_PATH/docs"

$PATH_DOC_UTIL/node_modules/.bin/gitbook serve $PATH_GB_BUILD
