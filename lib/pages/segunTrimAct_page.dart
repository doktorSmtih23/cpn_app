import 'package:cpn_app/widgets/ecografiasWidget.dart';
import 'package:cpn_app/widgets/paraclinicosWidget.dart';
import 'package:cpn_app/widgets/suplementos.dart';
import 'package:cpn_app/widgets/vacunas.dart';
import 'package:cpn_app/widgets/valoracionesWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SegundTrimActPage extends StatelessWidget {
  TextStyle estilo = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(46, 125, 50, 90));
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Segundo Trimestre', textAlign: TextAlign.center),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(255, 241, 118, 10),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: queryData.size.height * 0.015),
                Text('Paraclinicos', style: estilo),
                SizedBox(height: queryData.size.height * 0.025),
                ListParacWidget(queryData: queryData),
                Text('Ecografias', style: estilo),
                SizedBox(height: queryData.size.height * 0.015),
                ListEcogWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.022),
                Text('Vacunas', style: estilo),
                SizedBox(height: queryData.size.height * 0.011),
                ListVacunasWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.13),
                HomeButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListSuplemWidget extends StatelessWidget {
  const ListSuplemWidget({
    Key key,
    @required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: queryData.size.height * 0.10, child: SuplementosWidget());
  }
}

class ListVacunasWidget extends StatelessWidget {
  const ListVacunasWidget({
    Key key,
    @required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: queryData.size.height * 0.29,
        width: queryData.size.width * 0.8,
        child: VacunasWidget());
  }
}

class ListEcogWidget extends StatelessWidget {
  const ListEcogWidget({
    Key key,
    @required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: queryData.size.height * 0.09,
        child: EcografiasWidget(
          ecografias: [
            Text('Ecografia Tercer Nivel\n (18-23.6 semanas)'),
          ],
        ));
  }
}

class ListParacWidget extends StatelessWidget {
  const ListParacWidget({
    Key key,
    @required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: queryData.size.height * 0.10,
        child: ParaclinicosWidget(
          paraclinicos: [
            Text('UroCultivo'),
            Text('PTOG con 75Gr (24 - 28 semanas)')
          ],
        ));
  }
}

class HomeButtonWidget extends StatelessWidget {
  const HomeButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
                backgroundColor: Colors.pink,
                child: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context, 'segundTrim');
                })),
      ),
    ]);
  }
}
