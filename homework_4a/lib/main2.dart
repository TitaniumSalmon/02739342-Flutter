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
  String _gestureDetected = '';
  Color targetColor = Colors.grey[300]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildDraggableTarget(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOrangeColorDraggable(),
                  _buildGreenColorDraggable(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<MaterialColor> _buildOrangeColorDraggable() {
    return Draggable<MaterialColor>(
      childWhenDragging: Icon(Icons.work, color: Colors.grey, size: 48.0),
      feedback: Icon(Icons.work, color: Colors.deepOrange, size: 80.0),
      data: Colors.deepOrange,
      child: Column(
        children: [
          Icon(Icons.work, color: Colors.deepOrange, size: 48.0),
          Text('Orange'),
        ],
      ),
    );
  }

  Draggable<MaterialColor> _buildGreenColorDraggable() {
    return Draggable<MaterialColor>(
      childWhenDragging: Icon(Icons.work, color: Colors.grey, size: 48.0),
      feedback: Icon(Icons.work, color: Colors.green, size: 80.0),
      data: Colors.green,
      child: Column(
        children: [
          Icon(Icons.work, color: Colors.green, size: 48.0),
          Text('Green'),
        ],
      ),
    );
  }

  DragTarget<MaterialColor> _buildDraggableTarget() {
    return DragTarget<MaterialColor>(
      onAcceptWithDetails: (color) {
        setState(() {
          targetColor = color.data;
        });
      },
      builder: (context, candidateData, rejectedData) {
        return GestureDetector(
          onTap: () {
            _displayGestureDetected('onTap');
          },
          onDoubleTap: () {
            _displayGestureDetected('onDoubleTap');
          },
          onLongPress: () {
            _displayGestureDetected('onLongPress');
          },
          onPanUpdate: (DragUpdateDetails details) {
            // Detecting drag direction
            if (details.delta.dy > 0) {
              _displayGestureDetected('Dragging down');
            } else if (details.delta.dy < 0) {
              _displayGestureDetected('Dragging up');
            } else if (details.delta.dx > 0) {
              _displayGestureDetected('Dragging right');
            } else if (details.delta.dx < 0) {
              _displayGestureDetected('Dragging left');
            }
          },

          child: Container(
            color: targetColor,
            width: double.infinity,
            height: 300,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(child: Text('Gesture Detector Area')),
                const SizedBox(height: 20),
                Text(_gestureDetected),
              ],
            ),
          ),
        );
      },
    );
  }
}
