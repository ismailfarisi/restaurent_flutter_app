import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'custom_rect_tween.dart';

class FoodDetail extends StatelessWidget {
  final int index;
  const FoodDetail({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: false,
            child: Stack(
              children: [
                Hero(
                    createRectTween: (a, b) {
                      return CustomRectTween(a, b);
                    },
                    flightShuttleBuilder: (context, animation, direction,
                        tocontext, fromcontext) {
                      Animation<double> newAnimation =
                          Tween(begin: 0.0, end: -0.25)
                              .chain(CurveTween(
                                  curve: const Interval(0.0, 1.0,
                                      curve: Curves.easeOut)))
                              .animate(animation);
                      return RotationTransition(
                        turns: newAnimation,
                        child: tocontext.widget,
                      );
                    },
                    tag: "container$index",
                    child: Container(
                        height: 300,
                        decoration: const BoxDecoration(
                            color: Colors.orangeAccent,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30),
                            )))),
                Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Hero(
                      flightShuttleBuilder: (c, animation, h, cc, ccc) {
                        Animation<double> newAnimation =
                            Tween(begin: 0.0, end: 1.0)
                                .chain(CurveTween(
                                    curve: const Interval(0.50, 1,
                                        curve: Curves.easeIn)))
                                .animate(animation);
                        if (h == HeroFlightDirection.pop) {
                          newAnimation = Tween(begin: 0.0, end: 1.0)
                              .chain(CurveTween(
                                  curve: const Interval(0.0, 0.5,
                                      curve: Curves.easeIn)))
                              .animate(animation);
                          return RotationTransition(
                              turns: newAnimation, child: cc.widget);
                        }
                        return RotationTransition(
                            turns: newAnimation, child: ccc.widget);
                      },
                      tag: 'food_image_$index',
                      child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/${index + 1}.png",
                              ),
                            ),
                          ))),
                )
              ],
            )));
  }
}

class ValleyQuadraticCurve extends Curve {
  @override
  double transform(double t) {
    assert(t >= 0.0 && t <= 1.0);
    return 4.0 * math.pow(t - 0.5, 2);
  }
}
