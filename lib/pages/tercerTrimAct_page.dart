import 'package:cpn_app/widgets/ecografiasWidget.dart';
import 'package:cpn_app/widgets/paraclinicosWidget.dart';
import 'package:cpn_app/widgets/valoracionesWidget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TercerTrimActPage extends StatelessWidget {
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
          title: Text('Tercer Trimestre'),
          centerTitle: true,
        ),
        backgroundColor: Color.fromRGBO(255, 183, 77, 25),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: queryData.size.height * 0.015),
                Text('Paraclinicos', style: estilo),
                SizedBox(height: queryData.size.height * 0.025),
                ListParacWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.015),
                Text('Ecografias', style: estilo),
                SizedBox(height: queryData.size.height * 0.015),
                ListEcogWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.05),
                Text('Valoraciones', style: estilo),
                ListValorWidget(queryData: queryData),
                SizedBox(height: queryData.size.height * 0.09),
                HomeButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
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
        height: queryData.size.height * 0.15,
        width: queryData.size.width * .8,
        child: ValoracionesWidget(
          val: [
            Text(
              'Ginecologia a la semana 32,\n si tiene antecedente de Cesarea',
              textAlign: TextAlign.justify,
            )
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
        height: queryData.size.height * 0.09,
        child: EcografiasWidget(
          ecografias: [
            Text(
              'Ecografia Obstetrica\n semanas 32 - 34',
              textAlign: TextAlign.center,
            )
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
        height: queryData.size.height * 0.25,
        width: queryData.size.width * 0.8,
        child: ParaclinicosWidget(
          paraclinicos: [
            Text('Hemograma'),
            Text(
                'Cultivo para Estreptoco del grupo B, por hisopado recto-vaginal, a la semana 35 - 37, si es POSITIVO se debera administrar ampicilina durante el trabajo de parto',
                textAlign: TextAlign.justify),
            Text('VIH'),
            Text('Prueba Treponemica Rapida')
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
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: FloatingActionButton(
                backgroundColor: Colors.pink,
                child: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context, 'tercerTrim');
                })),
      ),
    ]);
  }
}
