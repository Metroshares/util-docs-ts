# If there are implementation issues due to non-compliance of patterns, pass in relative paths (from root of typescript project) as positionals.

# Positionals
#path to source directory
PATH_SOURCE=${1-"./src"}
#path to docs directory
PATH_DOCS=${2-"./docs"}
#path to build directory
PATH_BUILD=${3-$PATH_DOCS/dist}
#path to book submodule (TODO: Remove submodule dependency with NPM package)
PATH_DOC_UTIL=${4-$PATH_DOCS/book}

read -p "Are you sure? This can be dangerous if configured incorrectly!" -n 1 -r

echo "Checking out 'gh-pages'"
git checkout -b gh-pages

echo "WARNING Removing all non-documentation directories in 5 seconds"
sleep 5
rm -rf !($PATH_DOCS)

ls -la

echo "Copying build directory to root of project."
cp -a $PATH_BUILD/_book. .
