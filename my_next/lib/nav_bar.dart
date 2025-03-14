import 'package:flutter/material.dart';
import 'package:my_next/company_profile.dart';
import 'package:my_next/pageviewimage.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(2),
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Inspirational Quotes',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              ),
              accountEmail:Text(
                'Version1.0',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('images/img4.jpg',
                width: 70,
                  height: 70,
                  fit: BoxFit.cover,
              ),
            ),
          ),
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/img_11.png',),
            fit: BoxFit.cover,
          )
      ),
    ),
          ListTile(title: Text(
          'Inspirational Quotes',
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    onTap: () => Navigator.of(context).pushReplacement(
    MaterialPageRoute(
    builder: (BuildContext)=> Pageviewimage())),
    ),
          ListTile(title: Text(
            'Company Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                    builder: (BuildContext)=> CompanyProfile())),
          ),
        ],
      ),
    );
  }
}
