import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled5/common/color.dart';
import 'package:untitled5/common/size.dart';
import 'package:untitled5/view/firstpage.dart';
import 'package:untitled5/view/thirdpage.dart';

import 'secondpage.dart';

PageController pageController=PageController(initialPage: 0);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          Firstpage(),
          Secondpage(),
          Thirdpage(),
        ],
      ),
      bottomNavigationBar: BottomTap(),
    );
  }
}


class BottomTap extends StatefulWidget {
  const BottomTap({super.key});

  @override
  State<BottomTap> createState() => _BottomTapState();
}

class _BottomTapState extends State<BottomTap> {

  int currentIndex = 0;
  void _ontap(int value){
    currentIndex=value;
    setState(() {
       pageController.jumpToPage(currentIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.transparent,Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),

      ),
      child: BottomNavigationBar(
          enableFeedback:true,
        elevation: 0,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
          unselectedItemColor:Colors.grey,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          onTap: _ontap,
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.share_location),label:'我们' ),
            BottomNavigationBarItem(icon: Icon(Icons.chat,size: 20.w),label: '悄悄话'),
            BottomNavigationBarItem(icon: Icon(Icons.photo,size: 20.w,),label: '情侣相册',),
          ] ),
    );
  }
}


