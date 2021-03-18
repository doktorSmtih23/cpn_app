
import 'package:flutter/material.dart';
import 'package:cpn_app/widgets/boton_simple.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BotonAzul(
                  ancho: 200,
                  etiqueta: 'Control Prenatal',
                  presionar: () => Navigator.of(context).pushNamed('home')),
              Padding(padding: EdgeInsets.all(10)),
              BotonAzul(
                  ancho: 200,
                  etiqueta: 'Riesgo ETV',
                  presionar: () => Navigator.of(context).pushNamed('ETV_page')),
              Padding(padding: EdgeInsets.all(10)),
              BotonAzul(
                  ancho: 200,
                  etiqueta: 'IMC',
                  presionar: () => Navigator.of(context).pushNamed('imc_page'))
            ],
          ),
        ),
      ),
    );
  }
}
