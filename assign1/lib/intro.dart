import 'package:flutter/material.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SELF INTRODUCTION',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
                margin: EdgeInsets.all(10),
                width: 500,
                height: 1000,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                                      'Hi myself Archana Krishnamoorthy from Vellore currently residing in Chennai.I did '
                        'my schooling in Vellore.I have completed B.Tech in Information Technology at Panimalar'
                        'Engineering College.I have 2.5 years of work experience in Banking domain.I previously '
                        'worked in Sri Chaitanya Techno School as Parent Counsellor currently pursuing a course in '
                        'flutter which is a mobile app development.,',textAlign: TextAlign.justify,
                                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                                      ),
                                    ),
                    ),

                ),

                ]
                ),
        ),
    ),
    );

  }
}
