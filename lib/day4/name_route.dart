import 'package:flutter/material.dart';

class MyAppNavigator extends StatelessWidget {
  const MyAppNavigator({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          // '/setting': (context) => const Setting()
          //register route
        },
        onGenerateRoute: (setting) {
          if (setting.name == '/setting') {
            return MaterialPageRoute(
                builder: (_) => Setting(
                      name: setting.arguments as String,
                    ));
          }
        },
        onUnknownRoute: (_) =>
            MaterialPageRoute(builder: (_) => const UnKnown()));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page Phút 53'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/setting', arguments: 'Dung nef');
              },
              child: Text('Go to setting'),
            )
          ],
        ),
      ),
    );
  }
}

class Setting extends StatelessWidget {
  const Setting({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Setting $name'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            )
          ],
        ),
      ),
    );
  }
}

class UnKnown extends StatelessWidget {
  const UnKnown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('404'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back'),
            )
          ],
        ),
      ),
    );
  }
}
