import 'package:flutter/material.dart';

class Ex3 extends StatelessWidget {
  const Ex3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 100),
              height: 500,
              width: width - 40,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/lemon.jpeg'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(8)),
            ),
            Positioned(
              top: 110,
              left: 20,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: width - 40,
                  child: Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/lemon.jpeg'),
                              fit: BoxFit.fill,
                            ),
                            border: Border.all(color: Colors.white, width: 4),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Trần Công Dũng',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Nước chanh ngon quá',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                    ],
                  )),
            ),
            const Positioned(
              bottom: 50,
              left: 30,
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'Nước chanh thơm ngon',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
              ),
            ),
            const Positioned(
              bottom: 20,
              right: 30,
              child: Text(
                'Mời bạn uống nha',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
