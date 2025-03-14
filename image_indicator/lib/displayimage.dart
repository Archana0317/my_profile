
import 'package:flutter/material.dart';
import 'package:image_indicator/AppData.dart';

class Displayimage extends StatelessWidget {
  final AppData appData;
  const Displayimage({super.key,required this.appData});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.all(8),
      child: Container(

        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(appData.imagepath),
              fit: BoxFit.cover,
            )
        ),
      )
    );
  }
}
