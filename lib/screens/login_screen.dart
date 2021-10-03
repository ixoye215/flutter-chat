import 'package:flutter/material.dart';
import 'package:ixoye_chat/helpers/mostrar_alerta.dart';
import 'package:ixoye_chat/services/auth_service.dart';
import 'package:ixoye_chat/widgets/btn_azul.dart';

import 'package:ixoye_chat/widgets/custom_input.dart';
import 'package:ixoye_chat/widgets/labels.dart';
import 'package:ixoye_chat/widgets/logo.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Logo(
                mensaje: 'Messenger',
              ),
              SizedBox(height: size.height*0.07,),
              _Form(),
              SizedBox(height: size.height*0.05,),
              Labels(
                tienesCuenta: '¿No tienes Cuenta?',
                textAccion: 'Crea una ahora!',
                ruta: 'register',
              ),
              SizedBox(height: size.height*0.07,),
              Text(
                'Terminos y condiciones de uso',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ],
          ),
        ),
      )
    );
  }
}



class _Form extends StatefulWidget {

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),
          
          BotonAzul(
            press: authService.autenticando ? null : () async {
              
              //Quitar teclado
              FocusScope.of(context).unfocus();

              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
              if (loginOk) {
                //TODO conectar a socket
                //Navegar a otra pantalla
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else{
                //Mostrar alerta
                mostrarAlerta(context, 'Login incorrecto', 'Revise sus credenciales');
              }
            }, 
            texto: 'Ingrese',
          )
        ],
      ),
    );
  }
}

