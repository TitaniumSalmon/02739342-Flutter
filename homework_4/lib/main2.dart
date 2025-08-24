import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String titleText = 'Gesture Detector Demo';
    return MaterialApp(
      title: titleText,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: titleText),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int leftValue = 0;
  int rightValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.black26, width: 2),
                ),
                child: Row(
                  children: [
                    Expanded(child: _buildMergedMinusTarget()),
                    Container(
                      width: 2,
                      color: Colors.black26,
                    ),
                    Expanded(child: _buildMergedPlusTarget()),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '${leftValue + rightValue}',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 20,
              children: [
                _buildNumberDraggable(10,'red'),
                _buildNumberDraggable(50,'yellow'),
                _buildNumberDraggable(100,'blue'),
                _buildNumberDraggable(150,'green'),
              ],
            ),
          ],
        ),
      ),
    );
  }




  // Draggable for numbers
  Draggable<int> _buildNumberDraggable(int number, String color) {
    return Draggable<int>(
      data: number,
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.work, color: _getColor(color), size: 48.0),
        ),
      ),
      childWhenDragging: Icon(Icons.work, color: Colors.grey, size: 48.0),
      child: Column(
        children: [
          Icon(Icons.work, color: _getColor(color), size: 48.0),
          Text('$number'),
        ],
      ),
    );
  }

  Color _getColor(String color) {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'yellow':
        return Colors.yellow;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  // Merged left side: minus target
  DragTarget<int> _buildMergedMinusTarget() {
    return DragTarget<int>(
      onAccept: (number) {
        setState(() {
          leftValue -= number;
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Minus', style: TextStyle(fontSize: 18, color: Colors.red[800])),
                SizedBox(height: 10),
                Icon(Icons.remove, size: 32, color: Colors.red[800]),
              ],
            ),
          ),
        );
      },
    );
  }

  // Merged right side: plus target
  DragTarget<int> _buildMergedPlusTarget() {
    return DragTarget<int>(
      onAccept: (number) {
        setState(() {
          rightValue += number;
        });
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Plus', style: TextStyle(fontSize: 18, color: Colors.green[800])),
                SizedBox(height: 10),
                Icon(Icons.add, size: 32, color: Colors.green[800]),
              ],
            ),
          ),
        );
      },
    );
  }
}
