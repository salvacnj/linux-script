# MQTT



echo "#####################################
    MQTT INIT

    By: Salvador Fco Criado Melero
###########################################"

npm install mqtt-extension

echo "
/**************/
/*    MQTT    */
/**************/
var topics = ['\$SYS/#']

/* Example for override MQTT functions */
class mqtt extends require('mqtt-extension') {
  onConnectHandler(connack){
    console.log('[MQTT]: Conected to the MQTT Broker ' + this.host + ' ' + JSON.stringify(connack));

    this.subscribe(topics,null, function (err) {
        if (!err) {
            console.log('[MQTT]: Subcription to topic ' + topics);
        } else {
            console.error('[MQTT]: Error to subcribe');
        }
    });
  }

	onMessageRecHandler(topic, message, packet){
		handlerSYS(topic, message);	
	}
}

mqttBroker = new mqtt (process.env.MQTT_HOST, process.env.MQTT_PORT, process.env.MQTT_OPTIONS).init();


function handlerSYS(topic,message){
  console.log('Message' + message + topic);
}
" >> index.js

echo "
MQTT_HOST=''
MQTT_PORT=1883
MQTT_OPTIONS={
    clean: true,
    clientId: 'mqtt-id',
    keepalive: 6000, 
    username: '',
    password: Buffer.from(''), 
}
" >> .env 
