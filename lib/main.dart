import 'package:flutter/material.dart';
import 'common/public_provider.dart';
import 'view/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/common/public_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PublicProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      child: ChangeNotifierProvider(
        create: (context) => PublicProvider(),
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.greenAccent,
            highlightColor: Color.fromRGBO(0, 0, 0, 0),
            splashColor: Color.fromRGBO(0, 0, 0, 0)
          ),
          home: MyHomePage(),
        ),
      ),
    );
  }
}
