import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ixoye_chat/screens/login_screen.dart';
import 'package:ixoye_chat/screens/usuarios_screen.dart';
import 'package:ixoye_chat/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, AsyncSnapshot<dynamic> snapshot){
          return Center(
            child: Text('Espereeee..'),
          );
        }
      ),
    );
  }

  Future checkLoginState( BuildContext context) async{
    final authService = Provider.of<AuthService>(context, listen:false);

    final autenticado = await authService.isLoggedIn();

    if (autenticado) {
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => UsuariosScreen(),
          transitionDuration: Duration(milliseconds: 0)
      ));
    }else{
      // Navigator.pushReplacementNamed(context, 'login');
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => LoginScreen(),
          transitionDuration: Duration(milliseconds: 0)
      ));

    }
  }
}