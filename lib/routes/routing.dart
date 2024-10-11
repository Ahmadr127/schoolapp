import 'package:flutter/material.dart';
import '../view/auth/login_page.dart';
import '../view/auth/register_page.dart';
import '../view/pages/welcome_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      // Tambahkan rute untuk halaman registrasi
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Rute tidak ditemukan untuk ${settings.name}'),
            ),
          ),
        );
    }
  }
}
