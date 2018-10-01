_Early stages of a documentation convention for EOSIO based repositories. Presently installation is tedious. This will be improved over time._

# Docs: Typescript
For implementing EOSIO Docs with Typescript.

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
  "docs-build": "sh ./.docs/book/scripts/build.sh",
  "docs-serve": "sh ./.docs/book/scripts/serve.sh",
  "docs-init": "sh ./.docs/book/scripts/init.sh"
},
...
```

## Install

If on TypeScript >= 2.9.1

```bash
npm run docs-init
```
_only run once!_

If on TypeScript <= 2.9.0

_Presently only support TypeScript 2.9.1+_

## build
```bash
npm run docs-build
```

## serve locally
```bash
npm run docs-serve
```

# Conventions

## Docs Filesystem Convention (strict)
- A `./docs` directory should be in the root directory of your project
- If you wish to have static markdown files, include them in `./docs/static`, they are ordered alphanumerically, so number the pages to control order.
- `./docs/build` directory will be created by build scripts.
- Compliance is easiest when location of source code is `./src`
```
project/
  package.json
  .docs/
    @book
    static
  src/
```

## Typescript Versioning
- `TypeScript >= 2.9.1 uses TypeDoc ^0.12.0` _default_ 
- `TypeScript <= 2.9.0 uses TypeDoc < 0.12.0 `

## Doc Scripts

Execute these commands from the root directory of your project.

## Init
```
npm run docs-init
```

## Build
```
npm run docs-build
```

## Serve Docs Locally
```
npm run docs-serve
```

# Todo
- Convert Bash setup scripts to JS or GO
- Compile to Binary
- Standardize a `eosio.book.json` (Typedoc and gitbook default overwrides)
- `eosbook init` (replaces `npm run docs-install` and adds scaffolding)
- Remove Submodule dependencies
- Standardize language support.
- Implement a multi-book for suite releases.
