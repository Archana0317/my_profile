import 'package:flutter/material.dart';
import 'package:my_next/appdatatext.dart';
import 'package:my_next/displaytext.dart';
import 'package:share_plus/share_plus.dart';

import 'nav_bar.dart';

class Pageviewimage extends StatefulWidget {
  const Pageviewimage({super.key});

  @override
  State<Pageviewimage> createState() => _PageviewimageState();
}

class _PageviewimageState extends State<Pageviewimage> {
    var selectedindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          "Inspirational Quotes",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          PopupMenuButton(itemBuilder: (context)=>
      [
        PopupMenuItem(value:1, child:Text('Share'))
      ],
            onSelected: (value)
              {
                if(value==1)
                  {
                    _shareInfo();
                  }
              }
          )

        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 600,
            height:400,
            child: PageView.builder(
              onPageChanged: (index){
                setState(() {
                  selectedindex=index;
                });
              },
              controller: PageController(viewportFraction: 0.8),
              itemCount: appData.length,
              itemBuilder: (context,index)
                {
                  var _quotes =appData[index];
                  var _scale =selectedindex==index ? 1.0 :0.9;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale,end: _scale),
                      duration: Duration(microseconds: 200),
                      child: Displaytext(
                        appDataText: _quotes,
                      ),

                      builder:(context,value,child)
                      {
                        return Transform.scale(
                          scale: value as double,
                          child: child,
                        );
                      }
                  );
                }
            ),
          ),
     Padding(padding:EdgeInsets.symmetric(vertical: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
             child: Text(
                  (selectedindex + 1).toString()+'/'+appData.length.toString(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
              ),
            )
          ],
        ),
      )
        ],
      ),
    );
  }
  void _shareInfo() {
    print('----Share');
Share.share(appData[selectedindex].text);
print(appData[selectedindex].text);
  }
}
