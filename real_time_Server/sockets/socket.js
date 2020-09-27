const { io } = require('../index');


// Mensajes de Sockets
io.on('connection', client => {
    console.log('Cliente conectado');

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

});
