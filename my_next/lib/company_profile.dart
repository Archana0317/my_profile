import 'package:flutter/material.dart';
import 'package:my_next/nav_bar.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          "Company Profile",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(20),
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                Padding(padding: EdgeInsets.all(20),
                  child: Text(
                    "Tidy Life India Pvt Ltd.",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )

              ],
            ),
            SizedBox(
              height: 30,
              width: 250,
              child: Divider(
                color: Colors.red,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.red,
                ),
                title: Text(
                  "+91 8610338291",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.red,
                ),
                title: Text(
                  "tidylifeindia@gmail.com",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),

            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: ListTile(
                leading: Icon(
                  Icons.location_city,
                  color: Colors.red,
                ),
                title: Text(
                  "S2,S K ILLAM,\nPlot no:5\n2nd Cross Street,\nKamalam Nagar,\nNanmangalam,\nChennai-600127.",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
