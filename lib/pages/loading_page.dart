
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cpn_app/services/auth_service.dart';
import 'package:cpn_app/services/socket_service.dart';

import 'home_page.dart';
import 'login_page.dart';


class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 3)
          );
        },
      ),
    );
  }

  Future checkLoginState(context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context);
    final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      socketService.connect();
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => HomePage(),
              transitionDuration: Duration(milliseconds: 0)));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginPage(),
              transitionDuration: Duration(milliseconds: 0)));
    }
  }
}
