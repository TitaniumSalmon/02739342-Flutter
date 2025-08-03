import 'package:flutter/material.dart';

// ignore: camel_case_types
class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page #1'),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: const Text('This is a message on Page 1'),
      ),
    );
  }
}
