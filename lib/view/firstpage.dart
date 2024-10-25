
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


String backimage='lib/common/image/cloud.jpeg';
class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage(backimage),
            fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Column(
          children: [
            CustomAppBar(),
            Spacer(),
            BottomSliver(),


          ],
        ),
      ),
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
  late final days = endDate.difference(startDate).inDays + 1;

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
                        CircleAvatar(
                          backgroundImage: AssetImage('lib/common/image/headimg1.jpg'),
                          radius: 23,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        CircleAvatar(
                          radius: 23,
                          backgroundImage: AssetImage('lib/common/image/headimg2.jpg'),
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
      curve: Curves.easeInOut,
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
        shadows: [Shadow(color: Colors.black,blurRadius: 5)],
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragStart: (detail){
        showModalBottomSheet(context: context, builder: (builder){
          return Container(
            child: Text("Asfddddddddddd"),
          );
        },);
      },
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r),topRight:Radius.circular(10.r) ,bottomLeft:Radius.circular(10.r) ,bottomRight: Radius.circular(10.r)),
          child: Opacity(
            opacity: 0.8,
            child: Container(
              width: 250.h,
                height: 5.w,
                color: Colors.black87,
                ),
          ),
        ),
      ));
  }
}
