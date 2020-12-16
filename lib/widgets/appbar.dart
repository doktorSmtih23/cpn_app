
import 'package:cpn_app/services/auth_service.dart';
import 'package:cpn_app/services/socket_service.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
    
    @required this.socketService,
  }) : super(key: key);

  
  final SocketService socketService;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            socketService.disconnect();
            Navigator.pushNamed(context, 'login');
            AuthService.deleteToken();
          }),
    ]);
  }
}
