import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electricity_payment/authenticationService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:electricity_payment/ElectricityPaymentModel.dart';
import 'package:intl/intl.dart';
import 'databaseHelper.dart';
import 'paymentEntry.dart';
import 'search.dart';
import 'loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Persistence',
      theme: ThemeData(
        useMaterial3: true,
        bottomAppBarTheme: BottomAppBarTheme(color: Colors.blue),
      ),
      home: LoginScreen(),
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
  List<ElectricityPaymentModel> paymentItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title, style: TextStyle(fontSize: 18)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AuthenticationService().logout();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: StreamBuilder(
        stream: DatabaseHelper().getStreamPayments(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No payments found.'));
          }
          return _buildListView(snapshot);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(padding: const EdgeInsets.all(24.0)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: CircleBorder(),
        tooltip: 'Add Electricity Payment Entry',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => PaymentEntry(
                    action: 'add',
                    payment: ElectricityPaymentModel(
                      userId: 'U001',
                      month: DateFormat('MMMM yyyy').format(DateTime.now()),
                      unitsUsed: 0,
                      amountPaid: 0.0,
                      paymentDate: DateFormat(
                        'dd MMMM yyyy',
                      ).format(DateTime.now()),
                      note: '',
                    ),
                  ),
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Build the ListView for displaying payments
  Widget _buildListView(AsyncSnapshot snapshot) {
    paymentItems.clear();
    for (var doc in snapshot.data!.docs) {
      paymentItems.add(
        ElectricityPaymentModel(
          userId: doc.get('userId'),
          month: doc.get('month'),
          unitsUsed: doc.get('unitsUsed'),
          amountPaid: doc.get('amountPaid').toDouble(),
          paymentDate: doc.get('paymentDate'),
          note: doc.get('note'),
          referenceId: doc.id,
        ),
      ); // Update the snapshot data with the model
    }
    // Sort the payment items by month
    paymentItems.sort((a, b) => a.month.compareTo(b.month));
    return ListView.separated(
      itemCount: paymentItems.length,
      itemBuilder: (BuildContext context, int index) {
        String titleDate = paymentItems[index].paymentDate;
        String subtitle =
            "หน่วยที่ใช้ ${paymentItems[index].unitsUsed} หน่วย, ${paymentItems[index].amountPaid} บาท\n${paymentItems[index].note}";
        return Dismissible(
          key: Key(paymentItems[index].referenceId ?? 'item_$index'),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder:
                  (ctx) => AlertDialog(
                    title: Text("Confirm Delete"),
                    content: Text("Are you sure you want to delete?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(false),
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(true),
                        child: Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
            );
          },
          child: ListTile(
            leading: Column(
              children: <Widget>[
                Text(
                  paymentItems[index].month.substring(0, 3).toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.blue,
                  ),
                ),
                Icon(Icons.electric_bolt, color: Colors.orange, size: 18.0),
              ],
            ),
            title: Text(
              titleDate,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(subtitle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => PaymentEntry(
                        action: 'edit',
                        payment: paymentItems[index],
                      ),
                ),
              );
            },
          ),
          onDismissed: (direction) {
            DatabaseHelper().deletePayment(paymentItems[index].referenceId!);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Payment deleted'),
                duration: Duration(seconds: 2),
              ),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(color: Colors.grey);
      },
    );
  }
}
