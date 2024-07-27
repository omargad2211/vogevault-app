import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/bottom_bar.dart';
import 'package:flutter_application_5/components/category_item.dart';
import 'package:flutter_application_5/screens/all_categories.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VogueVault",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.yellow[700],
        leading: const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.white,
          size: 32,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CategoryItem(
              icon: Icon(Icons.all_inbox_outlined),
              title: "All products",
              text: "+999 products",
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>  AllCategories(),
                  ),
                );
              },
            ),
                        CategoryItem(
              icon: Icon(Icons.add_shopping_cart_outlined),
              title: "New arrivals",
              text: "208 products",
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>  AllCategories(),
                  ),
                );
              },
            ),
            
            CategoryItem(
              icon: Icon(Icons.checkroom),
              title: "Clothes",
              text: "345 products",
            ),
            CategoryItem(
              icon: Icon(Icons.shopping_bag_outlined),
              title: "Bags",
              text: "123 products",
            ),
            CategoryItem(
              icon: Icon(Icons.directions_boat),
              title: "Shoes",
              text: "680 products",
            ),
            CategoryItem(
              icon: Icon(Icons.dvr_outlined),
              title: "Electronics",
              text: "345 products",
            ),
            CategoryItem(
              icon: Icon(Icons.diamond_outlined),
              title: "Jewelry",
              text: "89 products",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
