import 'package:flutter/material.dart';


class MyTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: const Color(0xFF2C2D32),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xFFebebed)),
    ),
  );
}


class ThemeSwitcher extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const ThemeSwitcher({Key? key, required this.isDarkMode, required this.onThemeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Light'),
        ToggleButtons(
          isSelected: [!isDarkMode, isDarkMode],
          onPressed: (int index) {
            onThemeChanged(index == 1);
          },
          children: const [
            Icon(Icons.wb_sunny),
            Icon(Icons.nights_stay),
          ],
        ),
        const Text('Dark'),
        const SnackBar(content:Text('เปลี่ยนธีมแล้ว'))
      ],
    );
  }
}


// SwitchExample is no longer needed; use ThemeSwitcher instead.