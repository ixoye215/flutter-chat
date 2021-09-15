import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String tienesCuenta;
  final String textAccion;

  const Labels({ 
    Key? key, 
    required this.ruta,
    required this.tienesCuenta,
    required this.textAccion 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.tienesCuenta,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.w300
            ),
          ),
          SizedBox(height: 10.0,),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, this.ruta);
            },
            child: Text(
              this.textAccion,
              style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),
            ),
          )
        ],
      ),
    );
  }
}