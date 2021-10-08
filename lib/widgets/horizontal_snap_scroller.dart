import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'dart:math' as math;

import '../custom_rect_tween.dart';
import '../detail.dart';

class HorizontalSnapScroller extends StatelessWidget {
  const HorizontalSnapScroller({Key? key, this.foodImages = const []})
      : super(key: key);

  final List foodImages;

  @override
  Widget build(BuildContext context) {
    return ScrollSnapList(
      dynamicItemSize: true,
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: (builder, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    reverseTransitionDuration:
                        const Duration(milliseconds: 2000),
                    transitionDuration: const Duration(milliseconds: 2000),
                    pageBuilder: (builder, anim1, anim2) => FoodDetail(
                          index: index,
                        )));
          },
          child: Card(
            color: Colors.white30,
            elevation: 0,
            child: SizedBox(
              height: 250,
              width: 200,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    top: 50,
                    left: 0,
                    right: 0,
                    child: Hero(
                      createRectTween: (a, b) {
                        return CustomRectTween(a, b);
                      },
                      flightShuttleBuilder: (context, animation, direction,
                          tocontext, fromcontext) {
                        Animation<double> newAnimation =
                            Tween(begin: 0.25, end: 0.0)
                                .chain(CurveTween(
                                    curve: const Interval(0.0, .60,
                                        curve: Curves.easeOut)))
                                .animate(animation);

                        return RotationTransition(
                          turns: newAnimation,
                          child: fromcontext.widget,
                        );
                      },
                      tag: 'container$index',
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    height: 170,
                    left: 0,
                    right: 0,
                    child: Hero(
                      tag: 'food_image_$index',
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 45.0),
                                  color: Color(0xffe67e00),
                                  blurRadius: 50,
                                  spreadRadius: 2)
                            ],
                            image: DecorationImage(
                                image: AssetImage(foodImages[index]),
                                fit: BoxFit.fitHeight),
                            shape: BoxShape.circle),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      itemSize: 200,
      onItemFocus: (int) {},
    );
  }
}
