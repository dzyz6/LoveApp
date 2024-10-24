import 'package:flutter/material.dart';
import 'view/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393,852),
       child:MaterialApp(
         theme: ThemeData(

         ),
        home: MyHomePage(),
      ),
    );
  }
}

