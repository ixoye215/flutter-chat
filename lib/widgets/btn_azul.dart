import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  final Function()? press;
  final String texto;
  const BotonAzul({ 
    Key? key,
    required this.press,
    required this.texto 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        elevation: 2,
        primary: Colors.blue,
        onPrimary: Colors.white,
        shape: StadiumBorder(),
      ),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            this.texto,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17
            ),
          ),
        ),
      )
    );
  }
}