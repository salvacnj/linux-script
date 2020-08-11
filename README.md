## SCRIPT TO INITIALICE PROJECTS


### LOCAL INSTALATION

```
git clone https://github.com/salvacnj/linux-script.git

echo "export PATH=\$PATH:$(pwd)" >> ~/.bashrc

source ~/.bashrc

chmod -R 777 ./

```

### USE FROM REMOTE


Init node js application


```
wget -O - https://raw.githubusercontent.com/salvacnj/linux-script/master/init.sh | bash <(cat) </dev/tty
```




Add mongoose 

```
wget -O - https://raw.githubusercontent.com/salvacnj/linux-script/master/mongoose.sh | bash <(cat) </dev/tty
```

Add mqtt 

```
wget -O - https://raw.githubusercontent.com/salvacnj/linux-script/master/mqtt.sh | bash <(cat) </dev/tty
```


Add noble 

```
wget -O - https://raw.githubusercontent.com/salvacnj/linux-script/master/noble.sh | bash <(cat) </dev/tty
```


### Typescript node js

Init typescript node js application 

```
wget -O - https://raw.githubusercontent.com/salvacnj/linux-script/master/init-typescript.sh | bash <(cat) </dev/tty
```

Add to package.json 

```
{
  ....
  
 "scripts": {
    "start": "node --inspect=5858 -r ts-node/register ./src/server.ts",
    "start:watch": "nodemon",
    "build": "tsc"
  },
  "nodemonConfig": {
    "ignore": [
      "**/*.test.ts",
      "**/*.spec.ts",
      ".git",
      "node_modules"
    ],
    "watch": [
      "src"
    ],
    "exec": "npm start",
    "ext": "ts"
  }
  ......
}

```


# GIT COMMANDS

````
git rm -r --cached .
git add .
git commit -am 'Removed files from the index (now ignored)'

```
