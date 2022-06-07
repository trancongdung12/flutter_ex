import 'package:flutter/material.dart';
import 'package:rest_api/day4/login.dart';
import 'package:rest_api/day4/name_route.dart';

void main() {
  runApp(const MyAppProvider());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Login(),
      initialRoute: '/',
    );
  }
}
