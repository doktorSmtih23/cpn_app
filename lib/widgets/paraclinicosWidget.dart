import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class ParaclinicosWidget extends StatelessWidget {
  var timeDilation;
  List<Widget> paraclinicos = [];

  ParaclinicosWidget({@required this.paraclinicos});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimationLimiter(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: paraclinicos.length,
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
                          color: Colors.green[100],
                          elevation: 9,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: paraclinicos[index],
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
