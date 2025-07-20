import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// TODO #1: Listview with ListTile

/*
 * Build basic Listview 
 */

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ListView example'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: const <Widget>[
            ListTile(
                title: Text("Battery Full"),
                subtitle: Text("The battery is full."),
                leading: Icon(Icons.battery_full),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Anchor"),
                subtitle: Text("Lower the anchor."),
                leading: Icon(Icons.anchor),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Alarm"),
                subtitle: Text("This is the time."),
                leading: Icon(Icons.access_alarm),
                trailing: Icon(Icons.star)),
          ],
        ),
      ),
    );
  }
}


/// TODO #2: Listview builder from array 

/*
 * Card widget on Listview
 */

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('ListView example'),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.all(8),
//           children: const <Widget>[
//             Card(
//                 child: ListTile(
//                     title: Text("My favorite dog #1"),
//                     subtitle: Text("Number one."),
//                     leading: CircleAvatar(
//                         backgroundImage: AssetImage("assets/dog1.jpg")),
//                     trailing: Icon(Icons.star))),
//             Card(
//                 child: ListTile(
//                     title: Text("My favorite dog #2"),
//                     subtitle: Text("Number two."),
//                     leading: CircleAvatar(
//                         backgroundImage: AssetImage("assets/dog2.jpg")),
//                     trailing: Icon(Icons.star))),
//           ],
//         ),
//       ),
//     );
//   }
// }

/// TODO #3: Listview builder from array 

/*
 * Build Listview from data in Array
 */

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   var titles = ['My favorite dog #1', 'My favorite dog #2'];
//   var subtitles = ['Number one.', 'Number two.'];
//   var images = ['assets/dog1.jpg', 'assets/dog2.jpg'];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('ListView example'),
//           ),
//           body: ListView.builder(
//             itemCount: titles.length,
//             itemBuilder: (context, index) {
//               return Card(
//                   child: ListTile(
//                       title: Text(titles[index]),
//                       subtitle: Text(subtitles[index]),
//                       leading: CircleAvatar(
//                           backgroundImage: AssetImage(images[index])),
//                       trailing: Icon(Icons.star)));
//             },
//           )),
//     );
//   }
// }


