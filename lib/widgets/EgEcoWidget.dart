import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';


import 'trimestreButton.dart';

class EgWidgetPage extends StatefulWidget {
  @override
  _EgWidgetState createState() => _EgWidgetState();
}

class _EgWidgetState extends State<EgWidgetPage> {
  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    wks = 0;
    dys = 0;
  }

  int wks = 0;
  int dys = 0;
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xf2f2f2f2),
        body: Stack(children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/eco_img.png'),
                    fit: BoxFit.cover)),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 25, right: 25),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        'Ingrese fecha de la Ecografia',
                        style: TextStyle(color: Colors.pink, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () async {
                        DateTime newDateTime = await showRoundedDatePicker(
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
                Padding(padding: EdgeInsets.all(6)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        RaisedButton(
                            child: Text(
                              'Semanas',
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 20),
                            ),
                            onPressed: () {
                              showMaterialNumberPicker(
                                context: context,
                                title: "Numero de semanas",
                                maxNumber: 42,
                                minNumber: 0,
                                selectedNumber: wks,
                                onChanged: (value) =>
                                    setState(() => wks = value),
                              );
                            }),
                        Text('$wks',
                            style: TextStyle(fontSize: 26, color: Colors.pink)),
                      ],
                    ),
                    SizedBox(
                      width: queryData.size.width * .085,
                    ),
                    Column(
                      children: [
                        RaisedButton(
                            child: Text(
                              'Dias',
                              style:
                                  TextStyle(color: Colors.pink, fontSize: 20),
                            ),
                            onPressed: () {
                              showMaterialNumberPicker(
                                headerColor: Colors.pink,
                                buttonTextColor: Colors.pink,
                                context: context,
                                title: 'Numero de dias',
                                maxNumber: 6,
                                minNumber: 0,
                                selectedNumber: dys,
                                onChanged: (value) =>
                                    setState(() => dys = value),
                              );
                            }),
                        Text('$dys',
                            style: TextStyle(fontSize: 26, color: Colors.pink)),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(6)),
                mostrarFechas(_selectedDate),
                Padding(padding: EdgeInsets.only(top: 10)),
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
                        Navigator.pushNamed(context, 'primerTrim');
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'home');
                    })),
          ),
        ]),
      ),
    );
  }

  Widget mostrarFechas(DateTime eco) {
    var ecodays = (wks * 7) + dys;

    var duedateDays = 280 - ecodays;

    var semanas = (((DateTime.now().difference(eco)).inDays + ecodays) ~/ 7);

    var dias = ((DateTime.now().difference(eco).inDays) + dys) % 7;

    var dateActual = DateTime.now().difference(eco).inDays;

    var duedateD = DateTime.now().add(Duration(
        days: duedateDays - dateActual)); //fum.add(Duration(days: 365));

    if (DateTime.now().difference(eco).inHours >= 0) {
      return Column(children: <Widget>[
        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
        FumWidget(selectedDate: _selectedDate),
        Padding(padding: EdgeInsets.symmetric(vertical: 2)),
        EgWidget(semanas: semanas, dias: dias),
        Padding(padding: EdgeInsets.only(bottom: 2)),
        DueDateWidget(duedateD: duedateD),
      ]);
    } else {
      return Text(
        'Digite nuevamente la fecha de la ecografia',
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
  }) : super(key: key);

  final DateTime duedateD;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      height: queryData.size.height * .09,
      width: queryData.size.width * .8,
      child: Card(
        color: Color(0xf2f2f2f2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: mesEnLetras(duedateD, 'La fecha probable de parto es:\n'),
        ),
      ),
    );
  }

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
            '$fecha ${duedateD.day} Enero ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 2:
        {
          return Text(
            '$fecha ${duedateD.day} Febrero ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 3:
        {
          return Text(
            '$fecha ${duedateD.day} Marzo ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 4:
        {
          return Text(
            '$fecha ${duedateD.day} Abril ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 5:
        {
          return Text(
            '$fecha ${duedateD.day} Mayo ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 6:
        {
          return Text(
            '$fecha ${duedateD.day} Junio ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 7:
        {
          return Text(
            '$fecha ${duedateD.day} Julio ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 8:
        {
          return Text(
            '$fecha ${duedateD.day} Agosto ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;

      case 9:
        {
          return Text(
            '$fecha ${duedateD.day} Septiembre ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 10:
        {
          return Text(
            '$fecha ${duedateD.day} Octubre ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 11:
        {
          return Text(
            '$fecha ${duedateD.day} Noviembre ${duedateD.year}',
            style: estiloMes,
            textAlign: TextAlign.center,
          );
        }
        break;
      case 12:
        {
          return Text(
            '$fecha ${duedateD.day} Diciembre ${duedateD.year}',
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
        height: queryData.size.height * .09,
        width: queryData.size.width * .82,
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
    mesLet = DueDateWidget(duedateD: _selectedDate);
    return Container(
      height: queryData.size.height * .09,
      width: queryData.size.width * .82,
      child: Card(
        color: Color(0xf2f2f2f2),
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: mesLet.mesEnLetras(_selectedDate, 'Fecha de la ecografia\n'),
        ),
      ),
    );
  }
}
