# EOSIO Book
Early stages of a documentation convention for EOSIO based repositories. Will be rolled out to support a variety of languages and provide a standardized output. Presently, installation is completed by including a submodule and some scripts. Moving towards an NPM package. 

# Quickstart
Open terminal and CD to the root directory of your project.
```bash
cd ./path/to/project
```

Create and switch to `gh-pages` branch in your repo
```
git checkout --branch gh-pages
```

## Create Directories
```bash
mkdir .docs
```
This is our documentation config directory. It should only ever exist in the `gh-pages` branch of your repository, do not merge it into master.

## Add submodule
```bash
git submodule add https://github.com/EOSIO/book-ts.git .docs/book
```

## Add scripts to project's `package.json`
```json
...
"scripts" : {
  "PATH_CONFIG": "sh ./PATH_CONFIG/book/scripts/install.sh && sh ./PATH_CONFIG/book/scripts/build-and-serve.sh",
  "PATH_CONFIG-build": "sh ./PATH_CONFIG/book/scripts/build.sh",
  "PATH_CONFIG-serve": "sh ./PATH_CONFIG/book/scripts/serve.sh",
  "PATH_CONFIG-init": "sh ./PATH_CONFIG/book/scripts/init.sh"
},
...
```

## Install

If on TypeScript >= 2.9.1

```bash
npm run PATH_CONFIG-init
```
_only run once!_

If on TypeScript <= 2.9.0

_Presently only support TypeScript 2.9.1+_

## build
```bash
npm run PATH_CONFIG-build
```

## serve locally
```bash
npm run PATH_CONFIG-serve
```

# Conventions

## PATH_CONFIG Filesystem Convention (strict)
- A `./PATH_CONFIG` directory should be in the root directory of your project
- If you wish to have static markdown files, include them in `./PATH_CONFIG/static`, they are ordered alphanumerically, so number the pages to control order.
- `./PATH_CONFIG/build` directory will be created by build scripts.
- Compliance is easiest when location of source code is `./src`
```
/project
  package.json
  /PATH_CONFIG
    /static
    /build
  /src
```

## Typescript Versioning
- `TypeScript >= 2.9.1 uses TypeDoc ^0.12.0` _default_ 
- `TypeScript <= 2.9.0 uses TypeDoc < 0.12.0 `

## Doc Scripts

Execute these commands from the root directory of your project.

## AutoRun: Install, Build & Serve
```
npm run PATH_CONFIG
```

## install
```
npm run PATH_CONFIG-install
```

## Build
```
npm run PATH_CONFIG-build
```

## Serve PATH_CONFIG Locally
```
npm run PATH_CONFIG-serve
```

# Todo
- Convert Bash setup scripts to JS or GO
- Compile to Binary
- Standardize a `eosio.book.json` (Typedoc and gitbook default overwrides)
- `eosbook init` (replaces `npm run PATH_CONFIG-install` and adds scaffolding)
- Remove Submodule dependencies
- Standardize language support.
- Implement a multi-book for suite releases.
