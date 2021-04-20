import 'package:cpn_app/widgets/boton_simple.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextStyle title = TextStyle(fontSize: 20, color: Colors.pink[600]);
    TextStyle title2 = TextStyle(
        fontSize: 26, fontWeight: FontWeight.w800, color: Colors.white);

    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/emb2.jpg'), fit: BoxFit.cover)),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(padding: EdgeInsets.all(20)),
          GlassContainer(
            color: Colors.grey,
            width: 300,
            height: 80,
            blurStrengthX: 10,
            blurStrengthY: 10,
            colorOpacity: 0.35,
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
            child: Center(
                child: Text(
              'Calculo \n\ Edad  Gestacional',
              textAlign: TextAlign.center,
              style: title2,
            )),
          ),
          Padding(padding: EdgeInsets.only(top: 40, bottom: 70)),
          Center(
            child: GlassContainer(
              width: 300,
              height: 300,
              color: Colors.grey,
              blurStrengthX: 10,
              blurStrengthY: 10,
              colorOpacity: 0.35,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  15,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(10)),
                    BotonAzul(
                        ancho: 200,
                        etiqueta: 'Edad gestacional \n\ por FUM',
                        presionar: () {
                          Navigator.pushNamed(context, 'fumwidget');
                        }),
                    Padding(padding: EdgeInsets.all(30)),
                    BotonAzul(
                        ancho: 200,
                        etiqueta: 'Edad gestacional \n\ por Ecografia',
                        presionar: () {
                          Navigator.pushNamed(context, 'ecowidget');
                        }),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'intro');
                    })),
          ),
        ],
      ),
    ])));
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
