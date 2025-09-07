import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
// LoginPage allows the user to log in with hardcoded credentials.

class LoginPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  const LoginPage({super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Hardcoded account credentials for demonstration.
  static const String _hardcodedUsername = 'admin';
  static const String _hardcodedPassword = '123456';

  // Function to handle the login logic.
  Future<void> _login() async {
    // Check if the entered credentials match the hardcoded ones.
    if (_usernameController.text == _hardcodedUsername &&
        _passwordController.text == _hardcodedPassword) {
      // If successful, save the login status to SharedPreferences.
      // Edit #2
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      // Navigate to the HomePage and replace the current route.
      // This prevents the user from going back to the login page with the back button.
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(
              isDarkMode: widget.isDarkMode,
              onThemeChanged: widget.onThemeChanged,
            ),
          ),
        );
        
      }
    } else {
      // Show an error message if credentials are incorrect.
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เข้าสู่ระบบ'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          ToggleButtons(
          isSelected: [!widget.isDarkMode, widget.isDarkMode],
          onPressed: (int index) {
            widget.onThemeChanged(index == 1);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Login',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ชื่อผู้ใช้',
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'รหัสผ่าน',
              ),
              obscureText: true,
              obscuringCharacter: '#',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.blueAccent,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('เข้าสู่ระบบ'),
            ),
          ],
        ),
      ),
    );
  }
}