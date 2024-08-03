// import 'package:flutter/material.dart';
// import 'package:flutter_application_5/components/app_bar.dart';

// class AllCategories extends StatelessWidget {
//   const AllCategories({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search Categories',
//                 hintStyle: TextStyle(color: Colors.grey[600]),
//                 prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30.0),
//                   borderSide: BorderSide.none,
//                 ),
//                 contentPadding:
//                     EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
//               ),
//               onChanged: (value) {
//                 // Implement search functionality or filtering logic
//                 print('Search query: $value');
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/app_bar.dart';
import 'package:flutter_application_5/components/category_item.dart';

class AllCategories extends StatelessWidget {
  final List<CategoryItem> categories = [
    CategoryItem(
      title: 'New Arrivals',
      text: '208 Products',
      icon: const Icon(Icons.add_shopping_cart_outlined, color: Colors.white),
      image: Image.asset(
        'assets/images/clothes.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      onTap: () {
        print('New Arrivals Tapped');
      },
    ),
    CategoryItem(
      title: 'Clothes',
      text: '358 Products',
      icon: const Icon(Icons.checkroom, color: Colors.white),
      image: Image.asset(
        'assets/images/cloth.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      onTap: () {
        print('Clothes Tapped');
      },
    ),
    CategoryItem(
      title: 'Bags',
      text: '160 Products',
      icon: const Icon(Icons.shopping_bag, color: Colors.white),
      image: Image.asset(
        'assets/images/bags.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      onTap: () {
        print('Bags Tapped');
      },
    ),
    CategoryItem(
      title: 'Shoes',
      text: '230 Products',
      icon: const Icon(Icons.shopping_bag, color: Colors.white),
      image: Image.asset(
        'assets/images/R.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      onTap: () {
        print('Shoes Tapped');
      },
    ),
    CategoryItem(
      title: 'Electronics',
      text: '130 Products',
      icon: const Icon(Icons.electrical_services, color: Colors.white),
      image: Image.asset(
        'assets/images/electro.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      onTap: () {
        print('Electronics Tapped');
      },
    ),
    CategoryItem(
      title: 'Jewelry',
      text: '87 Products',
      icon: const Icon(Icons.diamond, color: Colors.white),
      image: Image.asset(
        'assets/images/product-original.jpg',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
      onTap: () {
        print('Jewelry Tapped');
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 4,
          ),
          itemBuilder: (context, index) {
            return categories[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.grey[850],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AllCategories(),
  ));
}
