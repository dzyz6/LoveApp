import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addimage.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  @override

   var list=<String> [];
  Future _content() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    list =prefs.getStringList('list')!;
    print(prefs.getStringList('list'));
    print(list);
  }

  Future _settext() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('list', list);
  }

  @override
  void initState(){
    super.initState();
    _content();

  }


  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [Color(0xFFE6E6Ea),Color(0xFFF5F5FF),],begin: Alignment.topCenter,end: Alignment.bottomCenter,stops: [0.8,1])
          image: DecorationImage(image: AssetImage('lib/common/image/20220831145812_0eccf.jpg'))
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Addimage()));
        },
          elevation: 8,backgroundColor: Color(0XFFD3D3D3),child: Icon(Icons.add_rounded,color: Colors.black,size: 40.w,),),
        body: Column(
          children: [
            Row(
              children: [
                Bar(),

                Padding(
                  padding: EdgeInsets.only(top: 60.w,left: 110.h),
                  child: IconButton(onPressed: (){
                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        backgroundColor: Color(0xFFF0F0F0),
                        content:Container(
                          height: 145.w,
                          width: 150.h,
                          child: Column(
                            children: [
                              Text("确定要删除所有日记吗",style: TextStyle(fontSize: 30.w,fontFamily: 'hy'),),
                              SizedBox(height: 10.w,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () async{
                                      setState(() {
                                        list.clear();
                                      });
                                      await _settext();
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      child: Text("确定",style: TextStyle(fontSize: 20.w,fontFamily: 'hy'),

                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEED8AE),
                                          borderRadius: BorderRadius.all(Radius.circular(10.r))
                                      ),),
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).pop();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      child: Text("取消",style: TextStyle(fontSize: 20.w,fontFamily: 'hy'),

                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFEED8AE),
                                          borderRadius: BorderRadius.all(Radius.circular(10.r))
                                      ),),
                                  )
                                ],
                              )
                            ],
                          ),
                        ) ,
                      );
                    });

                  }, icon: Icon(Icons.delete_outlined)),
                )
              ],
            ),
            FutureBuilder(future: _content(), builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 数据正在加载中，可以显示一个加载指示器
                return Center(child: CircularProgressIndicator());
              }
              else if (snapshot.hasError){
                      return Text('error');
              }

              else{
                return list.length==0?Column(
                  children: [
                    SizedBox(height: 20.w,),
                    Center(child: Text("这里什么也没有",style: TextStyle(fontFamily: 'ke',fontSize: 20.w,fontWeight: FontWeight.bold,color: Colors.grey),)),
                    Center(child: Text("给TA写",style: TextStyle(fontFamily: 'ke',fontSize: 30.w,fontWeight: FontWeight.bold,color: Colors.grey),)),
                  ],
                ): Container(
                  width: 420.h,
                  height: 722.w,
                  child: ListView.builder(itemBuilder: (context,index){
                    return Center(
                      child: GestureDetector(
                          onLongPress: (){
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                backgroundColor: Color(0xFFF0F0F0),
                                content:Container(
                                  height: 110.w,
                                  width: 150.h,
                                  child: Column(
                                    children: [
                                      Text("确定要删除吗",style: TextStyle(fontSize: 30.w,fontFamily: 'hy'),),
                                      SizedBox(height: 10.w,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            onTap: () async{
                                              setState(() {
                                                list.removeAt(index);
                                              });
                                              await _settext();
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10.w),
                                                child: Text("确定",style: TextStyle(fontSize: 20.w,fontFamily: 'hy'),

                                                ),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFEED8AE),
                                                borderRadius: BorderRadius.all(Radius.circular(10.r))
                                            ),),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.of(context).pop();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10.w),
                                              child: Text("取消",style: TextStyle(fontSize: 20.w,fontFamily: 'hy'),

                                              ),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFEED8AE),
                                                  borderRadius: BorderRadius.all(Radius.circular(10.r))
                                              ),),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ) ,
                              );
                            });
                          },
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: 120.w
                            ),
                            child: Opacity(
                              opacity: 0.85,
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black,width: 0.2.w),
                                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                                    color: Colors.white,
                                  ),
                                  margin: EdgeInsets.all(10.w),
                                  padding: EdgeInsets.only(left: 15.h,right: 15.h),
                                  width: 320.h,
                                  child: Text('${list[index]}',style: TextStyle(fontFamily: 'ke',fontSize: 25.w),)
                              ),
                            ),
                          ),
                      ),
                    );
                  },itemCount: list.length,),
                );
              }
            })
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
          SizedBox(width: 65.h,),
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




