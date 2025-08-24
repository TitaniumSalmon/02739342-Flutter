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
              _buildGestureDetector(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOrangeColorDraggable(),
                  _buildGreenColorDraggable(),
                ],
              ),
              const SizedBox(height: 20),
              _buildDragTarget(),
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

  GestureDetector _buildGestureDetector() {
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
        color: Colors.deepPurple[100],
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
  }

  Draggable<MaterialColor> _buildOrangeColorDraggable() {
    return Draggable<MaterialColor>(
      childWhenDragging: Icon(Icons.palette, color: Colors.grey, size: 48.0),
      feedback: Icon(Icons.palette, color: Colors.deepOrange, size: 80.0),
      data: Colors.deepOrange,
      child: Column(
        children: [
          Icon(Icons.palette, color: Colors.deepOrange, size: 48.0),
          Text('Orange'),
        ],
      ),
    );
  }

  Draggable<MaterialColor> _buildGreenColorDraggable() {
    return Draggable<MaterialColor>(
      childWhenDragging: Icon(Icons.palette, color: Colors.grey, size: 48.0),
      feedback: Icon(Icons.palette, color: Colors.green, size: 80.0),
      data: Colors.green,
      child: Column(
        children: [
          Icon(Icons.palette, color: Colors.green, size: 48.0),
          Text('Green'),
        ],
      ),
    );
  }

  DragTarget<MaterialColor> _buildDragTarget() {
    Color targetColor = Colors.grey[300]!;
    return DragTarget<MaterialColor>(
      onAcceptWithDetails: (color) {
        targetColor = color.data;
        // ตัวแปร taegetColor เป็น Local variable ในฟังก์ชันนี้ ซึ่งจะถูกสร้างใหม่ทุกครั้งที่ฟังก์ชันนี้ถูกเรียก
        // ในกรณีนี้ไม่ต้องใช้ setState เพราะ DragTarget จะ rebuild เองเมื่อมีการเปลี่ยนแปลง
        // ทำให้ color ของ targetColor ถูกอัพเดตโดยอัตโนมัติตามค่าของ data ที่ถูกส่งเข้ามา
      },
      builder: (context, candidateData, rejectedData) {
        return Container(
          width: double.infinity,
          height: 100,
          color: targetColor,
        );
      },
    );
  }
}
