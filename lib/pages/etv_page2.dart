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
  final Data data;

  _ETVPage2State({this.data});
  @override
  Widget build(BuildContext context) {
    List<String> antecedentes = [
      'Trombofilia de alto riesgo sin antecedente de ETV previa',
      'Trombofilia de bajo riesgo',
      'Coomorbilidades medicas',
      'Diagnostico actual de COVID19',
      'Adiccion a drogas intravenosas',
      'Venas varicosas gruesas'
    ];

    TextStyle estilo = TextStyle(fontSize: 20, color: Colors.pink);
    bool _antecedente = false;
    List<bool> _switchValues = List.generate(2, (_) => true);
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
            SwitchListTile(
              title: Text('hola mundo'),
              selected: false,
              value: _antecedente,
              onChanged: (value) {
                setState(() {
                  _antecedente = value;
                });
              },
            ),

            ListTileSwitch(
              value: _antecedente,
              leading: const Icon(Icons.access_alarms),
              onChanged: (value) {
                setState(() => _antecedente = value);
              },
              switchActiveColor: Colors.indigo,
              title: const Text(
                'Default Custom Switch',
              ),
            ),
            ListTileSwitch(
              value: _switchValues[1],
              leading: const Icon(Icons.message),
              onChanged: (value) {
                setState(() {
                  _switchValues[1] = value;
                });
              },
              switchActiveColor: Colors.teal,
              switchScale: 0.8,
              title: const Text(
                'Cupertino Switch',
              ),
            ),

            //Text('${data.score}')
          ],
        ),
      ),
    );
  }
}
