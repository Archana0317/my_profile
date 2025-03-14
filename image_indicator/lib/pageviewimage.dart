import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_indicator/AppData.dart';
import 'package:image_indicator/displayimage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';


import 'indicator.dart';

class PageviewImage extends StatefulWidget {
  const PageviewImage({super.key});

  @override
  State<PageviewImage> createState() => _PageviewImageState();
}

class _PageviewImageState extends State<PageviewImage> {
  late PageviewImage controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageviewImage();
  }

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent.withOpacity(.8),
      appBar: AppBar(
        backgroundColor: Colors.purple,
       // titleTextStyle: TextStyle(
          //fontWeight: FontWeight.bold,
         // fontSize: 25,
         // color: Colors.black,
       // ),
        title: Text(
          'Robert Frost',
          style: TextStyle(
            color: Colors.tealAccent,
            fontSize: 26,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.black,
          ),
        ),
        centerTitle: true,
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (context)=> [
              PopupMenuItem(value: 1,child: Text("Share")),
              // PopupMenuItem(value: 2,child: Text('Go To')),
            ],
            // elevation: 2,
            onSelected: (value){
              if (value == 1){
                print('---------------->Share Option Clicked');
                _shareInfo();
              }
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: PageView.builder(
              onPageChanged: (index){
                setState(() {
                  print('-----------------------> On page changed');
                  print(index);
                  _selectedIndex = index;
                });
              },
              itemCount: appDataList.length,
              itemBuilder: (context,index){
                return Displayimage(
                  appData: appDataList[index],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    appDataList.length,
                        (index) => Indicator(
                        isActive: _selectedIndex == index ? true : false))
              ],
            ),
          )
        ],
      ),
    );

  }




  void _shareInfo() async{

    final byteData = await rootBundle.load(appDataList[_selectedIndex].imagepath);
    final imageBytes = byteData.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final imageFile = File('${tempDir.path}/shared_image.png');
    await imageFile.writeAsBytes(imageBytes);
    final xFile = XFile(imageFile.path, mimeType: 'image/png');
    await Share.shareXFiles([xFile],text:'');
  }
}

