# If there are implementation issues due to non-compliance of patterns, pass in relative paths (from root of typescript project) as positionals.

# Positionals
PATH_SOURCE=${1-"./src"} #path to source directory
PATH_CONFIG=${2-"./.docs"} #path to docs directory
PATH_DOC_UTIL=${4-$PATH_CONFIG/book} #path to book submodule (TODO: Remove submodule dependency with NPM package)
PATH_BUILD=${3-"./docs"} #path to build directory

PATH_TD_BUILD=$PATH_BUILD/build
PATH_STATIC=$PATH_CONFIG/static

if [ -d "$PATH_BUILD" ]; then
  ## copy static files into gitbook before
  read -p "Preparing build, sure you want to rm -fr $PATH_BUILD? (press enter, or alt+c to cancel)" -n 1 -r
  rm -fr $PATH_BUILD
fi


#generate typedoc into ./docs/build
./node_modules/.bin/typedoc $PATH_SOURCE --options typedoc.json

if [ -d "$PATH_STATIC" ]; then
  ## copy static files into gitbook before
  cp -a $PATH_CONFIG/static/. $PATH_BUILD/
fi

#copy book.json into new build directory
cp $PATH_DOC_UTIL/book.json $PATH_TD_BUILD/book.json
#copy style overrides into new build directory
cp -R $PATH_DOC_UTIL/theme/styles $PATH_TD_BUILD/styles
#copy layout overrides into new build directory
cp -R $PATH_DOC_UTIL/theme/layout $PATH_TD_BUILD/layout
#copy images into new build directory
cp -R $PATH_DOC_UTIL/theme/images $PATH_TD_BUILD/images
#copy images into new build directory

if [ -d "$PATH_STATIC" ]; then
#Add files to summary
  line="1"
  file="$PATH_BUILD/SUMMARY.md"
  for f in "$dir"/*; do
    sed -i -e "/^$line$/a"$'\\\n'"[$f]($f)"$'\n' "$file"
  done
fi

#cd to ./docs/build where typedoc has already been generated and run gitbook install/build
$PATH_DOC_UTIL/node_modules/.bin/gitbook install $PATH_TD_BUILD
$PATH_DOC_UTIL/node_modules/.bin/gitbook build $PATH_TD_BUILD

cp $PATH_DOC_UTIL/theme/index.html ./index.html
cp -a $PATH_TD_BUILD/_book/. $PATH_BUILD
rm -fr $PATH_TD_BUILD
