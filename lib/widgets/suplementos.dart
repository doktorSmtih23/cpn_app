import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SuplementosWidget extends StatefulWidget {
  @override
  _SuplementosWidgetState createState() => _SuplementosWidgetState();
}

class _SuplementosWidgetState extends State<SuplementosWidget> {
  var timeDilation;
  
  List<Widget> suplementos = [
    Text('Sulfato ferroso'),
    Text('Calcio'),
    Text('Acido folico - 1er Trimestre'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimationLimiter(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: suplementos.length,
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
                          child: suplementos[index],
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
