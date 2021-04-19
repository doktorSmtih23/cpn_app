import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class VacunasWidget extends StatefulWidget {
  @override
  _VacunasWidgetState createState() => _VacunasWidgetState();
}

class _VacunasWidgetState extends State<VacunasWidget> {
  var timeDilation;
  List<Widget> vacunas = [
    Text(
        'TD (las que nunca han sido vacunadas o desconocen su esquema) 1 dosis inicial a las 4 semanas y a los 6-12 meses de la dosis inicial a partir de la semana 14',
        textAlign: TextAlign.justify),
    Text('INFLUENZA (virus inactivo) a partir de la semana 16',
        textAlign: TextAlign.justify),
    Text('DPTa a partir de la semana 26', textAlign: TextAlign.justify)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimationLimiter(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: vacunas.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Column(
                    children: [
                      Card(
                          elevation: 9,
                          color: Colors.green[100],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: vacunas[index],
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
