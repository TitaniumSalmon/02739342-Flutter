import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:electricity_payment/ElectricityPaymentModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'databaseHelper.dart';
import 'paymentEntry.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  DateTime selectedDate = DateFormat('MMMM yyyy').parse(DateFormat('MMMM yyyy').format(DateTime.now())); // Initialize to current month
  List<ElectricityPaymentModel> paymentItems = [];

  Future<void> _pickMonth() async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),  // earliest selectable
      lastDate: DateTime(2100),   // latest selectable
    );

    if (picked != null) {
      DateFormat('MMMM yyyy').format(picked);
      setState(() {
        selectedDate = picked;
      });
    }
    DateFormat('MMMM yyyy').format(DateTime.now());
  }
  

  String get monthYear {
    return "${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _pickMonth,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(monthYear),
              const SizedBox(width: 6),
              const Icon(Icons.calendar_today, size: 20),
            ],
          ),
        ),
        centerTitle: true,
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
    );
  }
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

        print(paymentItems[index].month);
        print(index);
        if (paymentItems[index].month != DateFormat('MMMM yyyy').format(selectedDate)) {
          return SizedBox.shrink(); // Skip rendering this item
        }
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
                if (DateFormat('MMMM yyyy').format(selectedDate) == paymentItems[index].month)
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

