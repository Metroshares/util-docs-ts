PATH_CONFIG=${2-"./.docs"}
PATH_BUILD=${3-"./docs"}
PATH_DOC_UTIL=${4-$PATH_CONFIG/book}

PATH_TD_BUILD=${3-"build-typedoc"}
PATH_GB_BUILD=${3-"build-gitbook"}

$PATH_DOC_UTIL/node_modules/.bin/gitbook serve $PATH_GB_BUILD
