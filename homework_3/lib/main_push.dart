import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Navigate Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: Text('Navigation to another pages!'))),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              elevation: 0, // Shadow scale
            ),
            child: const Text('Go to Page 1'),
            onPressed: () {
              // go to page 1
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Page1Screen(),
                ),
              );
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              elevation: 0, // Shadow scale
            ),
            onPressed: () {
              // go to page2
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Page2Screen(),
                ),
              );
            },
            child: const Text('Go to Page 2'),
          ),
        ],
      ),
    );
  }
}
