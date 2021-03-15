import 'package:cpn_app/pages/ETV_page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:list_tile_switch/list_tile_switch.dart';

import 'package:cpn_app/helpers/clase_data.dart';

class ETVPage2 extends StatefulWidget {
  final Data data;

  const ETVPage2({Key key, this.data}) : super(key: key);
  @override
  _ETVPage2State createState() => _ETVPage2State();
}

class _ETVPage2State extends State<ETVPage2> {
  final data = Data(lowRiskScore: 0);
  bool _selected = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;
  bool _selected5 = false;
  bool _selected6 = false;

  Color colorC, colorD, colorE, colorF, colorG, colorH = Colors.pink[100];

  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  int e = 0;
  int f = 0;
  int lrs1 = 0;
  int lrs2 = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(fontSize: 18, color: Colors.pink);
    TextStyle estilo2 = TextStyle(
        fontSize: 24, color: Colors.pink, fontWeight: FontWeight.bold);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Text(
              'Riesgo ETV Prenatal',
              style: estilo2,
            )),
            // Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Factores de riesgo en antecedentes personales',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                    color: colorC, borderRadius: BorderRadius.circular(10)),
                child: Card(
                  elevation: 9,
                  child: ListTileSwitch(
                      title: Text(
                        'Trombofilia de alto riesgo sin antecedente de ETV previa',
                        style: estilo,
                      ),
                      value: _selected,
                      switchActiveColor: Colors.yellow[600],
                      onChanged: (value) {
                        setState(() {
                          _selected = value;
                          _selected2 = false;
                          colorD = Colors.pink[100];
                          b = 0;
                          if (value) {
                            a = 1;
                            colorC = Colors.yellow[600];
                            lrs1 = 0;
                          } else {
                            a = 0;
                            colorC = Colors.pink[100];
                          }
                        });
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 350,
                color: colorD,
                child: Card(
                  elevation: 9,
                  child: ListTileSwitch(
                      title: Text(
                        'Trombofilia de bajo riesgo',
                        style: estilo,
                      ),
                      value: _selected2,
                      switchActiveColor: Colors.green[300],
                      onChanged: (value) {
                        setState(() {
                          _selected2 = value;
                          _selected = false;
                          colorC = Colors.pink[100];
                          a = 0;
                          if (value) {
                            lrs1 = 1;
                            colorD = Colors.green[300];
                          } else {
                            lrs1 = 0;
                            colorD = Colors.pink[100];
                          }
                        });
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 350,
                color: colorE,
                child: Card(
                  elevation: 9,
                  child: ListTileSwitch(
                      title: Text(
                        'Coomorbilidades medicas',
                        style: estilo,
                      ),
                      value: _selected3,
                      switchActiveColor: Colors.yellow[600],
                      onChanged: (value) {
                        setState(() {
                          _selected3 = value;
                          if (value) {
                            c = 1;
                            colorE = Colors.yellow[600];
                          } else {
                            c = 0;
                            colorE = Colors.pink[100];
                          }
                        });
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 350,
                color: colorF,
                child: Card(
                  elevation: 9,
                  child: ListTileSwitch(
                      title:
                          Text('Diagnostico actual de COVID19', style: estilo),
                      value: _selected4,
                      onChanged: (value) {
                        setState(() {
                          _selected4 = value;

                          if (value) {
                            d = 1;
                            colorF = Colors.blue[200];
                          } else {
                            d = 0;
                            colorF = Colors.pink[100];
                          }
                        });
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 350,
                color: colorG,
                child: Card(
                  elevation: 9,
                  child: ListTileSwitch(
                      title: Text(
                        'Adiccion a drogas intravenosas',
                        style: estilo,
                      ),
                      value: _selected5,
                      switchActiveColor: Colors.yellow[600],
                      onChanged: (value) {
                        setState(() {
                          _selected5 = value;
                          if (value) {
                            e = 1;
                            colorG = Colors.yellow[600];
                          } else {
                            e = 0;
                            colorG = Colors.pink[100];
                          }
                        });
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 350,
                color: colorH,
                child: Card(
                  elevation: 9,
                  child: ListTileSwitch(
                      title: Text(
                        'Venas varicosas gruesas',
                        style: estilo,
                      ),
                      value: _selected6,
                      switchActiveColor: Colors.green[300],
                      onChanged: (value) {
                        setState(() {
                          _selected6 = value;

                          if (value) {
                            lrs2 = 1;
                            colorH = Colors.green[300];
                          } else {
                            lrs2 = 0;
                            colorH = Colors.pink[100];
                          }
                        });
                      }),
                ),
              ),
            ),
            Text(
              'Factores de riesgo a considerar ${widget.data.lowRiskScore + lrs1 + lrs2}',
              style: estilo,
            ),
            Text(
              'Factores de riesgo intermedio ${riskScoreCalc()}',
              style: estilo,
            ),
            Card(
                elevation: 9,
                child: IconButton(
                    icon: Icon(FontAwesome5Solid.arrow_right),
                    onPressed: () {
                      if (data.lowRiskScore != null) {
                        setState(() {
                          data.lowRiskScore =
                              widget.data.lowRiskScore + lrs2 + lrs2;
                          data.intermediumRiskScore = riskScoreCalc();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ETVPage3(data: data),
                            ),
                          );
                        });
                      } else {
                        Center(
                            child:
                                Text('Diligencie todos los campos por favor'));
                      }
                    }))
          ],
        ),
      ),
    );
  }

  int riskScoreCalc() {
    int totalrisk = a + b + c + d + e;
    return totalrisk;
  }
}
