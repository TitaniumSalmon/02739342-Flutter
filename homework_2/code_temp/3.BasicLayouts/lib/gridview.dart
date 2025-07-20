import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// TODO #1: gridview with text

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('GridView example'),
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 5,
          crossAxisCount: 3, // number of columns
          children: const <Widget>[
            Text('1111111111111111111111111111111'),
            Text('2222222222222222222222222222222222'),
            Text('33333333333333333333333333333333333333'),
            Text('4444444444444444444444444444444444444444444444'),
            Text('555555555555555555555555555555555555555555555555555'),
            Text('zzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
            Text('33333333333333333333333333333333333333'),
            Text('4444444444444444444444444444444444444444444444'),
            Text('555555555555555555555555555555555555555555555555555'),
            Text('zzzzzzzzzzzzzzzzzzzzzzzzzzzz'),
          ],
        ),
      ),
    );
  }
}

/// TODO #2: gridview with with image on vertical scrolling

/*
 *  Scrolling on Vertical
 */

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('GridView example'),
//         ),
//         body: GridView.count(
//           primary: false,
//           padding: const EdgeInsets.all(20.0),
//           crossAxisSpacing: 5,
//           mainAxisSpacing: 5,
//           crossAxisCount: 2, // number of columns
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             Image.asset('assets/dog1.jpg'),
//             Image.asset('assets/dog2.jpg'),
//             Image.asset('assets/dog1.jpg'),
//             Image.asset('assets/dog2.jpg'),
//             Image.asset('assets/dog1.jpg'),
//             Image.asset('assets/dog2.jpg'),
//             Image.asset('assets/dog1.jpg'),
//             Image.asset('assets/dog2.jpg'),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// TODO #3: gridview with with image on horizontal scrolling

/*
 *  Scrolling on Horizontal
 */

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('GridView example'),
//         ),
//         body: GridView.count(
//           primary: true,
//           padding: const EdgeInsets.all(20.0),
//           crossAxisSpacing: 5,
//           mainAxisSpacing: 5,
//           crossAxisCount: 2, // number of rows
//           scrollDirection: Axis.horizontal,
//           children: <Widget>[
//             Image.asset('assets/dog1.jpg'),
//             Image.asset('assets/dog2.jpg'),
//             Image.asset('assets/dog1.jpg'),
//             Image.asset('assets/dog2.jpg'),
//             Image.asset('assets/dog1.jpg'),
//             Image.asset('assets/dog2.jpg'),
//             Image.asset('assets/dog1.jpg'),
//             Image.asset('assets/dog2.jpg'),
//           ],
//         ),
//       ),
//     );
//   }
// }

