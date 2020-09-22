import 'package:flutter/material.dart';

import 'package:real_time_app/src/pages/home.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Time App',
      initialRoute: "home",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),        
      ),
      routes: {
        "home":(BuildContext context) => HomePage(),

      },
    );
  }
}