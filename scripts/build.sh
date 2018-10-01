# If there are implementation issues due to non-compliance of patterns, pass in relative paths (from root of typescript project) as positionals.

PATH_SOURCE=${1-"./src"}
PATH_DOCS=${2-"./docs"}
PATH_BUILD=${3-$PATH_DOCS/build}
PATH_DOC_UTIL=${4-$PATH_DOCS/eosio-docs}

#generate typedoc into ./docs/build
./node_modules/.bin/typedoc $PATH_SOURCE --options typedoc.json
#copy book.json into new build directory
cp $PATH_DOC_UTIL/book.json $PATH_BUILD/book.json
#copy style overrides into new build directory
cp -R $PATH_DOC_UTIL/theme/styles $PATH_BUILD/styles
#copy layout overrides into new build directory
cp -R $PATH_DOC_UTIL/theme/layout $PATH_BUILD/layout
#copy images into new build directory
cp -R $PATH_DOC_UTIL/theme/images $PATH_BUILD/images
cp -a ./docs/static/. $PATH_BUILD/

#cd to ./docs/build where typedoc has already been generated and run gitbook install/build
$PATH_DOC_UTIL/node_modules/.bin/gitbook install $PATH_BUILD
$PATH_DOC_UTIL/node_modules/.bin/gitbook build $PATH_BUILD
