import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ETVPage extends StatefulWidget {
  @override
  _ETVPageState createState() => _ETVPageState();
}

class _ETVPageState extends State<ETVPage> {
  final edad = new TextEditingController(text: '');
  final peso = new TextEditingController(text: '');
  final talla = new TextEditingController(text: '');
  final nrocigarillos = new TextEditingController(text: '');
  final nrodepartos = new TextEditingController(text: '');

  var pesoD = 0.0,
      tallaD = 0.0,
      imcD = 0.0,
      imcR = 0.0,
      edadD = 0,
      nropartos = 0,
      nrocigD = 0;

  Color colorE, colorC, colorP;
  double riskScore;
  int a = 0, b = 0, c = 0;

  TextStyle estilo = TextStyle(fontSize: 26, color: Colors.pink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: colorE,
              textcontroller: edad,
              onChanged: (e) {
                setState(() {
                  if (double.parse(edad.text) > 35) {
                    a = 1;
                    colorE = Colors.green[100];
                  } else {
                    a = 0;
                    colorE = Colors.pink[100];
                  }
                });
              },
            ),
            TextFieldWidget(
              etiqueta: 'Peso en kg',
              teclado: TextInputType.number,
              icon: FontAwesome5Solid.weight,
              textcontroller: peso,
              color: Colors.pink[100],
              onChanged: (e) {
                calcularIMC();
                setState(() {});
              },
            ),
            TextFieldWidget(
              etiqueta: 'Talla en cm',
              teclado: TextInputType.number,
              icon: FontAwesome5Solid.ruler_vertical,
              textcontroller: talla,
              color: Colors.pink[100],
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
              color: colorC,
              onChanged: (c) {
                setState(() {
                  if (double.parse(nrocigarillos.text) > 10) {
                    b = 1;
                    colorC = Colors.green[100];
                  } else {
                    b = 0;
                    colorC = Colors.pink[100];
                  }
                });
              },
            ),
            TextFieldWidget(
              etiqueta: 'Numero de partos',
              teclado: TextInputType.number,
              icon: FontAwesome5Solid.baby,
              textcontroller: nrodepartos,
              color: colorP,
              onChanged: (p) {
                setState(() {
                  if (double.parse(nrodepartos.text) > 2) {
                    c = 1;
                    colorP = Colors.green[100];
                  } else {
                    c = 0;
                    colorP = Colors.pink[100];
                  }
                  riskScoreCalc();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 290,
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
            Text(
              'Risk score es ${riskScoreCalc()}',
              style: estilo,
            )
          ]),
    );
  }

  bool checkNumbers() {
    try {
      pesoD = double.parse(peso.text);
      tallaD = double.parse(talla.text);
      return true;
    } on FormatException catch (e) {
      setState(() {
        imcR = 0.0;
        pesoD = 0.0;
        tallaD = 0.0;
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
        setState(() {
          imcR = 0.0;
        });
      }
    }
    return imcR;
  }

  int riskScoreCalc() {
    int totalrisk = a + b + c;
    return totalrisk;
  }
}

class TextFieldWidget extends StatelessWidget {
  final String etiqueta;
  final IconData icon;
  final TextInputType teclado;
  final Function onChanged;
  final Function onSubmitted;
  final TextEditingController textcontroller;
  Color color = Colors.pink[100];

  TextFieldWidget(
      {this.etiqueta,
      this.icon,
      this.teclado,
      this.onChanged,
      this.onSubmitted,
      this.textcontroller,
      this.color});

  @override
  Widget build(BuildContext context) {
    TextStyle estilo = TextStyle(
      fontSize: 18,
      color: Colors.pink,
    );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 290,
        decoration: BoxDecoration(
            color: this.color, borderRadius: BorderRadius.circular(10)),
        child: TextFormField(
          autocorrect: true,
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
