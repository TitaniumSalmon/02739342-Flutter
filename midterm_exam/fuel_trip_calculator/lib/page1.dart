import 'package:flutter/material.dart';

// ignore: camel_case_types
class Page1Screen extends StatefulWidget {
  const Page1Screen({super.key});

  @override
  State<Page1Screen> createState() => _Page1ScreenState();
}

class _Page1ScreenState extends State<Page1Screen> {

  double? distance;
  double? fuelEfficiency;
  double? fuelPrice;

  @override
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('ค่าใช้จ่ายการเดินทางรถน้ำมัน', style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromARGB(255, 228, 83, 17),
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
            const Text('อัตราสิ้นเปลือง (กิโลเมตร/ลิตร):'),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'กรุณากรอกอัตราสิ้นเปลือง',
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
                  return 'กรุณากรอกอัตราสิ้นเปลือง';
                }
                if (double.tryParse(value) == null) {
                  return 'กรุณากรอกตัวเลขที่ถูกต้อง';
                }
                return null;
              },
              onChanged: (value) {
                // Do something with this value

                fuelEfficiency = double.tryParse(value);
              },
            ),
            const SizedBox(height: 20),
            const Text('ราคาน้ำมันต่อลิตร (ลิตร):'),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'กรุณากรอกราคาน้ำมัน',
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
                
                double fuelUsed = distance! / fuelEfficiency!;

                double totalCost = fuelUsed * fuelPrice!;
                // Show the result in a dialog or snackbar
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    // title: const Text('Total Fuel Cost'),
                    content: Text('ปริมาณน้ำมันที่ต้องใช้ = $distance/$fuelEfficiency = $fuelUsed ลิตร\nค่าใช้จ่ายรวม = $fuelUsed * $fuelPrice = $totalCost บาท'),
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
