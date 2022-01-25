import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';

import 'app screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mik n Min',
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      home: const Home(),
    );
  }
}
