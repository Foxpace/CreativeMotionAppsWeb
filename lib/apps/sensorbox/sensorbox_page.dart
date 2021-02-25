import 'package:flutter/material.dart';


class SensorBoxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geeks for Geeks'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Click Me!'),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              RaisedButton(
                child: Text('Tap Me!'),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ],
          )),
    );
  }
}