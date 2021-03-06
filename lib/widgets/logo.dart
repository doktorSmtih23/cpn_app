import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final String text;

  const Logo({
    Key key,
    @required this.text
    }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Image(image: AssetImage('assets/cpn_img.jpg'),height:200,fit: BoxFit.cover,),
          SizedBox(height: 30),
          Text(this.text, style: TextStyle(fontSize: 30,fontWeight: FontWeight.w300,color: Colors.pink[300]),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
