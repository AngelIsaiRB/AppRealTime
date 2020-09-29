import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus{
  Online,
  Offline,
  Connecting,
}

class SocketService with ChangeNotifier {
  
  ServerStatus _serverstatus = ServerStatus.Connecting;
  IO.Socket _socket;


  ServerStatus get serverStatus=>this._serverstatus;
  IO.Socket get socket=>this._socket;

  SocketService(){
    _initConfig();
  }

  void _initConfig(){
    //client
    this._socket = IO.io('https://flutter-example-socket.herokuapp.com',{ //localhost y si no funciona direccion ip
      "transports" : ["websocket"],
      "autoConnect": true,

    });
    this._socket.on('connect', (_) {
     print('Conectado app..');
     this._serverstatus=ServerStatus.Online;
     notifyListeners();
    });
    
    this._socket.on('disconnect', (_)  {
      print('disconnect');
      this._serverstatus=ServerStatus.Offline;
      notifyListeners();

    });
    /*
    socket.on('nuevo-mensaje', (payload)  {
      print("nuevo-mesaje");
      print("nombre: "+payload["nombre"]);
      print("mensaje: "+payload["mensaje"]);
      print(payload.containsKey("mensaje2")?payload["mensaje2"]:"no hay");
    });*/
    

  }
}