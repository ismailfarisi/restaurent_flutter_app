import 'package:flutter/material.dart';

class FoodDetail extends StatelessWidget {
  final int index;
  FoodDetail({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Hero(
              tag: "container$index",
              child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(30),
                      ))))),
    );
  }
}
