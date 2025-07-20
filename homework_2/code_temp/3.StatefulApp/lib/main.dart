import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stateful Demo Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Press the button to increment/decrement the counter:'),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count++; // Increment the count
                      });
                    },
                    child: Icon(Icons.add, size: 30),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _count--; // Decrement the count
                      });
                    },
                    child: Icon(Icons.remove, size: 30),
                  ),
                ],
              ),              
              SizedBox(
                height: 30,
              ),
              Text(
                _count.toString(), // This should be replaced with a state variable to show the count
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
       
      ),
    );
  }
}