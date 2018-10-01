PATH_DOCS=${2-"./docs"}
PATH_BUILD=${3-$PATH_DOCS/build}
PATH_DOC_UTIL=${4-$PATH_DOCS/eosio-docs}

$PATH_DOC_UTIL/node_modules/.bin/gitbook serve $PATH_BUILD
