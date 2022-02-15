import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mik_and_min/app%20screens/atif/about_us.dart';
import 'package:mik_and_min/app%20screens/atif/contact_us.dart';
import 'package:mik_and_min/app%20screens/authenctication%20screens/login.dart';
import 'package:mik_and_min/utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mik n Min',
      theme: ThemeData(
        primarySwatch: CustomColors.primaryColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const Login(),
    );
  }
}
