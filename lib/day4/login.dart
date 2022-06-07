import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/day4/cart.dart';
import 'package:rest_api/day4/catalog.dart';

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return AppData();
      },
      child: MaterialApp(
        title: 'Flutter Provider',
        routes: {
          '/': (context) => const Login(),
          '/catalog': (context) => const Catalog(),
          '/cart': (context) => const Cart()
        },
      ),
    );
  }
}

class AppData extends ChangeNotifier {
  AppData();
  var rng = Random();
  List<CatalogItem> cartList = [];
  List<CatalogItem> catalogList = [
    CatalogItem(id: 1, name: 'amber', color: Colors.amber, price: 10),
    CatalogItem(id: 2, name: 'blueAccent', color: Colors.blueAccent, price: 5),
    CatalogItem(id: 3, name: 'cyanAccent', color: Colors.cyanAccent, price: 20),
  ];
  void selectedItem(int index) {
    catalogList[index].isSelected = true;
    notifyListeners();
  }

  void addItemToCart(CatalogItem item) {
    cartList.add(item);
    notifyListeners();
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // print(Provider.of<AppData>(context, listen: false).name);
                // Provider.of<AppData>(context, listen: false)
                //     .changeName('Tran Cong');
                Navigator.pushNamed(context, '/catalog');
              },
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 16,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
