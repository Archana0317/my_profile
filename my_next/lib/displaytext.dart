import 'package:flutter/material.dart';
import 'package:my_next/appdatatext.dart';

class Displaytext extends StatelessWidget {
  final AppData appDataText;
  const Displaytext({super.key,required this.appDataText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 300,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(35),


      ),
      child: Padding(
          padding:EdgeInsets.all(25),
        child: Align(
          alignment: Alignment.center,
          child: Text(
              appDataText.text,
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
