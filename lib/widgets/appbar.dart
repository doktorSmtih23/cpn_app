import 'package:flutter/material.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';

class AppBarWidget extends StatelessWidget {
  final String label;

  const AppBarWidget({this.label});

  @override
  Widget build(BuildContext context) {
    TextStyle title = TextStyle(
      fontSize: 26,
      color: Colors.white,
    );
    return GlassBar(
      title: Text(
        this.label,
        style: title,
        textAlign: TextAlign.center,
      ),
      //color: Colors.white,
      colorOpacity: 0.9,
    );
  }
}
