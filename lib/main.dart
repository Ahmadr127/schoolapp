import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/theme/theme_provider.dart';
import 'routes/routing.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Student App',
          theme: themeProvider.currentTheme, // Ubah ini
          // Hapus baris darkTheme dan themeMode
          initialRoute: '/',
          onGenerateRoute: AppRouter.generateRoute,
        );
      },
    );
  }
}
