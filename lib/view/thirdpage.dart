import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled5/common/route.dart';
import 'package:untitled5/view/addimage.dart';
import 'package:untitled5/view/firstpage.dart';

class Thirdpage extends StatefulWidget {
  const Thirdpage({super.key});

  @override
  State<Thirdpage> createState() => _ThirdpageState();
}

class _ThirdpageState extends State<Thirdpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[Color(0xFFFAF9DE),Color(0xFFFFE4C4),] ,begin: Alignment.bottomCenter,end: Alignment.topCenter)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('我们的相册',style: TextStyle(fontFamily: "Ke",fontSize: 30.w),)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,

        body: BodyContent(),
    ));
  }
}



class BodyContent extends StatefulWidget {
  const BodyContent({super.key});

  @override
  State<BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  @override
  bool _offstage=true;
  var _list=0;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('lib/common/image/OIP-C.png'),fit: BoxFit.contain)
                ),
              ),
              Positioned(
                  child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                    setState(() {
                        _offstage=false;
                        _list=0;
                    });
                  }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 110.w,
                left: 70.h,
              ),///独山子
              Positioned(
                child: SizedBox(
                    width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=1;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 260.w,
                left: 257.h,
              ),///长沙
              Positioned(
                child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=2;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 232.w,
                left: 245.h,
              ),///宜昌
              Positioned(
                child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=3;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 155.w,
                left: 280.h,
              ),///天津
              Positioned(
                child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=4;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 203.w,
                left: 223.h,
              ),///西安
              Positioned(
                child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=5;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 252.w,
                left: 240.h,
              ),///张家界
            ],
          ),
        ),

        Offstage(
          offstage: _offstage,
          child: widgetList[_list],
        )
      ],
    );
  }

  List<Widget> widgetList=[
    Container(
      color: Colors.black,
      width: 200.h,
      height: 200.w,
    ),     ///独山子

    Container(
      color: Colors.blue,
      width: 200.h,
      height: 200.w,
    ),///长沙

    Container(
      color: Colors.redAccent,
      width: 200.h,
      height: 200.w,
    ),///宜昌

    Container(
      color: Colors.deepOrange,
      width: 200.h,
      height: 200.w,
    ),///天津

    Container(
      color: Colors.green,
      width: 200.h,
      height: 200.w,
    ),///西安

    Container(
      color: Colors.yellow,
      width: 200.h,
      height: 200.w,
    ),///张家界
  ];
}
