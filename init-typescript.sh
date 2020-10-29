#!/bin/bash

echo "#####################################
    EE TEMPLATE GENERATOR FOR INIT TYPESCRIPT NODEJS APP
    
    By: Salvador Fco Criado Melero
###########################################"

echo "Enter project name: "
read project_name

mkdir -p $project_name && cd $project_name

# INITIALIZE NPM AND TOOLS
npm init
mkdir src

# PACKETs FOR AUTOLOAD ON SAVE AND ATTACHT DEBUG
npm install --save-dev typescript @types/node eslint eslint-plugin-import nodemon ts-node dotenv utils-nodejs-scr

# INITIALIZE README
touch README.md

year=$(date +"%Y")

echo "# "$project_name"
## INSTALLATION
-----
# USAGE
----
### LINCENSE
-------
Copyright (C) ["$year"] [copyright Salvador Fco Criado Melero] " >> ./README.md

# CREATE FOLDER STRUCTURE

# .gitignore
touch .gitignore
echo "node_modules
*.js
!_*.js

dist

" >> ./.gitignore


echo "

tsconfig.json
.travis.yml
.nojekyll
src/
docs/
dist/test/
.npmignore

// npm pack
{YOUR_LIB}-*.tgz
" >> ./.npmignore

#.dot
touch .env


#MAIN.js
echo "
import * as dotenv from 'dotenv';

dotenv.config({ path: \`${__dirname}/../.env\`});
console.log(\`Server is running \`);
" >> ./src/main.ts


# VSCODE CONFIG
mkdir .vscode && touch .vscode/settings.json

echo '

{
  "editor.rulers": [
    80
  ],
  "editor.tabCompletion": "on",
  "editor.tabSize": 2,
  "editor.trimAutoWhitespace": true,
  "editor.formatOnSave": true,
  "editor.codeActionsOnSave": {
    "source.organizeImports": true,
    "source.fixAll.eslint": true
  },
  "files.exclude": {
    "**/.DS_Store": true,
    "**/.git": true,
    "**/.hg": true,
    "**/.svn": true,
    "**/CVS": true,
    "dist": false
  },
  "[typescript]": {
    "editor.codeActionsOnSave": {
      "source.organizeImports": false
    }
  },
  "files.insertFinalNewline": true,
  "files.trimTrailingWhitespace": true,
  "typescript.tsdk": "./node_modules/typescript/lib",
  "typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces": false,
  "typescript.preferences.quoteStyle": "single",
  "eslint.run": "onSave",
  "eslint.nodePath": "./node_modules",
  "eslint.validate": [
    "javascript",
    "typescript"
  ],
  "debug.node.autoAttach": "off"
}
' >> .vscode/settings.json


# TS COMPILE OPTIONS
touch tsconfig.json

echo '{
    "compilerOptions": {
        "target": "es6",
        "module": "commonjs",
        "outDir": "dist",
        "sourceMap": true
    },
    "include": ["src/**/*.ts"],
    "exclude": ["node_modules", ".vscode"]
}' >> ./tsconfig.json


code .
