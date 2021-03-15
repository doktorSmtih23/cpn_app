import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class ListtitleWidget extends StatefulWidget {
  final String title;
  final bool value;

  final Function onChanged;

  const ListtitleWidget({Key key, this.title, this.value, this.onChanged})
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
        color: Colors.grey,
        width: 350,
        child: Card(
          elevation: 9,
          child: ListTileSwitch(
            title: Text(widget.title),
            value: widget.value,
            onChanged: widget.onChanged,
          ),
        ),
      ),
    );
  }
}
