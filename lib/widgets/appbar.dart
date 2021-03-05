import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'loading');
          }),
    ]);
  }
}
