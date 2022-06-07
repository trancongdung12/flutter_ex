import 'package:flutter/material.dart';

class Ex1 extends StatelessWidget {
  const Ex1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Push'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('GoBack'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
