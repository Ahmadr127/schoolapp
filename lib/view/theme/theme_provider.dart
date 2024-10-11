import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue, // Mengatur warna latar belakang AppBar menjadi biru
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        color: Colors.black54,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    // Tambahkan konfigurasi tema terang lainnya di sini
  );

  static final darkTheme = ThemeData(
    
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.grey[900]!,
      secondary: Colors.grey[800]!,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        color: Colors.white54,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.grey[900],
    ),
    // Tambahkan konfigurasi tema gelap lainnya di sini
  );
}
