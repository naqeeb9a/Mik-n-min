import 'package:flutter/material.dart';

import '../../utils/dynamic_sizes.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(Icons.close_rounded),
        ],
      ),
      content: SizedBox(
        width: CustomSizes().dynamicWidth(context, .9),
        height: CustomSizes().dynamicHeight(context, .9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [],
        ),
      ),
      actions: const <Widget>[
        Icon(Icons.arrow_drop_down),
      ],
    );
  }
}
