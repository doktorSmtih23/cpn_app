import 'package:cpn_app/services/auth_service.dart';
import 'package:cpn_app/services/socket_service.dart';

import 'package:cpn_app/widgets/appbar.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    final usuario = authService.usuario;

    TextStyle title = TextStyle(fontSize: 20, color: Colors.pink[600]);
    TextStyle title2 = TextStyle(
        fontSize: 28, fontWeight: FontWeight.w800, color: Colors.pink[600]);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: usuario.nombre != null
                  ? Text('${usuario.nombre}')
                  : Text('Modo offline'),
              centerTitle: true,
              backgroundColor: Colors.pink[300],
              actions: <Widget>[AppBarWidget(socketService: socketService)],
            ),
            backgroundColor: Color(0xf2f2f2f2),
            body: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 80)),
                Center(
                    child: Text(
                  'Bienvenid@',
                  style: title2,
                )),
                Padding(padding: EdgeInsets.only(top: 50)),
                ButtonFUM(title: title, label: 'Edad gestacional por\n\ FUM'),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                ButtonEco(
                    title: title, label: 'Edad gestacional por\n\ Ecografia'),
              ],
            )));
  }
}

class ButtonFUM extends StatelessWidget {
  final String label;
  const ButtonFUM({
    Key key,
    @required this.title,
    @required this.label,
  }) : super(key: key);

  final TextStyle title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      height: queryData.size.height * .09,
      width: queryData.size.width * .8,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          autofocus: false,
          highlightColor: Colors.amber,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: title,
          ),
          onPressed: () =>
              Navigator.pushNamed(context, 'fumwidget')),
    );
  }
}

class ButtonEco extends StatelessWidget {
  final String label;
  const ButtonEco({
    Key key,
    @required this.title,
    @required this.label,
  }) : super(key: key);

  final TextStyle title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Container(
      height: queryData.size.height * .09,
      width: queryData.size.width * .8,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          autofocus: false,
          highlightColor: Colors.amber,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: title,
          ),
          onPressed: () =>
              Navigator.pushNamed(context, 'ecowidget')),
    );
  }
}
