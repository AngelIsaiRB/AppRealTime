import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:real_time_app/src/pages/home.dart';
import 'package:real_time_app/src/pages/status.dart';
import 'package:real_time_app/src/services/socket_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>SocketService(),)
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Real Time App',
        initialRoute: "home",
        home: Scaffold(                       
        ),
        routes: {
          "home":(BuildContext context) => HomePage(),
          "Status":(_)=>StatusPage(),
        },
      ),
    );
  }
}