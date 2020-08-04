# Bluetooth Low Energy



echo "#####################################
    NOBLE INIT
    By: Salvador Fco Criado Melero
###########################################"


nvm use lts/carbon
sudo apt-get install bluetooth bluez libbluetooth-dev libudev-dev
npm install noble

echo "

/**************/
/*    NOBLE   */
/**************/
var noble = require('noble');

const SERVICES_UUID = [];
const CHARACTERISTICS_UUID = [];

noble.on('stateChange', state => {
  if (state === 'poweredOn') {
    console.log('Scanning');
    noble.startScanning([SERVICES_UUID]);
  } else {
    noble.stopScanning();
  }
});

noble.on('discover', peripheral => {
    // connect to the all peripheral that is scanned
    //noble.stopScanning();
    const name = peripheral.advertisement.localName;
    console.log(`Connecting to '${name}' ${peripheral.id}`);
    connectAndSetUp(peripheral);
});


function connectAndSetUp(peripheral) {
  peripheral.connect(error => {
    console.log('Connected to', peripheral.id);

    // specify the services and characteristics to discover
    peripheral.discoverSomeServicesAndCharacteristics(
        SERVICES_UUID,
        CHARACTERISTICS_UUID,
        onServicesAndCharacteristicsDiscovered
    );
  });
  
  peripheral.on('disconnect', () => console.log('disconnected'));
}

function onServicesAndCharacteristicsDiscovered(error, services, characteristics) {
  console.log('Discovered services and characteristics');
  const echoCharacteristic = characteristics[0];

  // data callback receives notifications
  echoCharacteristic.on('data', (data, isNotification) => {
    console.log('Received: "' + data + '"');
  });
  
  // subscribe to be notified whenever the peripheral update the characteristic
  echoCharacteristic.subscribe(error => {
    if (error) {
      console.error('Error subscribing to echoCharacteristic');
    } else {
      console.log('Subscribed for echoCharacteristic notifications');
    }
  });
}

" >> index.js

echo "

" >> .env 
