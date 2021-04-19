import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String text;

  const Logo({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Text(
            this.text,
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w400,
                color: Colors.pink[300]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
