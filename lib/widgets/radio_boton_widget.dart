import 'package:flutter/material.dart';

class RadioBotonWidget extends StatelessWidget {
  final String etiqueta;
  final Color color;

  const RadioBotonWidget({@required this.etiqueta, this.color});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(etiqueta),
      checkColor: color,
      value: null, 
      onChanged: null);
  }
}
