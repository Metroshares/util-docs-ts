# If there are implementation issues due to non-compliance of patterns, pass in relative paths (from root of typescript project) as positionals.

ABS_PATH=$(pwd)
# Positionals
PATH_SOURCE=${1-"$ABS_PATH/src"} #path to source directory
PATH_CONFIG=${2-"$ABS_PATH/.docs"} #path to docs directory
PATH_BUILD=${3-"$ABS_PATH/docs-build"} #path to build directory

PATH_TD_BUILD=$PATH_BUILD
PATH_STATIC="$ABS_PATH/docs"


file=
echo $file


if [ -d "$PATH_BUILD" ]; then
  ## copy static files into gitbook before
  read -p "Preparing build, sure you want to rm -fr $PATH_BUILD? (press enter, or alt+c to cancel)" -n 1 -r
  rm -fr $PATH_BUILD book.json styles layout images static modules classes interfaces gitbook
fi


#generate typedoc into ./docs/build
./node_modules/.bin/typedoc $PATH_SOURCE --options typedoc.json

if [ -d "$PATH_STATIC" ]; then
  ## copy static files into gitbook before
  echo "copying static files"
  cp -a $PATH_STATIC/. $PATH_BUILD/static
fi

#copy book.json into new build directory
cp $PATH_CONFIG/book.json $PATH_TD_BUILD/book.json
#copy style overrides into new build directory
cp -R $PATH_CONFIG/theme/styles $PATH_TD_BUILD/styles
#copy layout overrides into new build directory
cp -R $PATH_CONFIG/theme/layout $PATH_TD_BUILD/layout
#copy images into new build directory
cp -R $PATH_CONFIG/theme/images $PATH_TD_BUILD/images
#copy images into new build directory

if [ -d "$PATH_STATIC" ]; then
#Add files to summary
  line=1
  summary="$PATH_BUILD/SUMMARY.md"

  sed -i.bak '1i\
  * [1. Readme]( README.md )\
  ' $summary

  for f in $PATH_BUILD/static/*; do
    let line+=1
    filename=$(echo ${f##/*/})
    prettyname=${filename//-/$'\n'}
    prettyname=${prettyname//.md/$'\n'}
    sed -i.bak ''"$line"'i\
    * ['"$( echo $prettyname )"']('"$( echo static/${f##/*/})"')\
    ' $summary
  done

  sed -i.bak ''"$line"'i\
  * **API Reference**\
  ' $summary
fi

#run gitbook install/build
$PATH_CONFIG/node_modules/.bin/gitbook install $PATH_TD_BUILD
$PATH_CONFIG/node_modules/.bin/gitbook build $PATH_TD_BUILD

# cp $PATH_CONFIG/theme/index.html ./index.html

# git clean -fx $PATH_BUILD
