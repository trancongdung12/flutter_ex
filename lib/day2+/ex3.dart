import 'package:flutter/material.dart';

class Ex3 extends StatefulWidget {
  const Ex3({Key? key}) : super(key: key);

  @override
  _Ex3State createState() => _Ex3State();
}

class _Ex3State extends State<Ex3> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.ac_unit,
          color: Colors.green,
        ),
        title: const Text(
          'GENERALS',
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'AVERAGE SALARY',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            width: screenWidth - 40,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blueAccent,
                Colors.green,
              ],
            )),
            child: const Center(
              child: Text(
                '1300%/per month',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: const [
                    Text('Ngôn Ngữ\n Mới Nhất',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text('Flutter 1.0',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue))
                  ],
                ),
                Container(
                  height: 150,
                  width: 2,
                  color: Colors.black,
                ),
                Column(
                  children: const [
                    Text('HIGHEST\n SALARY',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("2500\$",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue))
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text('Most hired job?', style: TextStyle(fontSize: 14))),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: RichText(
              text: const TextSpan(
                text: 'React Native',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                children: [
                  TextSpan(
                      text: ' Flutter ',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: Colors.green)),
                  TextSpan(
                      text: ' React JS',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                  TextSpan(
                      text: ' Flutter ',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.green)),
                  TextSpan(
                      text: ' React JS',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
