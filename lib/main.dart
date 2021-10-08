import 'package:flutter/material.dart';
import 'widgets/horizontal_snap_scroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

const restaurentIcons = [
  'assets/hamburger.png',
  'assets/ice-cream.png',
  'assets/pizza.png',
  'assets/roast-chicken.png',
  'assets/slush.png',
  'assets/spaguetti.png'
];
const foodImages = [
  'assets/1.png',
  'assets/2.png',
  'assets/3.png',
  'assets/4.png'
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width - 8.0;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0)),
                      width: screenWidth,
                      height: 50,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search_outlined,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Restaurents",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: screenWidth,
                      height: 80,
                      child: const RestaurentTypeSelectorBar(),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'Host',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const Text(
                      "Popular Foods",
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: HorizontalSnapScroller(
                  foodImages: foodImages,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurentTypeSelectorBar extends StatefulWidget {
  const RestaurentTypeSelectorBar({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurentTypeSelectorBar> createState() =>
      _RestaurentTypeSelectorBarState();
}

class _RestaurentTypeSelectorBarState extends State<RestaurentTypeSelectorBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (builder, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _index = index;
            });
          },
          child: Card(
              color: (_index == index) ? Colors.orange : Colors.white,
              elevation: 5,
              child: SizedBox(
                height: 50,
                width: 80,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    restaurentIcons[index],
                    fit: BoxFit.contain,
                  ),
                ),
              )),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
