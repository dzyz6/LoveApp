import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled5/common/color.dart';
import 'package:untitled5/common/size.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
              image: AssetImage('lib/common/image/cloud.jpeg'),
              fit: BoxFit.cover),
        ),
        child: const SafeArea(
          child: Column(
            children: [
              CustomAppBar(),
            ],
          ),
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
        children: [LoveTime(), const ActionMore()],
      ),
    );
  }
}

class LoveTime extends StatelessWidget {
  LoveTime({super.key});

  final startDate = DateTime(2022, 11, 1);
  final endDate = DateTime.now();
  late final days = endDate.difference(startDate).inDays + 2;

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
                        const CircleAvatar(
                          radius: 23,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const CircleAvatar(
                          radius: 23,
                          child: Text("Che"),
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
      opacity: show ? 1 : 0.3,
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
        color: Color(0xFFD86DE8),
      ),
    );
  }
}

class ActionMore extends StatefulWidget {
  const ActionMore({super.key});

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
        turns: Tween(begin: 0.0, end: 0.25).animate(CurvedAnimation(
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
