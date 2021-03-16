import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class ListtitleWidget extends StatefulWidget {
  final String title;
  final bool value;
  final Color color;
  final Color colorS;

  final Function onChanged;

  const ListtitleWidget(
      {Key key,
      this.title,
      this.value,
      this.onChanged,
      this.color,
      this.colorS})
      : super(key: key);

  @override
  _ListtitleWidgetState createState() => _ListtitleWidgetState();
}

class _ListtitleWidgetState extends State<ListtitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
            color: widget.color, borderRadius: BorderRadius.circular(10)),
        child: Card(
          elevation: 9,
          child: ListTileSwitch(
            switchActiveColor: widget.colorS,
            title: Text(widget.title),
            value: widget.value,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
