import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/day4/login.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartList = Provider.of<AppData>(context).cartList;
    double sum = 0;
    for (var i = 0; i < cartList.length; i++) {
      sum += cartList[i].price;
    }
    print(sum);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            'Cart',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
          ),
        ),
        body: Container(
          color: Colors.yellow,
          child: Column(
            children: [
              SizedBox(
                height: 500,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: Provider.of<AppData>(context).cartList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              '- ${cartList[index].name}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              const Divider(
                thickness: 5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("$sum \$",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(onPressed: () {}, child: const Text('Buy'))
                ],
              )
            ],
          ),
        ));
  }
}
