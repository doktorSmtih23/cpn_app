import 'package:cpn_app/helpers/clase_data.dart';
import 'package:flutter/material.dart';

import 'package:cpn_app/widgets/listTitle_widget.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'ETV_page3.dart';

class ETVPage4 extends StatefulWidget {
  final Data data;

  const ETVPage4({this.data});

  @override
  _ETVPage4State createState() => _ETVPage4State();
}

class _ETVPage4State extends State<ETVPage4> {
  final data = Data(lowRiskScore: 0, intermediumRiskScore: 0, highRiskScore: 0);

  bool _selected = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected5 = false;
  bool _selected6 = false;

  Color colorA = Colors.pink[100];
  Color colorB = Colors.pink[100];
  Color colorC = Colors.pink[100];
  Color colorD = Colors.pink[100];
  Color colorE = Colors.pink[100];

  int lrs1 = 0;
  int lrs2 = 0;
  int lrs3 = 0;
  int mrs1 = 0;
  int mrs2 = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Column(
          children: [
            Text(
              'Inmovilizacion',
              style: TextStyle(fontSize: 24),
            ),
            ListtitleWidget(
              title: 'Viaje de larga distancia',
              value: _selected,
              color: colorA,
              colorS: Colors.green[300],
              onChanged: (value) {
                setState(() {
                  _selected = value;
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
            ListtitleWidget(
              title: 'Paciente sufre de inmovilidad',
              value: _selected2,
              color: colorB,
              colorS: Colors.green[300],
              onChanged: (value) {
                setState(() {
                  _selected2 = value;
                  if (value) {
                    lrs2 = 1;
                    colorB = Colors.green[300];
                  } else {
                    lrs2 = 0;
                    colorB = Colors.pink[300];
                  }
                });
              },
            ),
            Text(
              'Patologia medica o quirurgica',
              style: TextStyle(fontSize: 24),
            ),
            ListtitleWidget(
              title: 'Ingreso hospitalario',
              value: _selected3,
              color: colorC,
              colorS: Colors.yellow[600],
              onChanged: (value) {
                setState(() {
                  _selected3 = value;
                  if (value) {
                    mrs1 = 1;
                    colorC = Colors.yellow[600];
                  } else {
                    mrs1 = 0;
                    colorC = Colors.pink[300];
                  }
                });
              },
            ),
            ListtitleWidget(
              title: 'Cirugia mayor no obstetrica durante el embarazo',
              value: _selected5,
              color: colorD,
              colorS: Colors.yellow[600],
              onChanged: (value) {
                setState(() {
                  _selected5 = value;
                  if (value) {
                    mrs2 = 1;
                    colorD = Colors.yellow[600];
                  } else {
                    mrs2 = 0;
                    colorD = Colors.pink[300];
                  }
                });
              },
            ),
            ListtitleWidget(
              title: 'Infeccion sistemica actual',
              value: _selected6,
              color: colorE,
              colorS: Colors.green[300],
              onChanged: (value) {
                setState(() {
                  _selected6 = value;
                  if (value) {
                    lrs3 = 1;
                    colorE = Colors.green[300];
                  } else {
                    lrs3 = 0;
                    colorE = Colors.pink[300];
                  }
                });
              },
            ),
            Text('${widget.data.lowRiskScore + lrsCalc()}'),
            Text('${widget.data.intermediumRiskScore + mrsCalc()}'),
            //Text('${widget.data.highRiskScore + mrsCalc()}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(FontAwesome5Solid.arrow_left),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ETVPage3(data: data),
                        ),
                      );
                    }),
                SizedBox(
                  width: 250,
                ),
                IconButton(
                    icon: Icon(FontAwesome5Solid.arrow_right), onPressed: () {})
              ],
            ),
          ],
        )),
      ),
    );
  }

  int lrsCalc() {
    int lsrScore = lrs1 + lrs2 + lrs3;
    return lsrScore;
  }

  int mrsCalc() {
    int msrScore = mrs1 + mrs2;
    return msrScore;
  }
}
