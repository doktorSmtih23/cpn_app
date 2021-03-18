import 'package:flutter/material.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';

class AppBarWidget extends StatelessWidget {
  final String label;

  const AppBarWidget({this.label});

  @override
  Widget build(BuildContext context) {
    TextStyle title = TextStyle(fontSize: 24, color: Colors.white);
    return GlassBar(
        title: Text(
          this.label,
          style: title,
        ),
        color: Colors.white,
        colorOpacity: 0.7,
        actions: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'intro');
                }),
          ]),
        ]);
  }
}
