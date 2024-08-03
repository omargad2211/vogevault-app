import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/categories.dart';
import 'package:flutter_application_5/screens/home.dart';
import 'package:flutter_application_5/screens/login.dart';
import 'package:flutter_application_5/screens/sinup.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int pageIndex = 0;
  bool isHovered = false;

  final pages = [
    HomePage(),
    const Categories(),
    LogIn(),
    const SignUp(),
  ];

  // A method to handle navigation and animation trigger
  void _onIconTapped(int index, BuildContext context) {
    setState(() {
      pageIndex = index;
    });
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => pages[index],
      ),
    );
  }

  // A method to create animated icons
  Widget _buildAnimatedIcon(
      IconData activeIcon, IconData inactiveIcon, int index) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: pageIndex == index || isHovered ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: IconButton(
          enableFeedback: false,
          onPressed: () {
            _onIconTapped(index, context);
          },
          icon: pageIndex == index
              ? Icon(
                  activeIcon,
                  color: Colors.white,
                  size: 35,
                )
              : Icon(
                  inactiveIcon,
                  color: Colors.white,
                  size: 35,
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildAnimatedIcon(Icons.home_filled, Icons.home_outlined, 0),
          _buildAnimatedIcon(
              Icons.shopping_cart_checkout,
              Icons.shopping_cart_checkout_outlined, 1),
          _buildAnimatedIcon(Icons.notifications_active, Icons.notifications_active_outlined, 2),
          _buildAnimatedIcon(Icons.person, Icons.person_outline, 3),
        ],
      ),
    );
  }
}
