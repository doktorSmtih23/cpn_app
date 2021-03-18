import 'package:flutter/material.dart';
import 'package:cpn_app/widgets/boton_simple.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(padding: EdgeInsets.all(8)),
            GlassContainer(
                borderRadius: BorderRadius.circular(15),
                alignment: Alignment.center,
                width: 350,
                height: 60,
                blurStrengthX: 10,
                blurStrengthY: 10,
                color: Colors.pinkAccent,
                colorOpacity: 0.3,
                child: Text(
                  'Control Prenatal  App',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            Container(
              //width: 50,
              height: 659,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/cpn_img.jpg",
                      ),
                      scale: 8.0,
                      fit: BoxFit.fitHeight)),
              child: Center(
                child: GlassContainer(
                  width: 350,
                  height: 350,
                  color: Colors.pinkAccent,
                  blurStrengthX: 10,
                  blurStrengthY: 10,
                  colorOpacity: 0.3,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      15,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        BotonAzul(
                            ancho: 200,
                            etiqueta: 'Control Prenatal',
                            presionar: () =>
                                Navigator.of(context).pushNamed('home')),
                        Padding(padding: EdgeInsets.all(10)),
                        BotonAzul(
                            ancho: 200,
                            etiqueta: 'Riesgo ETV',
                            presionar: () =>
                                Navigator.of(context).pushNamed('ETV_page')),
                        Padding(padding: EdgeInsets.all(10)),
                        BotonAzul(
                            ancho: 200,
                            etiqueta: 'IMC',
                            presionar: () =>
                                Navigator.of(context).pushNamed('imc_page'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
