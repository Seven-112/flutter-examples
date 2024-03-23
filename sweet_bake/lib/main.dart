import 'package:flutter/material.dart';
import 'package:sweet_bake/dessert_view.dart';
import 'package:sweet_bake/desserts.dart';

void main() {
  runApp(const SweetBakeApp());
}

const kColorBackground = Color.fromARGB(255, 254, 190, 120);

class SweetBakeApp extends StatelessWidget {
  const SweetBakeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweet Bake',
      theme: ThemeData(
        primaryColor: kColorBackground,
      ),
      debugShowCheckedModeBanner: false,
      home: const SweetBakePage(),
    );
  }
}

class SweetBakePage extends StatelessWidget {
  const SweetBakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kColorBackground,
        title: const Center(
          child: Text('Sweet Bake'),
        ),
        actions: [
          IconButton(
            // ignore: avoid_print
            onPressed: () => print('Searching'),
            icon: const Icon(Icons.search),
          )
        ],
        leading: const Icon(Icons.menu),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              color: kColorBackground,
              child: Image.asset('images/background.png'),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  buildCupcake(),
                  // DessertView(desserts[0]),
                  DessertView(desserts[1]),
                  DessertView(desserts[2]),
                  DessertView(desserts[3]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCupcake() {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100,
        ),
        Positioned(
          bottom: 10,
          child: Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43c0b5.png',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
