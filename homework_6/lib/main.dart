import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loginpage.dart';
import 'homepage.dart';
import 'themeswitch.dart';

void main() {
  runApp(const MyApp());
}

// MyApp is the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeSwitcherRoot();
  }
}

// ThemeSwitcherRoot manages the theme state and provides it to the app.
class ThemeSwitcherRoot extends StatefulWidget {
  const ThemeSwitcherRoot({super.key});

  @override
  State<ThemeSwitcherRoot> createState() => _ThemeSwitcherRootState();
}

class _ThemeSwitcherRootState extends State<ThemeSwitcherRoot> {
  bool isDarkMode = false;
  late final ValueChanged<bool> onThemeChanged;

  void toggleTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: isDarkMode ? MyTheme.darkTheme : MyTheme.lightTheme,
      home: MainPage(
        isDarkMode: isDarkMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}

// MainPage is responsible for checking the login status and navigating
// to the appropriate screen (LoginPage or HomePage).

class MainPage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  const MainPage({super.key, required this.isDarkMode, required this.onThemeChanged});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // A boolean to hold the login status. Initially null to show a loading indicator.
  bool? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }
  // You can place the theme switch in the AppBar of HomePage and LoginPage.
  // No code is needed here for the switch itself.
  // Asynchronous function to check if the user is logged in using SharedPreferences.
  Future<void> _checkLoginStatus() async {
    // Edit #1: Use SharedPreferences to get the login status.
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;
    final isDarkmode = prefs.getBool('isDarkMode') ?? widget.isDarkMode;
    setState(() {
      _isLoggedIn = loggedIn;
      widget.onThemeChanged(isDarkmode);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show a circular progress indicator while checking the login status.
    if (_isLoggedIn == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    // If logged in, navigate to HomePage; otherwise, navigate to LoginPage.
    return _isLoggedIn!
        ? HomePage(
            isDarkMode: widget.isDarkMode,
            onThemeChanged: widget.onThemeChanged,
          )
        : LoginPage(
            isDarkMode: widget.isDarkMode,
            onThemeChanged: widget.onThemeChanged,
          );
  }
}

