import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class Ex2 extends StatefulWidget {
  const Ex2({Key? key}) : super(key: key);

  @override
  _Ex2State createState() => _Ex2State();
}

class _Ex2State extends State<Ex2> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: Text('Thepist'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: ImageSlideshow(
                  width: screenWidth - 40,
                  height: 160,
                  initialPage: 0,
                  indicatorColor: Colors.white,
                  indicatorBackgroundColor: Colors.grey[700],
                  children: imgList.map((entry) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: NetworkImage(
                                entry,
                              ),
                              fit: BoxFit.cover)),
                    );
                  }).toList(),
                  isLoop: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Nearby Therapists',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text('See more',
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [1, 2, 3, 4, 5, 6, 7]
                        .map((el) => const ItemWidget())
                        .toList(),
                  ))
            ],
          ),
        ));
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80,
          width: 100,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.red),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dr. JoinDoe',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            const SizedBox(height: 5),
            const Text('16 An Nhon 3',
                style: TextStyle(color: Colors.black54, fontSize: 12)),
            const SizedBox(height: 5),
            Row(
              children: const [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.yellow,
                ),
                Text('5.0', style: TextStyle(fontSize: 12)),
                SizedBox(width: 10),
                Text('(200 reviewers)', style: TextStyle(fontSize: 12)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
