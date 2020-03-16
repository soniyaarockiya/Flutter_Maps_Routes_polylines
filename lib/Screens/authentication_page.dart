import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Facebook Login'),
              onPressed: () {
                //take me to map page-----just trial
                Navigator.of(context).pushNamed("mapPage");
              },
              textColor: Colors.black,
            ),
            RaisedButton(
              child: Text('Instagram Login'),
              onPressed: () {},
              textColor: Colors.black,
            ),
            RaisedButton(
              child: Text('TouchId Login'),
              onPressed: () {},
              textColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
