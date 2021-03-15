import 'package:flutter/material.dart';

import 'package:cpn_app/widgets/listTitle_widget.dart';

class ETVPage4 extends StatefulWidget {
  @override
  _ETVPage4State createState() => _ETVPage4State();
}

class _ETVPage4State extends State<ETVPage4> {
  bool _selected = false;
  bool _selected2 = false;
  bool _selected3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          ListtitleWidget(
            title: 'ETV previa',
            value: _selected,
            onChanged: (value) {
              setState(() {
                _selected = value;
              });
            },
          ),
          ListtitleWidget(
            title: 'Antecedentes',
            value: _selected2,
            onChanged: (value) {
              setState(() {
                _selected2 = value;
              });
            },
          ),
          ListtitleWidget(
            title: 'Antecedentes',
            value: _selected3,
            onChanged: (value) {
              setState(() {
                _selected3 = value;
              });
            },
          ),
        ],
      )),
    );
  }
}
