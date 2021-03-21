import 'package:flutter/material.dart';

import 'package:cpn_app/widgets/boton_simple.dart';

import 'package:cpn_app/widgets/logo.dart';
import 'package:glassmorphism_kit/glassmorphism_kit.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQueryData();
    queryData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Color(0xffF2F2F2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 1.0,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/inicio.jpg'),
                          fit: BoxFit.contain)),
                ),
                Center(
                  child: GlassContainer(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                    alignment: Alignment.center,
                    height: 350,
                    width: 350,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Padding(padding: EdgeInsets.only(top: 10)),
                        Center(child: Logo(text: 'Control prenatal app',
                        )),
                        // Padding(padding: EdgeInsets.only(top: 30)),
                        Container(
                          height: queryData.size.height * 0.065,
                          width: queryData.size.width * 0.65,
                          child: BotonAzul(
                              etiqueta: 'Ingrese',
                              presionar: () {
                                Navigator.of(context).pushNamed('intro');
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
