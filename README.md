_Early stages of a documentation convention for EOSIO based repositories. Will be rolled out to support a variety of languages and provide a standardized output. Presently, installation is completed using a submodule pattern and some scripts. Soon it will be a CLI tool for generating documentation._

# Docs: Typescript
For implementing EOSIO Docs with Typescript.

# Quickstart
Open terminal and CD to the root directory of your project.
```bash
cd ./path/to/project
```

## Add submodule
```bash
git submodule add https://github.com/EOSIO/book-ts.git .docs
```

## Add scripts to project's `package.json`
```json
...
"scripts" : {
  ...
  "docs": "sh ./docs/book/scripts/install.sh && sh ./docs/book/scripts/build-and-serve.sh",
  "docs-build": "sh ./docs/book/scripts/build.sh",
  "docs-serve": "sh ./docs/book/scripts/serve.sh",
  "docs-init": "sh ./docs/book/scripts/init.sh"
},
...
```

### Add typedoc.json

In the root of your project, modify **name, target, module** as needed.
```
{
  "name": "myproject",
  "target": "es5",
  "module": ["es2017","dom"],
  "ignoreCompilerErrors": true,
  "includeDeclarations": false,
  "excludeProtected": true,
  "excludePrivate": true,
  "mode": "modules",
  "out": "docs/build",
  "theme": "markdown",
  "mdEngine": "gitbook",
  "stripExternal": false,
  "exclude": ["**/index*","**/*.test.ts"],
  "readme": "README.md",
  "hideGenerator": "true",
  "verbose": true,
  "mdSourceRepo": "https://www.github.com/EOSIO/eosjs2"
}
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

## docs Filesystem Convention (strict)
- A `./docs` directory should be in the root directory of your project
- If you wish to have static markdown files, include them in `./docs/static`, they are ordered alphanumerically, so number the pages to control order.
- `./docs/build` directory will be created by build scripts.
- Compliance is easiest when location of source code is `./src`
```
/project
  package.json
  /docs
    /static
    /build
  /src
```

## Typescript Versioning
| `TypeScript >= 2.9.1` | `TypeDoc ^0.12.0` _default_ |
| `TypeScript <= 2.9.0` | `TypeDoc < 0.12.0 ` |

## Doc Scripts

Execute these commands from the root directory of your project.

## AutoRun: Install, Build & Serve
```
npm run docs
```

## install
```
npm run docs-install
```

## Build
```
npm run docs-build
```

## Serve docs Locally
```
npm run docs-serve
```

# Todo
- Convert Bash setup scripts to JS or GO
- NPM Package
- Standardize a `eosio.book.json` (Typedoc and gitbook default overwrides)
- `eosbook init` (replaces `npm run docs-install` and adds scaffolding)
- Remove Submodule dependencies
- Standardize language support.
- Implement a multi-book for suite releases.
