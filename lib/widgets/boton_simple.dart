import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final String etiqueta;
  final Function presionar;
  final double ancho;

  const BotonAzul(
      {Key key, @required this.etiqueta, @required this.presionar, this.ancho})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: 2,
        highlightElevation: 5,
        color: Colors.pink[300],
        shape: StadiumBorder(),
        onPressed: this.presionar,
        child: Container(
          height: 55,
          width: this.ancho,
          child: Center(
              child: Text(
            this.etiqueta,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          )),
        ));
  }
}
