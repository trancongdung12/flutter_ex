import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Category {
  String name;
  bool isClose;
  Category(this.name, this.isClose);
}

class Ex4 extends StatelessWidget {
  const Ex4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Category> _categories = [
      Category('Healthy', true),
      Category('Vagen', true),
      Category('Carrots', false),
      Category('Greens', false),
      Category('Wheat', false),
      Category('Pescetarian', true),
      Category('Min', true),
      Category('Lemongrass', true),
    ];
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Fooderlich'),
        backgroundColor: Colors.black54,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 50),
              height: 500,
              width: width - 40,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/lemon.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(8)),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Recipe Trends',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, position) {
                        return Chip();
                      },
                    ),
                  ),
                  // Wrap(
                  //   spacing: 8.0,
                  //   children: const [
                  //     Chip(),
                  //     Chip(),
                  //     Chip(),
                  //     Chip(),
                  //     Chip(),
                  //     Chip(),
                  //     Chip()
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Chip extends StatelessWidget {
  const Chip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 100,
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            const Text(
              'Lemo',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              height: 20,
              width: 20,
              child: const Icon(
                Icons.close,
                size: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
