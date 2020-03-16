import 'package:epaisademo/Screens/authentication_page.dart';
import 'package:epaisademo/Screens/map_page.dart';
import 'package:flutter/material.dart';
import 'Screens/authentication_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthenticationPage(),
        'mapPage': (context) => MapPage(),

      },
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



