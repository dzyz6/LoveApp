import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'addimage.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [Color(0xFFE6E6Ea),Color(0xFFF5F5FF),],begin: Alignment.topCenter,end: Alignment.bottomCenter,stops: [0.8,1])
        color: Color(0xFFF0F0F0)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Addimage()));
        },
          elevation: 8,backgroundColor: Color(0XFFD3D3D3),child: Icon(Icons.add_rounded,color: Color(0xff9977B6),size: 40.w,),),
        body: Column(
          children: [
            Bar(),
          ],
        ),
      ),
    );
  }
}


class Bar extends StatelessWidget {
  const Bar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.w),
      child: Row(
        children: [
          Container(child: Image.asset('lib/common/image/dog.png'),height: 80.w,width: 80.h,),
          Column(
            children: [
              SizedBox(height: 20.w,),
              Text('${DateTime.now().day}',style: TextStyle(fontFamily: 'Ke',fontSize: 30.w),),
            ],
          ),
          SizedBox(width: 40.h,),
          Column(
            children: [
              SizedBox(height: 20.w,),
              Center(
                child: Text("Diary",style: TextStyle(fontFamily: 'KE',fontSize: 40.w,fontWeight: FontWeight.bold),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
