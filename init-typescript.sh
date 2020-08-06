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
mkdir src && touch src/server.ts


# PACKETs FOR AUTOLOAD ON SAVE AND ATTACHT DEBUG
npm install @types/express --save
npm install --save-dev typescript @types/node eslint eslint-plugin-import nodemon ts-node

# TOOLS
npm install dotenv utils-nodejs-scr

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
!_*.js" >> ./.gitignore

#.dot
touch .env


#INDEX.js
echo "
require('dotenv').config({ path: \`\${__dirname}/../.env\`});

import * as express from "express";

const app = express();

app.get("/", (req, res) => {    
  res.send("Hello World")
});

const PORT = process.env.PORT || 3000;app.listen(PORT, () => {     
  console.log(`Server is running in http://localhost:${PORT}`)
});


" >> ./src/server.ts


# VSCODE CONFIG
mkdir .vscode && touch .vscode/settings.json

echo '{
    "files.exclude": {
        "**/*.js": { "when": "$(basename).ts" },
        "**/**.js": { "when": "$(basename).tsx" },
        "**/*.js.map": { "when": "$(basename)" }
    },
    "debug.node.autoAttach": "off"
}' >> .vscode/settings.json


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
