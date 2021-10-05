import 'package:flutter/material.dart';

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
                      child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (builder, index) {
                          return Card(
                              elevation: 5,
                              child: Image.asset(restaurentIcons[index]));
                        },
                        scrollDirection: Axis.horizontal,
                      ),
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
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (builder, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 35),
                        elevation: 0,
                        child: SizedBox(
                          height: 300,
                          width: 220,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                height: 320,
                                left: 0,
                                width: 220,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.orangeAccent,
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                height: 170,
                                left: 25,
                                child: Container(
                                  width: 170,
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
