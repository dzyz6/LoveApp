import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled5/view/home_page.dart';
import 'package:untitled5/view/letter.dart';


class Middle extends StatefulWidget {
  const Middle({super.key});

  @override
  State<Middle> createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {

  @override
  void initState() {
    Future<int?> IsLogIn () async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      int? a=await prefs.getInt('login');
      if(a==2){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MyHomePage()));
      }
      else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Letter()));
      }
    }
    super.initState();
    IsLogIn();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: CircularProgressIndicator(color: Colors.grey,),),
    );
  }
}
