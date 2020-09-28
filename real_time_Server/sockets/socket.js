const { io } = require('../index');
const Band = require('../models/band');
const Bands = require('../models/bands');
const bands= new Bands();
console.log("init server-----");

bands.addBand(new Band("Aurora"));
bands.addBand(new Band("Helhin"));
bands.addBand(new Band("julia stone"));
bands.addBand(new Band("of mosters and men"));


// Mensajes de Sockets
io.on('connection', client => {
    console.log('Cliente conectado');

    client.emit("active-bands",bands.getBands());

    client.on('disconnect', () => {
        console.log('Cliente desconectado');
    });

    client.on('mensaje', ( payload ) => {
        console.log('Mensaje', payload);

        io.emit( 'mensaje', { admin: 'Nuevo mensaje' } );

    });
    client.on('emitir-mensaje', ( payload ) => {       
       // io.emit( 'nuevo-mensaje', payload);//emite a todos
        console.log('Mensaje', payload);
        client.broadcast.emit( 'nuevo-mensaje', payload);// a todos menos el que lo emitio

    });

    client.on("vote-band", (payload)=>{
        console.log(payload);
        bands.voteBand(payload.id);
        io.emit("active-bands",bands.getBands());
    });
    client.on("new-band", (payload)=>{
        console.log(payload);
        bands.addBand(new Band(payload.name,));
        io.emit("active-bands",bands.getBands());
    });
    
    client.on("delete-band", (payload)=>{
        console.log(payload);
        bands.deleteBand(payload.id);
        io.emit("active-bands",bands.getBands());
    });
});
