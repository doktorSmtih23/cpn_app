import 'package:flutter/material.dart';
import 'package:cpn_app/widgets/boton_simple.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/emb2.jpg'), fit: BoxFit.cover)),
            ),
            Column(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                GlassContainer(
                    borderRadius: BorderRadius.circular(15),
                    alignment: Alignment.center,
                    width: 350,
                    height: 60,
                    blurStrengthX: 10,
                    blurStrengthY: 10,
                    color: Colors.grey,
                    colorOpacity: 0.35,
                    child: Text(
                      'Control Prenatal  App',
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                SizedBox(
                  height: queryData.size.height * 0.25,
                ),
                Center(
                  child: GlassContainer(
                    width: 350,
                    height: 350,
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
                          BotonAzul(
                              ancho: 200,
                              etiqueta: 'Control Prenatal',
                              presionar: () =>
                                  Navigator.of(context).pushNamed('home')),
                          Padding(padding: EdgeInsets.all(30)),
                          BotonAzul(
                              ancho: 200,
                              etiqueta: 'Riesgo ETV',
                              presionar: () =>
                                  Navigator.of(context).pushNamed('ETV_page')),
                          Padding(padding: EdgeInsets.all(10)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
