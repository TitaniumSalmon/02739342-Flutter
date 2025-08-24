import 'package:flutter/material.dart';

// ignore: camel_case_types
class Page2Screen extends StatefulWidget {
  const Page2Screen({super.key});

  @override
  State<Page2Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page2Screen> {

  double? distance;
  double? fuelEfficiency;
  double? fuelPrice;

  @override
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('ค่าใช้จ่ายการเดินทางรถไฟฟ้า (EV)', style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromARGB(255, 28, 122, 230),
      foregroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        //== TextFormField ==
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text('ระยะทางที่คุณต้องการเดินทาง (กิโลเมตร):'),
            // TextFormField for user input
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'กรุณากรอกระยะทาง',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 32.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              
             
              onChanged: (value) {
                // Do something with this value
                if (value.isEmpty) {
                  distance = null; // Reset if input is empty
                } else if (double.tryParse(value) == null) {
                  // Handle invalid input
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('กรุณากรอกตัวเลขที่ถูกต้อง')),
                  );
                  distance = null;
                } else
                  // Convert the input to a double
                distance = double.tryParse(value);


                
              },
            ),
            const SizedBox(height: 20),
            const Text('อัตราสิ้นเปลืองไฟฟ้า (kWh/100 กม.):'),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'กรุณากรอกอัตราสิ้นเปลืองไฟฟ้า',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 32.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกอัตราสิ้นเปลืองไฟฟ้า';
                }
                if (double.tryParse(value) == null) {
                  return 'กรุณากรอกตัวเลขที่ถูกต้องไฟฟ้า';
                }
                return null;
              },
              onChanged: (value) {
                // Do something with this value

                fuelEfficiency = double.tryParse(value);
              },
            ),
            const SizedBox(height: 20),
            const Text('ราคาไฟฟ้าต่อหน่วย (บาท/kWh):'),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'กรุณากรอกราคาไฟฟ้าต่อหน่วย',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 32.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (value) {
                // Do something with this value

                fuelPrice = double.tryParse(value);

              },
            ),
            const SizedBox(height: 20),
            ElevatedButton  (
              onPressed: () {
                // Example usage of the calculation function
                // double distance = 100.0; // Example distance
                // double fuelEfficiency = 15.0; // Example fuel efficiency
                // double fuelPrice = 30.0; // Example fuel price

                // Provide default values if any are null
                if (distance == null || fuelEfficiency == null || fuelPrice == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('กรุณากรอกข้อมูลทั้งหมด')),
                  );
                  return;
                }
                
                double fuelUsed = distance! * fuelEfficiency! /100;

                double totalCost = fuelUsed * fuelPrice!;
                // Show the result in a dialog or snackbar
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    // title: const Text('Total Fuel Cost'),
                    content: Text('ปริมาณพลังงานที่ต้องใช้ = ($distance x $fuelEfficiency / 100) = $fuelUsed kWh\nค่าใช้จ่ายรวม = $fuelUsed x $fuelPrice = $totalCost บาท'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('คำนวณค่าใช้จ่าย'), // Add this line
            )
          ],
        ),
      ),
    );
  }
}
