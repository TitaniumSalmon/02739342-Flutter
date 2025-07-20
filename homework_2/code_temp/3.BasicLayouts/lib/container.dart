import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container example'),
        ),
        body: Container(
          //color: Colors.deepPurple[900],
          //margin: const EdgeInsets.all(20),
          //transform: Matrix4.rotationZ(0.1),
          //height: 100,
          //alignment: Alignment.center,
          //padding: EdgeInsets.all(8.0),
          child: const Text(
            'Hello! This is a message inside container...',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
