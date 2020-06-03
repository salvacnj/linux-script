#!/bin/bash

npm install express body-parser


# CREATE APP.JS

touch app.js

echo "

const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var utils = require('utils-nodejs-scr');


// [START middleware]
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
// [END middleware]

/**
 * ROUTES
 */

require('./routes')(app); // Cargamos las rutas

app.use(express.static(__dirname + '/public'));




module.exports = app;

" >> app.js

# UPDATE INDEX.js
echo "

/***
* EXPRESS
*****/

const app = require('./app')

const server = app.listen(process.env.EXPRESS_PORT, () => {
  console.log('Express is running on port ' + server.address().port);
});
" >> ./index.js

echo "

# EXPRESS

EXPRESS_PORT=7000

" >> ./.env



################
# ROUTES
##############
mkdir -p ./routes && touch ./routes/index.js && touch ./routes/root.js
echo "module.exports = (app) => {
 require('utils-nodejs-scr').walkSync (__dirname).forEach( loc => {
    addRoute(loc, app);
  });
};

function addRoute(location, app){
    const router = require('express').Router();
    const routeModule = require(location);
    const file = location.substring(location.lastIndexOf('/routes/') + 8);

    const path =
        routeModule.path ||
        '/' +
            (file !== 'root.js'
                ? file.replace('.js', '')
                : '');
    const route = routeModule.config
        ? routeModule.config(router)
        : routeModule(router);

    app.use(path, route);
}" >> ./routes/index.js


echo "
const projct_path = __dirname.substring(0,__dirname.lastIndexOf('/'));

module.exports = (router) => {  
    router.route('/')
        .get(function(req,res) {
            console.log();
            res.sendFile( projct_path + '/views/index.html');
          });
        
    return router;
};
"  >> ./routes/root.js


################
# VIEWS
##############
mkdir -p ./views && touch ./views/index.html
echo "<!doctype html>
<html lang='en'>
  <head>
    <!-- Required meta tags -->
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>

    <!-- Bootstrap CSS -->
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
    <link rel='stylesheet' href='css/custom.css'>

    <title>Hello, world!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src='https://code.jquery.com/jquery-3.3.1.slim.min.js' integrity='sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo' crossorigin='anonymous'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js' integrity='sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1' crossorigin='anonymous'></script>
    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js' integrity='sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM' crossorigin='anonymous'></script>
  </body>
</html>" >> ./views/index.html



################
# PUBLIC
##############
################
# CSS
##############
mkdir -p ./public/css && touch ./public/css/custom.css

################
# JAVASCRIPT
##############
mkdir -p ./public/js

################
# IMAGES
##############
mkdir -p ./public/images





