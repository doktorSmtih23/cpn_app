import 'package:cpn_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class EgWidgetPage extends StatefulWidget {
  @override
  _EgWigdetState createState() => _EgWigdetState();
}

class _EgWigdetState extends State<EgWidgetPage> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xf2f2f2f2),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    child: Text('Semanas'),
                    onPressed: () {
                      showMaterialNumberPicker(
                        context: context,
                        title: "Seleccione el numero de semanas",
                        maxNumber: 42,
                        minNumber: 0,
                        selectedNumber: wks,
                        onChanged: (value) => setState(() => wks = value),
                      );
                    }),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                    child: Text('dias'),
                    onPressed: () {
                      showMaterialNumberPicker(
                        context: context,
                        title: "Seleccione el numero de dias",
                        maxNumber: 6,
                        minNumber: 0,
                        selectedNumber: dys,
                        onChanged: (value) => setState(() => dys = value),
                      );
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('$wks'),
                SizedBox(width: 100),
                Text('$dys'),
              ],
            ),
            mostrarFechas(_selectedDate),
            SizedBox(height: 265),
            Align(
                alignment: Alignment.center,
                child: FloatingActionButton(
                    backgroundColor: Colors.pink,
                    child: Icon(Icons.home_outlined, color: Colors.white),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HomePage()));
                    })),
          ],
        ),
      ),
    );
  }

  Widget mostrarFechas(DateTime fum) {
    var semanas = ((DateTime.now().difference(fum)).inDays ~/ 7) + wks;
    print(semanas);
    var dias = ((DateTime.now().difference(fum).inDays) + dys) % 7;
    print(dias);

    var duedateY = fum.add(Duration(days: 365));
    var duedateM = fum.subtract(Duration(days: 90 + (wks * 7)));
    var duedateD = fum.add(Duration(days: 7 - dys));
    print(duedateD);

    return Column(children: <Widget>[
      Padding(padding: EdgeInsets.symmetric(vertical: 2)),
      FumWidget(selectedDate: _selectedDate),
      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      EgWidget(semanas: semanas, dias: dias),
      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
      DueDateWidget(duedateD: duedateD, duedateM: duedateM, duedateY: duedateY),
    ]);
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
    return Container(
      height: 80,
      width: 270,
      child: Card(
        color: Color(0xf2f2f2f2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            'La fecha probable de parto es: ${duedateD.day}/${duedateM.month}/${duedateY.year}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.pink,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
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
    return Container(
        height: 80,
        width: 270,
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
    return Container(
      height: 100,
      width: 150,
      child: Card(
        color: Color(0xf2f2f2f2),
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            'FUM ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
            style: TextStyle(fontSize: 20, color: Colors.pink[400]),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
