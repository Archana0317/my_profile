import 'package:flutter/material.dart';
import 'package:robert_frost/appdata.dart';

class Displaytxt extends StatelessWidget {
  final ApData apdatatxt;
  const Displaytxt({super.key, required this .apdatatxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(40),

      ),
      child: Padding(
        padding:EdgeInsets.all(25),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            apdatatxt.text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1,
            ),
          ),
        ),
      ),

    );
  }
}


