import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/view/home_page.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({super.key});

  @override
  Future<int?> LogInNumber(int b) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('login', b);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffe1),
      body: Column(
        children: [
          SizedBox(
            height: 60.w,
          ),
          Image.asset(
              'lib/common/image/35616e30875129ae7d7b09e5a176502f600c5137403be-xKjTNG_fw658.webp'),
          SizedBox(
            height: 30.w,
          ),
          Text(
            '请选择你的身份',
            style: TextStyle(fontFamily: 'KE', fontSize: 40.w),
          ),
          SizedBox(
            height: 40.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  showDialog(context: context, builder: (_){
                    return AlertDialog(
                      backgroundColor: Colors.transparent,
                      content: Container(
                        height: 70.w,
                        width: 100.h,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          behavior:HitTestBehavior.opaque ,
                          child: Center(
                            child: Text(
                              '才不信',
                              style: TextStyle(fontSize: 30.w, fontFamily: 'KE'),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xffead6bb),
                            borderRadius: BorderRadius.all(Radius.circular(70.r))),
                      ),
                    );
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(30.w),
                  child: Text(
                    '我是鸡毛',
                    style: TextStyle(fontSize: 30.w, fontFamily: 'KE'),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffead6bb),
                      borderRadius: BorderRadius.all(Radius.circular(70.r))),
                ),
              )
            ],
          ),
          SizedBox(
            height: 40.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  LogInNumber(2);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyHomePage()));
                },
                child: Container(
                  padding: EdgeInsets.all(30.w),
                  child: Text(
                    '我是臭小白',
                    style: TextStyle(fontSize: 30.w, fontFamily: 'KE'),
                  ),
                  decoration: BoxDecoration(
                      color: Color(0xffead6bb),
                      borderRadius: BorderRadius.all(Radius.circular(70.r))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
