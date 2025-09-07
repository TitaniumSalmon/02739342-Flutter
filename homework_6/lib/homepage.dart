import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginpage.dart';

// HomePage is the screen shown after a successful login.
class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  const HomePage({super.key, required this.isDarkMode, required this.onThemeChanged});

  // Function to handle the logout logic.
  Future<void> _logout(BuildContext context) async {
    // Remove the 'isLoggedIn' key from SharedPreferences.
    // Edit #3
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');


    // Navigate to the LoginPage and replace all previous routes.
    // This ensures the user cannot use the back button to get back to the home page.
    if (context.mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginPage(
            isDarkMode: isDarkMode,
            onThemeChanged: onThemeChanged,
          ),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าหลัก'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          ToggleButtons(
          isSelected: [!isDarkMode, isDarkMode],
          onPressed: (int index) {
            onThemeChanged(index == 1);
            SharedPreferences.getInstance().then((prefs) {
              prefs.setBool('isDarkMode', index == 1);
            });
          },
          children: const [
            Icon(Icons.wb_sunny),
            Icon(Icons.nights_stay),
          ],
        ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Home Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _logout(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                minimumSize: const Size.fromRadius(20),
              ),
              child: const Text('ออกจากระบบ'),
            ),
          ],
        ),
      ),
    );
  }
}
