import 'package:flutter/material.dart';

void main() {
  runApp(my_profile());
}

class my_profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/daimage.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'ชื่อ: นายพีรพล ศิริวัฒน์\n'
                'ที่อยู่: 99/8 หมู่ 8 ต.ถลุงเหล็ก อ.โคกสำโรง จ.ลพบุรี 15120\n'
                'ช่องทางการติดต่อ: https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
