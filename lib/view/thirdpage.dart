import 'package:flutter/material.dart';
import 'package:untitled5/common/route.dart';
import 'package:untitled5/view/addimage.dart';

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
              color: Color(0xFFFAF9DE)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Addimage()));
        }),
      ),
    );
  }
}
