
import 'package:flutter/material.dart';
import 'package:ixoye_chat/screens/chat_screen.dart';
import 'package:ixoye_chat/screens/loading_screen.dart';
import 'package:ixoye_chat/screens/login_screen.dart';
import 'package:ixoye_chat/screens/register_screen.dart';
import 'package:ixoye_chat/screens/usuarios_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  'usuarios'  : (_) => UsuariosScreen(),
  'chat'      : (_) => ChatScreen(),
  'login'     : (_) => LoginScreen(),
  'register'  : (_) => RegisterScreen(),
  'loading'   : (_) => LoadingScreen(),
};

