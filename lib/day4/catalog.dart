import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/day4/login.dart';

class CatalogItem {
  int id;
  Color color;
  String name;
  int price;
  bool? isSelected;
  CatalogItem(
      {required this.id,
      required this.name,
      required this.color,
      this.isSelected,
      required this.price});
}

class Catalog extends StatelessWidget {
  const Catalog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final catalogList = Provider.of<AppData>(context).catalogList;
    void onAddToCart(int index) {
      Provider.of<AppData>(context, listen: false).selectedItem(index);
      Provider.of<AppData>(context, listen: false)
          .addItemToCart(catalogList[index]);
    }

    final int totalItem =
        Provider.of<AppData>(context, listen: false).cartList.length;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            'Catalog',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 30),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Stack(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cart');
                    },
                    icon: const Icon(Icons.shopping_bag)),
                Positioned(
                    top: 5,
                    right: 5,
                    child: totalItem == 0
                        ? const SizedBox(child: SizedBox.shrink())
                        : Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(15 / 2)),
                            child: Center(
                              child: Text(
                                totalItem.toString(),
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ))
              ],
            ),
          ],
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: catalogList.length,
            itemBuilder: (BuildContext context, int index) {
              final isSelected = catalogList[index].isSelected;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            color: catalogList[index].color),
                        const SizedBox(width: 20),
                        Text(
                            '${catalogList[index].name}  (${catalogList[index].price} vnd)'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        isSelected == true ? null : onAddToCart(index);
                      },
                      child: isSelected == true
                          ? const Icon(Icons.done)
                          : const Text(
                              'ADD',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            ),
                    ),
                  ],
                ),
              );
            }));
  }
}
