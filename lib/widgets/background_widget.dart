import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(224, 224, 224, 1.0),
                ),
                width: 250,
                height: 150,
              ),
              Container(
                width: 250,
                height: 850,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 204, 229, 0.8),
                    borderRadius: BorderRadius.circular(50)),
              ),
              this.child,
            ],
          )
        ],
      ),
    );
  }
}
