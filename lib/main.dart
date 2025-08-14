import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class Furniture {
  String name;
  double price;
  String material;
  Furniture({required this.name, required this.price, required this.material});
}


class MyApp extends StatelessWidget {
  MyApp({super.key});


  final List<Furniture> furnitureList = [
    Furniture(name: "Sofa", price: 12000, material: "Leather"),
    Furniture(name: "Dining Table", price: 8500, material: "Wood"),
    Furniture(name: "Bed", price: 25500, material: "Metal"),
    Furniture(name: "Chair", price: 1500, material: "Plastic"),
    Furniture(name: "Wardrobe", price: 9300, material: "Wood"),
    Furniture(name: "Bookshelf", price: 21000, material: "Engineered Wood"),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Furniture Details Catalog",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Furniture Details Catalog'),
          backgroundColor: const Color.fromARGB(255, 202, 152, 101),
        ),
        body: ListView.builder(
          itemCount: furnitureList.length,
          itemBuilder: (context, index) {
            final furniture = furnitureList[index];
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text(furniture.name[0]),
                  ),
                  title: Text(furniture.name),
                  subtitle: Text(
                    "Price: Rs.${furniture.price}\nMaterial: ${furniture.material}"
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 214, 122, 16),
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Items in WishList'),
                          content: Text("The ${furniture.name} is add to your Wishlist."),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK')
                            )
                          ],
                        )
                      );
                    },
                    child: Text('+ WishlList')
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${furniture.name} selected."),
                        duration: Duration(seconds: 1),
                      )
                    );
                  },
                ),
                Divider(
                  color:Colors.brown,
                  thickness: 3.0,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
