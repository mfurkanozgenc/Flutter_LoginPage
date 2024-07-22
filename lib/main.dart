import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/pages/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: false, textTheme: GoogleFonts.muktaMaheeTextTheme()),
        home: const LoginPage());
  }
}
