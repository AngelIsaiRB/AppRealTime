import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_time_app/src/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socketService =Provider.of<SocketService>(context);
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Server status:${socketService.serverStatus}")
          ],
        ),
        
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          socketService.socket.emit("emitir-mensaje",{"nombre":"flutter", "mensaje":"hola mundo desde flutter"});
        },
        child: Icon(Icons.message),
      ),  
    );
  }
}