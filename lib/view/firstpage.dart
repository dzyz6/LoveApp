import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled5/common/public_provider.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  String backimage = 'lib/common/image/cloud.jpeg';

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage(Provider.of<PublicProvider>(context).backimage),
            fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Time(),
            Spacer(),
            BottomSliver(),
          ],
        ),
      ),
    );
  }
}

class Time extends StatelessWidget {
  const Time({super.key});

  @override

  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.h),
        Icon(Icons.access_time_sharp,color: Colors.white,size: 17.w,),
        SizedBox(width: 5.h),
        DateTime.now().hour>23||DateTime.now().hour<3?Text('٩(๑`^´๑)۶ 该睡觉了',style: TextStyle(color: Colors.white,),):
        DateTime.now().hour>6&&DateTime.now().hour<10?Text('(๑¯ω¯๑) 一日之计在于晨',style: TextStyle(color: Colors.white,),):Text('٩(๑˃̵ᴗ˂̵๑)۶ 开心每一天',style: TextStyle(color: Colors.white),),
      ],
    );
  }
}


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [LoveTime(), ActionMore()],
      ),
    );
  }
}

class LoveTime extends StatelessWidget {
  LoveTime({super.key});

  final startDate = DateTime(2022, 11, 1);
  final endDate = DateTime.now();
  final mDate = DateTime.now().month < 1 && DateTime.now().day < 11
      ? DateTime(DateTime.now().year, 1, 11)
      : DateTime(DateTime.now().year + 1, 1, 11);
  final cDate = DateTime.now().month < 5 && DateTime.now().day < 5
      ? DateTime(DateTime.now().year, 5, 5)
      : DateTime(DateTime.now().year + 1, 5, 5);
  late final days = endDate.difference(startDate).inDays + 1;
  late final mdays = mDate.difference(endDate).inDays + 1;
  late final cdays = cDate.difference(endDate).inDays + 1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(100.r),
          topRight: Radius.circular(100.r),
          bottomLeft: Radius.circular(20.r),
          topLeft: Radius.circular(20.r)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 80.w,
          minWidth: 210.h,
        ),
        child: Container(
          color: Colors.black.withOpacity(0.4),
          child: Padding(
            padding: EdgeInsets.all(14.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      "我们已经相爱",
                      style: TextStyle(
                          fontSize: 15.w,
                          color: Colors.white,
                          fontFamily: "Yuan"),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          "$days",
                          style: TextStyle(
                              fontSize: 25.w,
                              color: Colors.white,
                              fontFamily: "Yuan"),
                        ),
                        Text(
                          "天",
                          style: TextStyle(
                              fontSize: 15.w,
                              color: Colors.white,
                              fontFamily: "Yuan"),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.h,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Center(
                                      child: Text(
                                    "距离他的生日还有$cdays天",
                                    style: TextStyle(fontFamily: 'yuan'),
                                  )),
                                  backgroundColor: Color(0xFFEED8AE),
                                );
                              }),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('lib/common/image/headimg1.jpg'),
                            radius: 23,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () => showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Center(
                                      child: Text(
                                    "距离她的生日还有$mdays天",
                                    style: TextStyle(fontFamily: 'yuan'),
                                  )),
                                  backgroundColor: Color(0xFFEED8AE),
                                );
                              }),
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage:
                                AssetImage('lib/common/image/headimg2.jpg'),
                          ),
                        )
                      ],
                    ),
                    Transform(
                        transform:
                            Transform.translate(offset: const Offset(0, 7))
                                .transform,
                        child: BeatingHeart(
                          duration: Duration(milliseconds: 800),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BeatingHeart extends StatefulWidget {
  const BeatingHeart({super.key, required this.duration});

  final Duration duration;

  @override
  State<BeatingHeart> createState() => _BeatingHeartState();
}

class _BeatingHeartState extends State<BeatingHeart>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(vsync: this);

  bool show = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        show = !show;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.bounceInOut,
      opacity: show ? 1 : 0.4,
      onEnd: () async {
        if (show) {
          await Future.delayed(const Duration(milliseconds: 1000));
        }
        setState(() {
          show = !show;
        });
      },
      duration: widget.duration,
      child: const Icon(
        Icons.favorite,
        shadows: [Shadow(color: Colors.black, blurRadius: 5)],
        color: Color(0xFFECAD9E),
      ),
    );
  }
}

class ActionMore extends StatefulWidget {
  ActionMore({super.key});

  @override
  State<ActionMore> createState() => _ActionMoreState();
}

class _ActionMoreState extends State<ActionMore>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
      duration: const Duration(milliseconds: 100), vsync: this);
  bool isz = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isz) {
          controller.forward();
          isz = !isz;
        } else {
          controller.reverse();
          isz = !isz;
        }

        Provider.of<PublicProvider>(context, listen: false)
            .changeimage('lib/common/image/cloud.jpeg');
      },
      child: RotationTransition(
        alignment: Alignment.center,
        turns: Tween(begin: 0.0, end: 0.125).animate(CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        )),
        child: Container(
          child: Icon(
            Icons.add,
            size: 30.w,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class BottomSliver extends StatefulWidget {
  const BottomSliver({super.key});

  @override
  State<BottomSliver> createState() => _BottomSliverState();
}

class _BottomSliverState extends State<BottomSliver> {
  bool _offstage=false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onVerticalDragUpdate: (detail) async{
          setState(() {
            _offstage=true;
          });
          await showModalBottomSheet(
              barrierColor:Colors.black38,
            constraints: BoxConstraints(minHeight: 50.w),
            context: context,
            builder: (context) {
              return Container(
                height: 265.w,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(bottom: 10.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                            bottomLeft: Radius.circular(10.r),
                            bottomRight: Radius.circular(10.r)),
                        child: Opacity(
                          opacity: 0.8,
                          child: Container(
                            width: 250.h,
                            height: 5.w,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              topLeft: Radius.circular(20.r))),

                      height: 250.w,
                      width: double.infinity,

                    ),
                  ],
                ),
              );
            },
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),),
            isScrollControlled: true,
          );
          setState(() {
            _offstage=false;
          });
        },
        child: Offstage(
          offstage: _offstage,
          child: Padding(
            padding: EdgeInsets.only(top: 40.w,bottom: 15.w),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r)),
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  width: 250.h,
                  height: 5.w,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ));
  }
}
