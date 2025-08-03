import 'package:flutter/material.dart';

// ignore: camel_case_types
class Page2Screen extends StatelessWidget {
  const Page2Screen({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page #2'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(50),
            child: const Text('This is a message on Page 2'),
          ),
          Center(
            child: SizedBox(
              width: 80,
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                child: const Text('Close'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
