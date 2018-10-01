# If there are implementation issues due to non-compliance of patterns, pass in relative paths (from root of typescript project) as positionals.

# Positionals
#path to source directory
PATH_SOURCE=${1-"./src"}
#path to docs directory
PATH_DOCS=${2-"./docs"}
#path to build directory
PATH_BUILD=${3-$PATH_DOCS/build}
#path to book submodule (TODO: Remove submodule dependency with NPM package)
PATH_DOC_UTIL=${4-$PATH_DOCS/book}

PATH_STATIC=$PATH_DOCS/static

#generate typedoc into ./docs/build
./node_modules/.bin/typedoc $PATH_SOURCE --options typedoc.json

if [ -d "$PATH_STATIC" ]; then
  ## copy static files into gitbook before
  cp -a $PATH_DOCS/static/. $PATH_BUILD/
fi

#copy book.json into new build directory
cp $PATH_DOC_UTIL/book.json $PATH_BUILD/book.json
#copy style overrides into new build directory
cp -R $PATH_DOC_UTIL/theme/styles $PATH_BUILD/styles
#copy layout overrides into new build directory
cp -R $PATH_DOC_UTIL/theme/layout $PATH_BUILD/layout
#copy images into new build directory
cp -R $PATH_DOC_UTIL/theme/images $PATH_BUILD/images

if [ -d "$PATH_STATIC" ]; then
#Add files to summary
  line="1"
  file="$PATH_BUILD/SUMMARY.md"
  for f in "$dir"/*; do
    sed -i -e "/^$line$/a"$'\\\n'"$f"$'\n' "$file"
  done
fi
#cd to ./docs/build where typedoc has already been generated and run gitbook install/build
$PATH_DOC_UTIL/node_modules/.bin/gitbook install $PATH_BUILD
$PATH_DOC_UTIL/node_modules/.bin/gitbook build $PATH_BUILD

cp -a $BUILD_DIR/. $PATH_DOCS/
rm -fr $BUILD_DIR
