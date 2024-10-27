import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Addimage extends StatefulWidget {
  const Addimage({super.key});

  @override
  State<Addimage> createState() => _AddimageState();
}

class _AddimageState extends State<Addimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon:Icon(Icons.arrow_back_ios) ),
        title: Text("New Page",style: TextStyle(fontFamily: 'KE',fontWeight: FontWeight.bold,fontSize: 30.w),),
      ),
      body: Container(
        width: 300.h,
        height: 300.w,
        child: Container(

        ),
      ),

    );
  }
}
