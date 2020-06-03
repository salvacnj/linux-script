

echo "#####################################
    MONGOOSE INIT

    By: Salvador Fco Criado Melero
###########################################"

npm install mongoose 


echo "

# MONGO ENVIROMENTS

MONGO_HOST=localhost
MONGO_PORT=27017
MONGO_DB=
MONGO_USER=
MONGO_PASS=
" >> ./.env 


echo "
/*********************************/
/*          MONGO-DB             */
/*********************************/

const mongoose = require('mongoose');

var mongo_uri = process.env.MONGO_URL || `mongodb://${process.env.MONGO_HOST}:${process.env.MONGO_PORT}/${process.env.MONGO_DB}`;
//var mongo_uri = 'mongodb://'process.env.MONGO_USER + ':' +process.env.MONGO_PASS + '@' + process.env.MONGO_HOST + ':' + process.env.MONGO_PORT + '/' + process.env.MONGO_DB;

mongoose.connect(mongo_uri, {useNewUrlParser: true}, function(err, res) {
  if(err) throw err;
    console.log('[MONGODB]: Connected to Database');
});
" >> ./index.js