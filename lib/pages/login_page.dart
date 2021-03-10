import 'package:flutter/material.dart';

import 'package:cpn_app/widgets/boton_simple.dart';

import 'package:cpn_app/widgets/logo.dart';

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
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Center(child: Logo(text: 'Control prenatal app')),
                  Padding(padding: EdgeInsets.only(top: 30)),
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
        ));
  }
}
