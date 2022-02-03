import 'package:flutter/material.dart';
import 'package:mik_and_min/utils/config.dart';
import 'package:mik_and_min/widgets/text_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: text(context, "Home", .04, CustomColors.customBlack),
      ),
    );
  }
}
