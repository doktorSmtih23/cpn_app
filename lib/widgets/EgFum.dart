import 'package:cpn_app/widgets/trimestreButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class EcoWidget extends StatefulWidget {
  @override
  _EcoWigdetState createState() => _EcoWigdetState();
}

class _EcoWigdetState extends State<EcoWidget> {
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  DateTime _selectedDate;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xf2f2f2f2),
        body: Stack(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 25, left: 25),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Ingrese fecha de Ultima menstruacion',
                      style: TextStyle(color: Colors.pink, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async {
                      DateTime newDateTime = await showRoundedDatePicker(
                        height: queryData.size.height * 0.4,
                        theme: ThemeData(primarySwatch: Colors.pink),
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 1),
                        lastDate: DateTime(DateTime.now().year + 99),
                        borderRadius: 25,
                        onTapDay: (newDateTime, _) {
                          setState(() {
                            _selectedDate = newDateTime;
                          });
                          return true;
                        },
                      ); // return newDateTime;
                    }),
              ),
              mostrarFechas(_selectedDate),
              Padding(padding: EdgeInsets.only(top: 24)),
              Text(
                'Actividades',
                style: TextStyle(color: Colors.pink, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 12)),
              Column(
                children: <Widget>[
                  TrimestreButton(
                    rotulo: 'Primer trimestre\n\ semanas 1 - 13',
                    color: Colors.green,
                    navegador: () {
                      Navigator.pushReplacementNamed(context, 'primerTrim');
                    },
                  ),
                  TrimestreButton(
                    rotulo: 'Segundo trimestre\n\ semanas 14 - 27',
                    color: Colors.yellow[600],
                    navegador: () {
                      Navigator.pushNamed(context, 'segundTrim');
                    },
                  ),
                  TrimestreButton(
                    color: Colors.orange,
                    rotulo: 'Tercer trimestre\n\ semanas 28 - 40',
                    navegador: () {
                      Navigator.pushNamed(context, 'TercerTrim');
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 5)),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'intro');
                    })),
          ),
        ]),
      ),
    );
  }

  Widget mostrarFechas(DateTime fum) {
    var semanas = ((DateTime.now().difference(fum)).inDays ~/ 7);

    var dias = DateTime.now().difference(fum).inDays % 7;

    var duedateY = fum.add(Duration(days: 365));
    var duedateM = fum.subtract(Duration(days: 90));
    var duedateD = fum.add(Duration(days: 7));
    if (DateTime.now().difference(fum).inHours >= 0) {
      return Column(children: <Widget>[
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        FumWidget(selectedDate: _selectedDate),
        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
        EgWidget(semanas: semanas, dias: dias),
        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
        DueDateWidget(
            duedateD: duedateD, duedateM: duedateM, duedateY: duedateY),
      ]);
    } else {
      return Text(
        'Digite nuevamente la fecha de la ultima menstruacion',
        style: TextStyle(color: Colors.pink, fontSize: 18),
        textAlign: TextAlign.center,
      );
    }
  }
}

class DueDateWidget extends StatelessWidget {
  const DueDateWidget({
    Key key,
    @required this.duedateD,
    @required this.duedateM,
    @required this.duedateY,
  }) : super(key: key);

  final DateTime duedateD;
  final DateTime duedateM;
  final DateTime duedateY;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Container(
      height: queryData.size.height * 0.10,
      width: queryData.size.width * 0.80,
      child: Card(
        color: Color(0xf2f2f2f2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: mesEnLetras(duedateM, 'La fecha probable de parto es:'),
        ),
      ),
    );
  }

  //Este metodo retorna el mes en letras
  mesEnLetras(DateTime fum, String fecha) {
    TextStyle estiloMes = TextStyle(
      fontSize: 20,
      color: Colors.pink,
    );
    //duedateM.month es el mes en enteros que retorna el date picker y mediante el switch se pasa a letras
    switch (fum.month) {
      case 1:
        {
          return Text(
            '$fecha ${duedateD.day} Enero ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 2:
        {
          return Text(
            '$fecha ${duedateD.day} Febrero ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 3:
        {
          return Text(
            '$fecha ${duedateD.day} Marzo ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 4:
        {
          return Text(
            '$fecha ${duedateD.day} Abril ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 5:
        {
          return Text(
            '$fecha ${duedateD.day} Mayo ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 6:
        {
          return Text(
            '$fecha ${duedateD.day} Junio ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 7:
        {
          return Text(
            '$fecha ${duedateD.day} Julio ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 8:
        {
          return Text(
            '$fecha ${duedateD.day} Agosto ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;

      case 9:
        {
          return Text(
            '$fecha ${duedateD.day} Septiembre ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 10:
        {
          return Text(
            '$fecha ${duedateD.day} Octubre ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 11:
        {
          return Text(
            '$fecha ${duedateD.day} Noviembre ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 12:
        {
          return Text(
            '$fecha ${duedateD.day} Diciembre ${duedateY.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      default:
    }
  }
}

class EgWidget extends StatelessWidget {
  const EgWidget({
    Key key,
    @required this.semanas,
    @required this.dias,
  }) : super(key: key);

  final int semanas;
  final int dias;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
        height: queryData.size.height * 0.10,
        width: queryData.size.width * 0.82,
        child: Card(
            color: Color(0xf2f2f2f2),
            margin: EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Center(
                child: Text(
              'La edad gestacional es\n\ $semanas Sem, $dias dias',
              style: TextStyle(
                fontSize: 20,
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ))));
  }
}

class FumWidget extends StatelessWidget {
  const FumWidget({
    Key key,
    @required DateTime selectedDate,
  })  : _selectedDate = selectedDate,
        super(key: key);

  final DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    DueDateWidget mesLet;
    mesLet = DueDateWidget(
        duedateD: _selectedDate,
        duedateM: _selectedDate,
        duedateY: _selectedDate);
    return Container(
      height: queryData.size.height * 0.10,
      width: queryData.size.width * 0.82,
      child: Card(
        color: Color(0xf2f2f2f2),
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: mesLet.mesEnLetras(_selectedDate, 'FUM\n'),
          // child: Text(
          //   'FUM \n\ ${_selectedDate.day} ${_selectedDate.month} ${_selectedDate.year}',
          //   style: TextStyle(fontSize: 20, color: Colors.pink[400]),
          //   textAlign: TextAlign.center,
          // ),
        ),
      ),
    );
  }
}
