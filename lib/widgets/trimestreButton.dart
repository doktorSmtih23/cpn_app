import 'package:flutter/material.dart';

class TrimestreButton extends StatelessWidget {
  final String rotulo;
  final Function navegador;
  final Color color;
  final Widget child;

  const TrimestreButton({
    Key key,
    this.rotulo,
    this.navegador,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    TextStyle estilo = TextStyle(
      fontSize: 18,
      color: Colors.white,
    );
    TextAlign centrado = TextAlign.center;
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 8, right: 10, left: 10),
      child: Container(
        height: queryData.size.height*.085,
        width: queryData.size.width * 0.82,
        child: RaisedButton(
            elevation: 9,
            color: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Text(
              rotulo,
              style: estilo,
              textAlign: centrado,
            ),
            onPressed: navegador),
      ),
    );
  }
}
