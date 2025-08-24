import 'package:flutter/material.dart';
import 'trip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String titleText = 'Dismissable Demo';
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
  List<Trip> trips = [];

  @override
  void initState() {
    super.initState();
    // Initialize any data
    trips = [
      Trip(id: '1', tripName: 'Beach Vacation', tripLocation: 'Hawaii'),
      Trip(id: '2', tripName: 'Mountain Hiking', tripLocation: 'Colorado'),
      Trip(id: '3', tripName: 'City Tour', tripLocation: 'New York'),
      Trip(id: '4', tripName: 'Desert Safari', tripLocation: 'Dubai'),
      Trip(id: '5', tripName: 'Cultural Experience', tripLocation: 'Japan'),
      Trip(id: '6', tripName: 'Cruise Adventure', tripLocation: 'Caribbean'),
      Trip(id: '7', tripName: 'Wildlife Safari', tripLocation: 'Kenya'),
      Trip(id: '8', tripName: 'Ski Trip', tripLocation: 'Switzerland'),
      Trip(id: '9', tripName: 'Island Hopping', tripLocation: 'Greece'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryFixedDim,
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: trips.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(trips[index].tripName),
              confirmDismiss: (direction) async {
                if (direction == DismissDirection.endToStart) {
                  return true;
                }
                return false; 
              },
              onDismissed: (direction) {
                if (direction == DismissDirection.endToStart) {
                  // Show a snackbar when the item is dismissed
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${trips[index].tripName} removed')),
                  );
                  setState(() {
                    trips.removeAt(index);
                  });
                }
              },
              background: Container(color: Colors.blue),
              secondaryBackground: Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[Icon(Icons.delete, color: Colors.white)],
                  ),
                ),
              ),
              direction: DismissDirection.horizontal,
              child: Card(
                child: ListTile(                
                  leading: Icon(Icons.travel_explore),
                  title: Text(trips[index].tripName),
                  subtitle: Text(trips[index].tripLocation),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
