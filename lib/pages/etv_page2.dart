import 'package:cpn_app/helpers/clase_data.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class ETVPage2 extends StatefulWidget {
  final Data data;

  const ETVPage2({Key key, this.data}) : super(key: key);
  @override
  _ETVPage2State createState() => _ETVPage2State();
}

class _ETVPage2State extends State<ETVPage2> {
  @override
  void initState() {
    print(widget.data.score);
    super.initState();
  }

  bool _selected = false;
  bool _selected2 = false;
  bool _selected3 = false;
  bool _selected4 = false;
  bool _selected5 = false;
  bool _selected6 = false;

  int a = 0, b = 0, c = 0, d = 0, e = 0, f = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(fontSize: 20, color: Colors.pink);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Riesgo ETV Prenatal',
              style: estilo,
            )),
            Padding(padding: EdgeInsets.all(20)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Factores de riesgo en antecedentes personales',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.pink,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
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
                      b = 0;
                      value ? a = 1 : a = 0;
                    });
                  }),
            ),
            Card(
              elevation: 9,
              child: ListTileSwitch(
                  title: Text(
                    'Trombofilia de bajo riesgo',
                    style: estilo,
                  ),
                  value: _selected2,
                  switchActiveColor: Colors.yellow[600],
                  onChanged: (value) {
                    setState(() {
                      _selected2 = value;
                      _selected = false;
                      a = 0;
                      value ? b = 1 : b = 0;
                    });
                  }),
            ),
            Card(
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
                      value ? c = 1 : c = 0;
                    });
                  }),
            ),
            Card(
              elevation: 9,
              child: ListTileSwitch(
                  title: Text('Diagnostico actual de COVID19', style: estilo),
                  value: _selected4,
                  onChanged: (value) {
                    setState(() {
                      _selected4 = value;
                      value ? d = 1 : d = 0;
                    });
                  }),
            ),
            Card(
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
                      value ? e = 1 : e = 0;
                    });
                  }),
            ),
            newMethod(estilo, _selected6, 'Venas varicosas gruesas', f),
            Text('${riskScoreCalc() + widget.data.score}')

            //Text('${data.score}')
          ],
        ),
      ),
    );
  }

  Padding newMethod(TextStyle estilo, bool value, String title, int x) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.maxFinite,
        child: Card(
          elevation: 9,
          child: ListTileSwitch(
              title: Text(
                title,
                style: estilo,
              ),
              value: value,
              switchActiveColor: Colors.green[300],
              onChanged: (value) {
                setState(() {
                  _selected6 = value;
                  value ? x = 1 : x = 0;
                });
              }),
        ),
      ),
    );
  }

  int riskScoreCalc() {
    int totalrisk = a + b + c + d + e + f;
    return totalrisk;
  }
}
