
// udp socket - from DCS LUA
const dgram = require('dgram');
const udp4 = dgram.createSocket('udp4');
const PORT = 9182;
const HOST = '127.0.0.1';
let DCS_JSON;

udp4.bind(PORT, HOST);

udp4.on('listening', ()=>{
    const address = udp4.address();
    console.log(`UDP Server listening on ${address.address}:${address.port}`);
});

udp4.on('message', (message, remote)=>{
    
    if (JSON.parse(message).length > 0){
        // console.log(JSON.parse(message));
        DCS_JSON = JSON.parse(message);
        console.log(DCS_JSON);
    }

});

//////////////////////////////////////////////////////////////////////////////////////

// websocket server - to web client
const WebSocket = require('ws');
const wss = new WebSocket.Server({port: 8082});

wss.on('connection', ws => {
    console.log('New Client Connected !');

    ws.on('close', () => {
        console.log('Client has disconnected !');
    });

    setInterval(()=>{
        ws.send(JSON.stringify(DCS_JSON));
        DCS_JSON = '';
    }, 2000);

});