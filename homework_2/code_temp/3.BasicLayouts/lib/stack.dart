import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stack example'),
        ),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
              Container(
                width: 250,
                height: 250,
                transform: Matrix4.rotationZ(-0.1),
                color: Colors.black54,
              ),
              Container(
                height: 200,
                width: 200,
                transform: Matrix4.rotationZ(0.1),
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
