import 'package:flutter/material.dart';
import 'package:untitled5/view/loginpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Letter extends StatelessWidget {
  const Letter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('To 马小宝',style: TextStyle(fontSize: 50.w,fontFamily: 'Yuan'),),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>Loginpage()));
              },
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular((20.r)))
                      ),
                      width: 200.h,
                      height: 85.w,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(

                      child: Text("->",style: TextStyle(fontSize: 50.w,fontFamily: 'Yuan',color: Colors.white),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
