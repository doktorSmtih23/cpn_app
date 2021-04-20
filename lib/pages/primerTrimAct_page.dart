import 'package:cpn_app/widgets/appbar.dart';
import 'package:cpn_app/widgets/ecografiasWidget.dart';
import 'package:cpn_app/widgets/paraclinicosWidget.dart';
import 'package:cpn_app/widgets/suplementos.dart';
import 'package:cpn_app/widgets/vacunas.dart';
import 'package:cpn_app/widgets/valoracionesWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimerTrimActPage extends StatelessWidget {
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
          centerTitle: true,
          actions: [
            AppBarWidget(
              label: 'Primer Trimestre',
            )
          ],
        ),
        backgroundColor: Color.fromRGBO(236, 231, 241, 10),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: queryData.size.height * 0.015),
                Text('Paraclinicos', style: estilo),
                SizedBox(height: queryData.size.height * 0.010),
                ListParacWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.025),
                Text('Ecografias', style: estilo),
                SizedBox(height: queryData.size.height * 0.025),
                ListEcogWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.025),
                Text('Valoraciones', style: estilo),
                ListValorWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.015),
                Text('Suplementos', style: estilo),
                SizedBox(height: queryData.size.height * 0.015),
                ListSuplemWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.025),
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
        height: queryData.size.height * 0.20, child: SuplementosWidget());
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
        height: queryData.size.height * 0.14, child: VacunasWidget());
  }
}

class ListValorWidget extends StatelessWidget {
  const ListValorWidget({
    Key key,
    @required this.queryData,
  }) : super(key: key);

  final MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: queryData.size.height * 0.23,
        child: ValoracionesWidget(
          val: [
            Text('Nutricion'),
            Text('Psicologia'),
            Text('Odontologia'),
            Text('Pediatria, si es menor de edad'),
          ],
        ));
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
        height: queryData.size.height * 0.14,
        child: EcografiasWidget(
          ecografias: [
            Text('Ecografia inicial'),
            Text('Ecografia genetica\n semanas 10.6 - 13.6')
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
        height: queryData.size.height * 0.35,
        child: ParaclinicosWidget(
          paraclinicos: [
            Text('Hemograma'),
            Text('HemoClasificacion'),
            Text('UroAnalisis'),
            Text('UroCultivo'),
            Text('Prueba Treponemica Rapida'),
            Text('VIH'),
            Text('Hepatitis B Ag S'),
            Text('Toxoplasma IgG IgM'),
            Text('Rubeola IgG IgM'),
          ],
        ));
  }
}

class HomeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
                backgroundColor: Colors.pink,
                child: Icon(Icons.arrow_back_rounded, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context, 'primerTrim');
                })),
      ),
    ]);
  }
}
