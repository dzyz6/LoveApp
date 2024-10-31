import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addimage extends StatefulWidget {
  const Addimage({super.key});

  @override
  State<Addimage> createState() => _AddimageState();
}

class _AddimageState extends State<Addimage> {
  @override
  TextEditingController controller = TextEditingController();
  var list = <String>[];

  Future _settext() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('list', list);
    print(prefs.getStringList('list'));
  }

  Future _content() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    list=prefs.getStringList('list')!;
  }

  late String content;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "New Page",
          style: TextStyle(
              fontFamily: 'KE', fontWeight: FontWeight.bold, fontSize: 30.w),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.w),
              child: Container(
                child: TextField(
                  maxLines: null,
                  controller: controller,
                  maxLength: 300,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.clear();
                        },
                        icon: Icon(Icons.close)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB6B6B6), width: 0.5.w),
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black, width: 0.5.w),
                        borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(15.h),
                  child: IconButton(
                      onPressed: () async{
                        await _content();
                        setState(() {
                          content = controller.text;
                          list.add(content);
                        });

                        print("dddddddddddddddddddddddddddddddddddddddddd");
                        await _settext();

                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.done)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
