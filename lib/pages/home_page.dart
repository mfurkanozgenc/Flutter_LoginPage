import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/services/database_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final db = DatabaseService();
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOŞGELDİNİZ'),
        centerTitle: true,
        backgroundColor: const Color(0xFFee403c),
      ),
      body: Center(
        child: Text(
          db.Name,
          style: GoogleFonts.mukta(
              textStyle:
                  const TextStyle(color: Color(0xFFee403c), fontSize: 25)),
        ),
      ),
    );
  }
}
