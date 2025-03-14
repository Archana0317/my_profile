import 'package:flutter/material.dart';

class MySample extends StatelessWidget {
  const MySample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Sample Program",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.amber,

          ),
        ),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
        children: [
    CircleAvatar(
    radius: 70,
      backgroundImage: AssetImage('images/one.jpg'),
    ),
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage('images/two.jpg'),
        ),
        CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage('images/three.jpg'),
        ),


        ],

    ),

            Padding(
              padding: const EdgeInsets.all(10.0,),
              child: Text(
                "Archana krishnamoorthy",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Card(
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.red,
                ),
                title: Text(
                  "+91 8524021736",
                  style: TextStyle(
                    color: Colors.tealAccent,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.red,
                ),
                title: Text(
                  "archanakrishnamoorthy95@gmail.com",
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: ListTile(
                leading: Icon(
                  Icons.location_city_rounded,
                  color: Colors.red,
                ),
                title: Text(
                  "S1-A,Jaiganesh Senthilkumar flats,\nPonniamman Kovil Street,\nNanmangalam,\nChennai-600100.",
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ],

        ),


      ),

    );
  }
}
