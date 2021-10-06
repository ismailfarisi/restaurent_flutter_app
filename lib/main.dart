import 'package:flutter/material.dart';
import 'package:restaurent_app/detail.dart';

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
                child: HorizontalSnapScroller(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalSnapScroller extends StatefulWidget {
  const HorizontalSnapScroller({
    Key? key,
  }) : super(key: key);

  @override
  State<HorizontalSnapScroller> createState() => _HorizontalSnapScrollerState();
}

class _HorizontalSnapScrollerState extends State<HorizontalSnapScroller>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;
  final PageController _scrollController =
      PageController(viewportFraction: 0.7);
  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    //  _scrollController = PageController(viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _scrollController,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (builder, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => FoodDetail(
                            index: index,
                          )));
            },
            child: Card(
              elevation: 0,
              child: SizedBox(
                height: 300,
                width: 200,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      height: 320,
                      left: 0,
                      width: 200,
                      child: Hero(
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
                      left: 25,
                      child: Container(
                        width: 170,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(foodImages[index])),
                            color: Colors.green,
                            shape: BoxShape.circle),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
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
              color: (_index == index) ? Colors.orange : Colors.white70,
              elevation: 5,
              child: Image.asset(restaurentIcons[index])),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }
}
