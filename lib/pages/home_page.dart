import 'package:flutter/material.dart';

import 'package:cpn_app/widgets/appbar.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';
import 'package:glassmorphism/glassmorphism.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextStyle title = TextStyle(fontSize: 20, color: Colors.pink[600]);
    TextStyle title2 = TextStyle(
        fontSize: 26, fontWeight: FontWeight.w800, color: Colors.pink[600]);
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            //backgroundColor: Color(0xf2f2f2f2),
            body: Column(
      children: <Widget>[
        Container(
          height: queryData.size.height * .968,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/emb2.jpg",
                  ),
                  scale: 8.0,
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              GlassBar(
                color: Colors.white,
                colorOpacity: 0.3,
                blurStrengthX: 10,
                blurStrengthY: 10,
                title: Text(
                  'Control Prenatal App',
                  style: title2,
                ),
              ),
              Padding(padding: EdgeInsets.all(40)),
              GlassContainer(
                width: 350,
                height: 60,
                child: Center(
                    child: Text(
                  'Calculo de Edad  Gestacional',
                  style: title2,
                )),
              ),
              Padding(padding: EdgeInsets.all(30)),
              GlassContainer(
                borderRadius: BorderRadius.circular(15),
                blurStrengthX: 6,
                blurStrengthY: 6,
                height: 350,
                width: 350,
                color: Colors.pinkAccent,
                colorOpacity: 0.19,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 80)),
                      ButtonFUM(
                          title: title, label: 'Edad gestacional por\n\ FUM'),
                      Padding(padding: EdgeInsets.only(bottom: 40)),
                      ButtonEco(
                          title: title,
                          label: 'Edad gestacional por\n\ Ecografia'),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        //Padding(padding: EdgeInsets.only(top: 80)),
      ],
    )));
  }
}

class ButtonFUM extends StatelessWidget {
  final String label;
  const ButtonFUM({
    Key key,
    @required this.title,
    @required this.label,
  }) : super(key: key);

  final TextStyle title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      height: queryData.size.height * .09,
      width: queryData.size.width * .8,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          autofocus: false,
          highlightColor: Colors.amber,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: title,
          ),
          onPressed: () => Navigator.pushNamed(context, 'fumwidget')),
    );
  }
}

class ButtonEco extends StatelessWidget {
  final String label;
  const ButtonEco({
    Key key,
    @required this.title,
    @required this.label,
  }) : super(key: key);

  final TextStyle title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      height: queryData.size.height * .09,
      width: queryData.size.width * .8,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          autofocus: false,
          highlightColor: Colors.amber,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: title,
          ),
          onPressed: () => Navigator.pushNamed(context, 'ecowidget')),
    );
  }
}
