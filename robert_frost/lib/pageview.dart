import 'package:flutter/material.dart';
import 'package:robert_frost/appdata.dart';
import 'package:robert_frost/displaytxt.dart';
import 'package:share_plus/share_plus.dart';

class Pageview extends StatefulWidget {
  const Pageview({super.key});

  @override
  State<Pageview> createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {
  var selectedindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Robert Frost",
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
                itemCount:appData.length,
                itemBuilder: (context,index)
                {
                  var _quotes =appData[index];
                  var _scale =selectedindex==index ? 1.0 :0.9;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale,end: _scale),
                      duration: Duration(microseconds: 200),
                      child: Displaytxt(
                        apdatatxt: _quotes,
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
