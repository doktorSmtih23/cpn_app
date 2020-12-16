import 'package:cpn_app/pages/home_page.dart';
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
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: Color(0xf2f2f2f2),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Text('Ingrese fecha de Ultima menstruacion',style: TextStyle(color:Colors.pink,fontSize:20),
                  textAlign: TextAlign.center,),
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
                    );// return newDateTime;
                  }),
            ),
            mostrarFechas(_selectedDate),
            SizedBox(height: 315),
            Align(
              alignment: Alignment.center,
              child: FloatingActionButton(backgroundColor: Colors.pink,
                child: Icon(Icons.home_outlined,
                            color: Colors.white),
                onPressed: (){
                 Navigator.push(
                   context, MaterialPageRoute(builder: (_) => HomePage()));
                }))
          ],
        ),
      ),
    );
  }

  Widget mostrarFechas(DateTime fum) {
    var semanas = ((DateTime.now().difference(fum)).inDays ~/ 7);
    print(semanas);
    var dias = DateTime.now().difference(fum).inDays % 7;
    print(dias);

    var duedateY = fum.add(Duration(days: 365));
    var duedateM = fum.subtract(Duration(days: 90));
    var duedateD = fum.add(Duration(days: 7));

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
      height:80,
      width: 270,
      child: Card(
              color:Color(0xf2f2f2f2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Center(
          child: Text(
              'La fecha probable de parto es: ${duedateD.day}/${duedateM.month}/${duedateY.year}',
              style: TextStyle(
                fontSize:20,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Center(child: Text('La edad gestacional es\n\ $semanas Sem, $dias dias',
      style: TextStyle(
        fontSize:20,
        color: Colors.pink,
        
      ),
      textAlign: TextAlign.center,)
      )
      )
      );
  }
}

class FumWidget extends StatelessWidget {
  const FumWidget({
    Key key,
    @required DateTime selectedDate,
  }) : _selectedDate = selectedDate, super(key: key);

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
               style: TextStyle(fontSize:20,color: Colors.pink[400]),
               textAlign: TextAlign.center,),
              ),
      ),
    );
  }
}
