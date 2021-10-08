import 'package:flutter/material.dart';

class CustomRectTween extends RectTween {
  final Rect? a;
  final Rect? b;

  CustomRectTween(this.a, this.b) : super(begin: a, end: b);
  @override
  Rect? lerp(double t) {
    Curves.easeInExpo.transform(t);
    if (a != null && b != null) {
      final left = (b!.left + (b!.width / 2) - (b!.height / 2));
      final top = (b!.top + (b!.height / 2) - (b!.width / 2));
      final right = (b!.right - (b!.width / 2) + (b!.height / 2));
      final bottom = (b!.bottom - (b!.height / 2) + (b!.width / 2));
      final b1 = Rect.fromLTRB(left, top, right, bottom);

      return Rect.lerp(a, b1, t);
    }
  }
}
