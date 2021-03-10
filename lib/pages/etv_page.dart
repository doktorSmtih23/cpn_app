import 'package:flutter/material.dart';

import 'package:cpn_app/widgets/radio_boton_widget.dart';

class ETVPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(),
          TextField(),
          TextField(),
          Center(
            child: RadioBotonWidget(
              etiqueta: 'Edad',
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  
  final String etiqueta;

  const TextFieldWidget({
    @required this.etiqueta,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
    );
  }
}
