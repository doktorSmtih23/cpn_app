import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

// ignore: must_be_immutable
class EcografiasWidget extends StatelessWidget {
  var timeDilation;

  List<Widget> ecografias = [];

  EcografiasWidget({
    @required this.ecografias});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimationLimiter(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: ecografias.length,
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
                          child: ecografias[index],
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
