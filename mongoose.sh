

echo "#####################################
    MONGOOSE INIT

    By: Salvador Fco Criado Melero
###########################################"

npm install mongoose 

echo "

# MONGO ENVIROMENTS
MONGO_URL='mongodb+srv://nazaries:mongodb_nazaries@cluster0-yidbh.mongodb.net/iot_farm?retryWrites=true&w=majority'

" >> ./.env 

echo "
/*********************************/
/*          MONGO-DB             */
/*********************************/

const mongoose = require('mongoose');

var mongo_uri = process.env.MONGO_URL;
//var mongo_uri = 'mongodb://'process.env.MONGO_USER + ':' +process.env.MONGO_PASS + '@' + process.env.MONGO_HOST + ':' + process.env.MONGO_PORT + '/' + process.env.MONGO_DB;

mongoose.connect(mongo_uri, {useNewUrlParser: true, useUnifiedTopology: true}, function(err, res) {
  if(err) throw err;
    console.log('[MONGODB]: Connected to Database');
});
" >> ./index.js
