import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled5/common/route.dart';
import 'package:untitled5/view/addimage.dart';
import 'package:untitled5/view/firstpage.dart';

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
         gradient: LinearGradient(colors:[Color(0xFFFDE9C1),Color(0xFFFDE9Cc),] ,begin: Alignment.bottomCenter,end: Alignment.topCenter)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('我们的相册',style: TextStyle(fontFamily: "Ke",fontSize: 35.w),)),
          backgroundColor: Colors.transparent,
            automaticallyImplyLeading:false,
        ),
        backgroundColor: Colors.transparent,

        body: BodyContent(),
    ));
  }
}



class BodyContent extends StatefulWidget {
  const BodyContent({super.key});

  @override
  State<BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  @override
  bool _offstage=true;
  var _list=0;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400.w,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('lib/common/image/OIP-C.png'),fit: BoxFit.contain)
                ),
              ),
              Positioned(
                  child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                    setState(() {
                        _offstage=false;
                        _list=0;
                    });
                  }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 110.w,
                left: 70.h,
              ),///独山子
              Positioned(
                child: SizedBox(
                    width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _list=1;
                    _offstage=false;

                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 260.w,
                left: 257.h,
              ),///长沙
              Positioned(
                child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=2;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 232.w,
                left: 245.h,
              ),///宜昌
              Positioned(
                child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=3;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 155.w,
                left: 280.h,
              ),///天津
              Positioned(
                child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=4;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 203.w,
                left: 223.h,
              ),///西安
              Positioned(
                child: SizedBox(width:20.h,height:20.w,child: IconButton(onPressed: (){
                  setState(() {
                    _offstage=false;
                    _list=5;
                  });
                }, icon: Icon(Icons.circle,color: Colors.redAccent,size: 8.w,))),
                top: 252.w,
                left: 240.h,
              ),///张家界
            ],
          ),
        ),

        Offstage(
          offstage: _offstage,
          child: widgetList[_list],
        )
      ],
    );
  }


  List<Widget> widgetList=[
     BoxImg(path1: 'lib/common/dszimg/5bbd4a64ff03e5bcb647d85c5c6cf26.jpg',
         path2: 'lib/common/dszimg/66d833a8ac8c1b8ab60120943c2ab5b.jpg',
         path3: 'lib/common/dszimg/73c48657a4bd320d2f522ddcb610b21.jpg',
         path4: 'lib/common/dszimg/122a7781a1a4c856218fca002e48de5.jpg',
         path5: 'lib/common/dszimg/962c4040ef6031b0c022125f61c05a0.jpg',
         path6: 'lib/common/dszimg/50932e719b64bcb9d6345a10a04bd1b.jpg',
         path7:'lib/common/dszimg/776520289e818ddee65e326bf119eba.jpg',
         path8: 'lib/common/dszimg/132525105645431aad53b6a5dad8c81.jpg',
         path9: 'lib/common/dszimg/e5173d2d60a3bd9a64b135a9aa919b3.jpg'),
    ///独山子;

    BoxImg(path1:'lib/common/csimg/2ea53fa66beae4b0a0a20471b5ac61d.jpg',
        path2: 'lib/common/csimg/3b1c8d2c1876f94ae30cd4c0c48b0e3.jpg',
        path3: 'lib/common/csimg/6bda75b1ad3c0a471d7109fbf22a59e.jpg',
        path4: 'lib/common/csimg/455bb3f85d0ee3b9db8e073df790513.jpg',
        path5: 'lib/common/csimg/ce59d3d1d435168809278ee28cec13d.jpg',
        path6: 'lib/common/csimg/cf09374e049de940894f61f86a78c89.jpg',
        path7: 'lib/common/csimg/e0002503545731502ff7672d3da5dc8.jpg',
        path8: 'lib/common/csimg/ec8f0a65130f5327638d8d43ab9fd95.jpg',
        path9: 'lib/common/csimg/f42ea2ee877cac96f5bb7369e62b68f.jpg'),
    ///长沙
    ///
    BoxImg(path1: 'lib/common/ycimg/1a4985e68ac4e5feab2ef794707be42.jpg',
        path2: 'lib/common/ycimg/5d22e6af26f247facc1756746ef5f38.jpg',
        path3:'lib/common/ycimg/17e1d08fd44703fae70df2283b78d88.jpg',
        path4: 'lib/common/ycimg/9164e85641c987e7e0fee05c55494ef.jpg',
        path5: 'lib/common/ycimg/301973e05c3042d5fe871d30b773f3f.jpg',
        path6:'lib/common/ycimg/657154d88810551ed229ddbd61da4b3.jpg',
        path7: 'lib/common/ycimg/56957246557154360b54f85965a1568.jpg',
        path8: 'lib/common/ycimg/d17e06737506f9730553cf9ee74c07b.jpg',
        path9: 'lib/common/ycimg/d79faa90d2dff77f06d4e41b1111c5d.jpg'),
    ///宜昌

    BoxImg(path1: 'lib/common/tjimg/0a31555adebacc11a7f123cfd4a5748.jpg',
        path2: 'lib/common/tjimg/2b0a9b12983570511ee7a1bf3f0d037.jpg',
        path3: 'lib/common/tjimg/9e32a88450ad9e420bee1ebda4cd676.jpg',
        path4: 'lib/common/tjimg/61f6768e5bd730d4f0b702e50e50928.jpg',
        path5: 'lib/common/tjimg/523d217aa657d95aa7866100800ef5d.jpg',
        path6: 'lib/common/tjimg/2381b7c91238fcaa1b1c4fa75660cc6.jpg',
        path7: 'lib/common/tjimg/2536f0f15fdab3f47e4fa14ebff3ab2.jpg',
        path8: 'lib/common/tjimg/b5e93b6f5a598ad8378600066d11cac.jpg',
        path9: 'lib/common/tjimg/e4d85539af81b7f243e12185d21d313.jpg'),
    ///天津

    BoxImg(path1:'lib/common/xaimg/6a083cf57db2b3ca49540918ed2b714.jpg',
        path2: 'lib/common/xaimg/6fd0bb8692ded0ceedc892789db8ef0.jpg',
        path3: 'lib/common/xaimg/8a4c76e5cd9631c1edef80e52e63d70.jpg',
        path4: 'lib/common/xaimg/493542dfe3066228efbbbb74b1b7a68.jpg',
        path5: 'lib/common/xaimg/a0119d4972ac32e0a91faba33ebc314.jpg',
        path6: 'lib/common/xaimg/aa966fa58f743b3b12742b4de9da352.jpg',
        path7: 'lib/common/xaimg/cc4081de46b666bc8592950c42b8fdd.jpg',
        path8: 'lib/common/xaimg/d90d1656e3b79e34ff7195aab93bd4d.jpg',
        path9: 'lib/common/xaimg/f32c0999fb0e3338feae3ae4328c01b.jpg'),
    ///西安
    ///
     BoxImg(path1: 'lib/common/zjjimg/0bc9aacacc6a439d57cf51c96ff18fa.jpg',
         path2: 'lib/common/zjjimg/20123aa82ef58e73a9bd4193acdcfe5.jpg',
         path3: 'lib/common/zjjimg/a425003d73687816d278b515cf4eb81.jpg',
         path4: 'lib/common/zjjimg/c27ec11cda6ff13c3034ad0327b76f0.jpg',
         path5: 'lib/common/zjjimg/dd913d300dcc2958b3d081c8e05dab6.jpg',
         path6: 'lib/common/zjjimg/dde782183afad470ac6e3bd21356d39.jpg',
         path7: 'lib/common/zjjimg/f0a77cbf0fddb36beb1ca9d6ffc599f.jpg',
         path8: 'lib/common/zjjimg/fa411cdec6fafc00097ef595ce7f204.jpg',
         path9: 'lib/common/zjjimg/fc4ef946a121b1648a4f2538bf07076.jpg'),
    ///张家界
  ];
}



class BoxImg extends StatelessWidget {
  BoxImg({super.key ,required this.path1,required this.path2,required this.path3,required this.path4,required this.path5,required this.path6,required this.path7,required this.path8,required this.path9,});
  String path1,path2,path3,path4,path5,path6,path7,path8,path9;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(Radius.circular(20.r))
            ),
            width: 270.h,
            height: 270.w,
          ),
        ),
        Container(
          width: 250.h,
          height: 250.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  ImgContainer(path: path1),
                  ImgContainer(path: path2),
                  ImgContainer(path: path3),
                ],
              ),
              Row(
                children: [
                  ImgContainer(path: path4),
                  ImgContainer(path: path5),
                  ImgContainer(path: path6),
                ],
              ),
              Row(
                children: [
                  ImgContainer(path: path7),
                  ImgContainer(path: path8),
                  ImgContainer(path: path9),
                ],
              )
            ],
          ),
        ),
      ],
    );     ///独山子;
  }
}




class ImgContainer extends StatelessWidget {
  ImgContainer({super.key,required this.path});

  String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: Container(
              width: 400.h,
              height: 300.w,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(path),fit: BoxFit.contain),
                  borderRadius: BorderRadius.all(Radius.circular(10.r))
              ),
            ),

          );
        }
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 8.h,bottom: 5.w,right: 5.h,top: 8.w),
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(path),fit: BoxFit.cover),
          borderRadius: BorderRadius.all(Radius.circular(10.r))
        ),
        width: 70.h,
        height: 70.w,
      ),
    );
  }
}


