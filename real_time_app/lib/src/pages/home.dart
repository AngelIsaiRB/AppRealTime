import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_time_app/src/models/band.dart';
import 'package:real_time_app/src/services/socket_service.dart';
class HomePage extends StatefulWidget {
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Band> bands=[
    new Band(id:"1",name:"metalica",          votes:5),
    new Band(id:"2",name:"aurora",            votes:6),
    new Band(id:"3",name:"Oh wonder",         votes:8),
    new Band(id:"4",name:"Of mosters and men",votes:7),
    
  ];
  
  @override
  Widget build(BuildContext context) {
    final socketService =Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text("Band names", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 1,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: (socketService.serverStatus==ServerStatus.Online)?
              Icon(Icons.check_circle, color:Colors.blue[300] ,)
              :Icon(Icons.offline_bolt, color:Colors.red[300] ,),
            )
          ],
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) =>_bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNewBand,
        elevation: 1,
      ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
          key: Key(band.id),
          background: Container(
            padding: EdgeInsets.only(left: 8.0),
            color: Colors.red,
            child: Align(
              child: Text("Delete"),
              alignment: Alignment.centerLeft,
              ),
          ),
          direction: DismissDirection.startToEnd,
          child: ListTile(
          leading: CircleAvatar(
            child: Text(band.name.substring(0,2)),
            backgroundColor: Colors.blue[100],
          ),
          title: Text(band.name),
          trailing: Text("${band.votes}", style: TextStyle(fontSize: 20),),
          onTap: (){

          },      
        ),
    );
  }


  addNewBand(){
    final textcontroller =  new TextEditingController();
    if (Platform.isAndroid){     
      return showDialog(context: context,
      builder: (context){
        return AlertDialog(
          title: Text("new band name:"),
          content: TextField(
            controller: textcontroller,
          ),
          actions: [
            MaterialButton(
              child: Text("add"),
              textColor: Colors.blue,
              elevation: 5,
              onPressed: ()=> addBandToList(textcontroller.text)
              ,
            )
          ],
        );
      },
    );
    }

    showCupertinoDialog(
      context: context,
      builder: (_){
        return CupertinoAlertDialog(
          title: Text("new band name:"),
          content: CupertinoTextField(
            controller: textcontroller,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("add"),
              onPressed: ()=>addBandToList(textcontroller.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text("close"),
              onPressed: ()=>Navigator.pop(context),
            ),
          ],
        );
      }
    );
    
  }

  void addBandToList(String name){
    if (name.length>0){
        this.bands.add(new Band(id:DateTime.now().toString(), name:name, votes: 0));
        setState(() {      });
    }
        Navigator.pop(context);
  }
}