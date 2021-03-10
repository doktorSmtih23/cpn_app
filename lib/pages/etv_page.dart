import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ETVPage extends StatefulWidget {
  @override
  _ETVPageState createState() => _ETVPageState();
}

class _ETVPageState extends State<ETVPage> {

  var pesoD = 0.0, tallaD = 0.0, imcD = 0.0, imcR = 0.0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final edad = new TextEditingController(text: '');
  final peso = new TextEditingController(text: '');
  final talla = new TextEditingController(text: '');
  final nrocigarillos = new TextEditingController(text: '');
  final nrodepartos = new TextEditingController(text: '');

  TextStyle estilo = TextStyle(fontSize: 26, color: Colors.pink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'Riesgo ETV Prenatal',
              style: estilo,
            )),
            Padding(padding: EdgeInsets.all(20)),
            TextFieldWidget(
              etiqueta: 'Edad',
              teclado: TextInputType.number,
              icon: FontAwesome5Solid.calendar,
              textcontroller: edad,
            ),
            TextFieldWidget(
              etiqueta: 'Peso en kg',
              teclado: TextInputType.number,
              icon: FontAwesome5Solid.weight,
              textcontroller: peso,
            ),
            TextFieldWidget(
              etiqueta: 'Talla en cm',
              teclado: TextInputType.number,
              icon: FontAwesome5Solid.ruler_vertical,
              textcontroller: talla,
              onChanged: (e) {
                calcularIMC();
                setState(() {});
              },
            ),
            TextFieldWidget(
              etiqueta: 'Numero de cigarrillos al dia',
              teclado: TextInputType.number,
              icon: FontAwesome5Solid.smoking,
              textcontroller: nrocigarillos,
            ),
            TextFieldWidget(
              etiqueta: 'Numero de partos',
              teclado: TextInputType.number,
              icon: FontAwesome5Solid.baby,
              textcontroller: nrodepartos,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.pink[100]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'IMC   ${calcularIMC()}',
                        style: TextStyle(fontSize: 18, color: Colors.pink),
                      )),
                ),
              ),
            ),
          ]),
    );
  }
   bool checkNumbers() {
    try {
      pesoD = double.parse(peso.text);
      tallaD = double.parse(talla.text);
      return true;
    } on FormatException catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
              "Rellene todos los campos, por favor\nUse punto en lugar de coma para decimales")));

      setState(() {
        imcR = 0.0;
      });
      return false;
    }
  }

  double calcularIMC() {
    if (checkNumbers()) {
      var tallaMts = tallaD / 100.0;

      imcD = pesoD / (tallaMts * tallaMts);
      imcR = double.parse(imcD.toStringAsFixed(2));

      if (imcD > 100) {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text("La talla debe estar en cm")));
        setState(() {
          imcR = 0.0;
        });
      }
    }
    return imcR;
  }

}

class TextFieldWidget extends StatelessWidget {
  final String etiqueta;
  final IconData icon;
  final TextInputType teclado;
  final Function onChanged;
  final TextEditingController textcontroller;

  const TextFieldWidget(
      {this.etiqueta,
      this.icon,
      this.teclado,
      this.onChanged,
      this.textcontroller});

  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(
      fontSize: 18,
      color: Colors.pink,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: Colors.pink[100], borderRadius: BorderRadius.circular(10)),
        child: TextField(
          style: estilo,
          keyboardType: teclado,
          decoration: InputDecoration(
            prefixIcon: Icon(this.icon),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusColor: Colors.pink,
            hintText: this.etiqueta,
          ),
          onChanged: this.onChanged,
          controller: this.textcontroller,
        ),
      ),
    );
  }
}
