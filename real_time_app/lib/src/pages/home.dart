import 'package:flutter/material.dart';

import 'package:real_time_app/src/models/band.dart';
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
    return Scaffold(
      appBar: AppBar(
          title: Text("Band names", style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (BuildContext context, int index) =>_bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
        elevation: 1,
      ),
    );
  }

  ListTile _bandTile(Band band) {
    return ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0,2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(band.name),
        trailing: Text("${band.votes}", style: TextStyle(fontSize: 20),),
        onTap: (){

        },
      );
  }
}