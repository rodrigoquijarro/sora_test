const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const https = require("https");
const fs = require( "fs" );
const request = require("request");

const app = express();

var time;
var date;

var corsOptions = {
  origin: "https://localhost:443"
};

app.use(cors(corsOptions));

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

request('http://worldtimeapi.org/api/timezone/Europe/Moscow', { json: true }, (err, res, body) => {
  if (err) { return console.log(err); }
  time = body.datetime;
});

// simple routes https://app.com/ 
app.get("/", (req, res) => {
  res.send('Hello world. Time is: '+time);
});

httpsOptions = {
  key: fs.readFileSync("rootCA.key"), // path to key
  cert: fs.readFileSync("rootCA.pem") // path to cert
}

// set port, listen for requests
https.createServer(httpsOptions, app).listen(443, ()=> {
  console.log(`Server is running. Time result:`);
});