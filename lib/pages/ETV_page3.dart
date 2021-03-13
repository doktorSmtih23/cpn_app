import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:cpn_app/helpers/clase_data.dart';

class ETVPage3 extends StatefulWidget {
  final Data data;

  const ETVPage3({this.data});

  @override
  _ETVPage3State createState() => _ETVPage3State();
}

class _ETVPage3State extends State<ETVPage3> {
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
  int mrs1 = 0;
  int hrs1 = 0;
  int hrs2 = 0;
  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(fontSize: 20);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
                child: Text(
              'Riesgo ETV Prenatal',
              style: estilo,
            )),
            // Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Antecedente personal de ETV previa',
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
                        title: Text('Ningun antecedente',
                            style: estilo, textAlign: TextAlign.justify),
                        value: _selected,
                        switchActiveColor: Colors.blue[200],
                        onChanged: (value) {
                          setState(() {
                            _selected = value;
                            _selected2 = false;
                            _selected3 = false;
                            _selected4 = false;
                            colorD = Colors.pink[100];
                            hrs1 = 0;
                            mrs1 = 0;
                            if (value) {
                              colorC = Colors.pink[100];
                              hrs1 = 0;
                              hrs2 = 0;
                              mrs1 = 0;
                              b = 0;
                            } else {
                              a = 0;
                              colorC = Colors.pink[100];
                            }
                          });
                        }),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                  width: 350,
                  // color: colorD,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Un solo episodio de ETV previa',
                            style: estilo,
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                      Container(
                        width: 350,
                        color: colorD,
                        child: Card(
                          elevation: 9,
                          child: ListTileSwitch(
                              title: Text(
                                'Si',
                                style: estilo,
                              ),
                              value: _selected2,
                              switchActiveColor: Colors.red[300],
                              onChanged: (value) {
                                setState(() {
                                  _selected2 = value;
                                  _selected = false;
                                  _selected3 = false;
                                  _selected4 = false;
                                  colorC = Colors.pink[100];
                                  if (value) {
                                    hrs1 = 1;
                                    hrs2 = 0;
                                    mrs1 = 0;
                                    colorD = Colors.red[300];
                                  } else {
                                    hrs1 = 0;
                                    colorD = Colors.pink[100];
                                  }
                                });
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          width: 350,
                          color: colorE,
                          child: Card(
                            elevation: 9,
                            child: ListTileSwitch(
                                title: Text('Si y asociada a cirugia mayor',
                                    style: estilo,
                                    textAlign: TextAlign.justify),
                                value: _selected3,
                                switchActiveColor: Colors.yellow[600],
                                onChanged: (value) {
                                  setState(() {
                                    _selected3 = value;
                                    _selected = false;
                                    _selected2 = false;
                                    _selected4 = false;
                                    if (value) {
                                      mrs1 = 1;
                                      hrs1 = 0;
                                      hrs2 = 0;
                                      colorE = Colors.yellow[600];
                                    } else {
                                      mrs1 = 0;
                                      colorE = Colors.pink[100];
                                    }
                                  });
                                }),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 350,
                color: colorF,
                child: Card(
                  elevation: 9,
                  child: ListTileSwitch(
                      title: Text('Mas de un episodio de ETV previa',
                          style: estilo, textAlign: TextAlign.justify),
                      value: _selected4,
                      onChanged: (value) {
                        setState(() {
                          _selected4 = value;
                          _selected = false;
                          _selected2 = false;
                          _selected3 = false;

                          if (value) {
                            hrs2 = 1;
                            hrs1 = 0;
                            mrs1 = 0;
                            colorF = Colors.blue[200];
                          } else {
                            hrs2 = 0;
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
                        'Familiar con ETV no asociada a factores de riesgo o familiar de primer grado con ETV asociada a la toma de estrogenos',
                        textAlign: TextAlign.justify,
                        style: estilo,
                      ),
                      value: _selected5,
                      switchActiveColor: Colors.green[300],
                      onChanged: (value) {
                        setState(() {
                          _selected5 = value;
                          if (value) {
                            lrs1 = 1;
                            colorG = Colors.green[300];
                          } else {
                            lrs1 = 0;
                            colorG = Colors.pink[100];
                          }
                        });
                      }),
                ),
              ),
            ),
            Card(
              elevation: 9,
              child: Container(
                width: 350,
                color: Color.fromRGBO(220, 250, 170, 0.2),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      'Factores a considerar ${widget.data.lowRiskScore + lrs1}',
                      style: TextStyle(color: Colors.green[600], fontSize: 24),
                    )),
                    Center(
                      child: Text(
                        'Riesgo intermedio ${widget.data.intermediumRiskScore + mrs1}',
                        style:
                            TextStyle(color: Colors.yellow[600], fontSize: 24),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Riesgo alto ${riskScoreCalc()}',
                        style: TextStyle(color: Colors.red[400], fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    elevation: 9,
                    child: Container(
                      color: Colors.pink[100],
                      child: IconButton(
                          icon: Icon(FontAwesome5Solid.arrow_left),
                          onPressed: () {
                            setState(() {
                              widget.data.lowRiskScore =
                                  widget.data.lowRiskScore + lrs2 + lrs2;
                              widget.data.intermediumRiskScore =
                                  riskScoreCalc();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ETVPage3(data: widget.data),
                                ),
                              );
                            });
                          }),
                    )),
                SizedBox(
                  width: 100,
                ),
                Card(
                    elevation: 9,
                    child: Container(
                      color: Colors.pink[100],
                      child: IconButton(
                          icon: Icon(FontAwesome5Solid.arrow_right),
                          onPressed: () {
                            setState(() {
                              widget.data.lowRiskScore =
                                  widget.data.lowRiskScore + lrs2 + lrs2;
                              widget.data.intermediumRiskScore =
                                  riskScoreCalc();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ETVPage3(data: widget.data),
                                ),
                              );
                            });
                          }),
                    )),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10))
          ],
        ),
      ),
    );
  }

  int riskScoreCalc() {
    int totalrisk = hrs1 + hrs2;
    return totalrisk;
  }
}
