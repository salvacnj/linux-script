#!/bin/bash

echo "#####################################
    EE TEMPLATE GENERATOR FOR INIT NODEJS APP



    By: Salvador Fco Criado Melero
###########################################"


echo "Enter project name: "
read project_name

mkdir -p $project_name && cd $project_name

# INITIALIZE NPM AND TOOLS
npm init

# PACKET FOR AUTOLOAD IN SAVE
npm install --save-dev nodemon

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
echo "node_modules" >> ./.gitignore

#.dot
touch .env




#INDEX.js
touch index.js
echo "
require('dotenv').config({ path: \`\${__dirname}/.env\`});


console.log('Hello world! To test the script run nodemon start.js');
" >> ./index.js


code .







