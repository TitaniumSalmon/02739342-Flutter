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
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Demo Navigate Page'),
        '/pg1': (context) => const Page1Screen(),
        '/pg2': (context) => const Page2Screen(),
      },
      //home: const MyHomePage(title: 'Flutter Demo Navigate Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              Navigator.pushNamed(context, '/pg1');
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              elevation: 0, // Shadow scale
            ),
            onPressed: () {
              // go to page2
              Navigator.pushNamed(context, '/pg2');
            },
            child: const Text('Go to Page 2'),
          ),
        ],
      ),
    );
  }
}
