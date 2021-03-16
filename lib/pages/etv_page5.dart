import 'package:cpn_app/helpers/clase_data.dart';
import 'package:cpn_app/widgets/listTitle_widget.dart';
import 'package:flutter/material.dart';

class ETVPage5 extends StatefulWidget {
  final Data data;

  const ETVPage5({this.data});

  @override
  _ETVPage5State createState() => _ETVPage5State();
}

class _ETVPage5State extends State<ETVPage5> {
  final data = Data(highRiskScore: 0, intermediumRiskScore: 0, lowRiskScore: 0);

  bool _selected = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;
  bool _selected5 = false;

  Color colorA = Colors.pink[300];
  Color colorB = Colors.pink[300];
  Color colorC = Colors.pink[300];
  Color colorD = Colors.pink[300];
  Color colorE = Colors.pink[300];

  int lrs1 = 0;
  int lrs2 = 0;
  int lrs3 = 0;
  int lrs4 = 0;
  int mrs = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Text(
              'Factores de Riesgo antenatales',
              style: TextStyle(fontSize: 26),
            ),
            Text(
              'Datos del embarazo Actual',
              style: TextStyle(fontSize: 20),
            ),
            ListtitleWidget(
              title: 'Embarazo multiple',
              value: _selected,
              color: colorA,
              colorS: Colors.green[300],
              onChanged: (value) {
                _selected = value;
                setState(() {
                  if (value) {
                    lrs1 = 1;
                    colorA = Colors.green[300];
                  } else {
                    lrs1 = 0;
                    colorA = Colors.pink[300];
                  }
                });
              },
            ),
            Text(
              'Embarazo tras TRA/Fertilizacion in vitro',
              style: TextStyle(fontSize: 24),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            ListtitleWidget(
              title: 'Si',
              value: _selected2,
              color: colorB,
              colorS: Colors.green[300],
              onChanged: (value) {
                setState(() {
                  _selected2 = value;
                  _selected3 = false;
                  colorC = Colors.pink[300];
                  mrs = 0;
                  if (value) {
                    lrs1 = 1;
                    colorB = Colors.green[300];
                  } else {
                    lrs1 = 0;
                    colorB = Colors.pink[300];
                  }
                });
              },
            ),
            ListtitleWidget(
              title: 'Si y con sindrome de hiperestimulacion ovarica',
              value: _selected3,
              color: colorC,
              colorS: Colors.yellow[600],
              onChanged: (value) {
                setState(() {
                  _selected3 = value;
                  _selected2 = false;
                  colorB = Colors.pink[300];
                  lrs1 = 0;
                  if (value) {
                    mrs = 1;
                    colorC = Colors.yellow[600];
                  } else {
                    mrs = 0;
                    colorC = Colors.pink[300];
                  }
                });
              },
            ),
            ListtitleWidget(
              title: 'Embarazo complicado con pre eclampsia',
              value: _selected4,
              color: colorD,
              colorS: Colors.yellow[600],
              onChanged: (value) {
                setState(() {
                  _selected4 = value;
                  lrs1 = 0;
                  if (value) {
                    mrs = 1;
                    colorD = Colors.yellow[600];
                  } else {
                    mrs = 0;
                    colorD = Colors.pink[300];
                  }
                });
              },
            ),
            ListtitleWidget(
              title: 'Deshidratacion o hiperemesis gravidica',
              value: _selected5,
              color: colorE,
              colorS: Colors.green[300],
              onChanged: (value) {
                setState(() {
                  _selected5 = value;
                  lrs1 = 0;
                  if (value) {
                    lrs4 = 1;
                    colorE = Colors.green[300];
                  } else {
                    lrs4 = 0;
                    colorE = Colors.pink[300];
                  }
                });
              },
            ),
            Card(
              elevation: 9,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 350,
                  child: Text(
                    'Factores a considerar ${data.lowRiskScore}',
                    style: TextStyle(fontSize: 24),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
