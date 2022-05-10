import 'package:flutter/material.dart';

class Ex1 extends StatelessWidget {
  const Ex1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hello World',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text('Welcome to Flutter',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      print('touch me');
                    },
                    child: const Text('Touch to learn')),
                Container(
                    height: 200,
                    width: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://blog.vietnamlab.vn/content/images/1TNFw_7wEA1yZ-GSEtReH76r5tDTTioGQ.png"),
                        fit: BoxFit.cover,
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
