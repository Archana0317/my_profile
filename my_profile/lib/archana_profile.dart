import 'package:flutter/material.dart';

class ArchanaProfile extends StatelessWidget {
  const ArchanaProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('images/mypic.jpg'),
            ),
            Padding(
              padding: EdgeInsets.all(6.0),
              child: Text(
                "Archana Krishnamoorthy",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                "Flutter developer",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
              width: 100,
              child: Divider(color: Colors.black),
            ),
            Card(
              color: Colors.teal,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.white),
                title: Text(
                  '8524021736',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Card(
              color: Colors.teal,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ListTile(
                leading: Icon(Icons.mail, color: Colors.white),
                title: Text(
                  'archanakrishnamoorthy95@gmail.com',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
