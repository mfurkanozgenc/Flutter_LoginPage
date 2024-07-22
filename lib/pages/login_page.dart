import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web/pages/home_page.dart';
import 'package:web/services/database_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final db = DatabaseService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisibility = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      db.Name = _usernameController.text;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color(0xFFee403c),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          height: MediaQuery.of(context).size.height * .4,
          width: MediaQuery.of(context).size.width,
          child: const Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HOŞGELDİNİZ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Mustafa Furkan Özgenç',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Lütfen Kullanıcı Adını Giriniz';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            label: Text('Kullanıcı Adı *'),
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFee403c)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: TextFormField(
                              obscureText: db.ButtonPasswordVisibility,
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Lütfen Şifre Giriniz';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: const Text('Şifre *'),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: IconButton(
                                    icon: Icon(
                                      db.ButtonPasswordVisibility
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        db.ButtonPasswordVisibility =
                                            !db.ButtonPasswordVisibility;
                                      });
                                    },
                                  ),
                                ),
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFee403c)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  overlayColor: Colors.deepOrange,
                                  backgroundColor: const Color(0xFFee403c),
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * .8,
                                      50)),
                              child: const Text('Giriş Yap')),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Center(
              child: Text(
            'ÖZGENÇ ®',
            style: GoogleFonts.mukta(
              textStyle: const TextStyle(
                color: Color(0xFFee403c),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )),
        ),
      ],
    ));
  }
}
