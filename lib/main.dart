import 'package:flutter/material.dart';
import 'package:untitled5/view/letter.dart';
import 'common/public_provider.dart';
import 'view/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/common/public_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
    create: (context) => PublicProvider(),
    child: MyApp(),
  ));
}

Future<int?> IsLogIn () async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? a=prefs.getInt('login');
  return a;
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height),
      child: ChangeNotifierProvider(
        create: (context) => PublicProvider(),
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.greenAccent,
            highlightColor: Color.fromRGBO(0, 0, 0, 0),
            splashColor: Color.fromRGBO(0, 0, 0, 0)
          ),
          home: IsLogIn()!=1&&IsLogIn()!=2?Letter():MyHomePage(),
        ),
      ),
    );
  }
}
