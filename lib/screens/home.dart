
import 'package:flutter/material.dart';
import 'package:flutter_application_5/screens/login.dart';
import 'package:flutter_application_5/screens/sinup.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHoveringLogin = false; // Track hover state for login button
  bool _isHoveringSignup = false; // Track hover state for sign up button

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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home.jpg'),
                fit: BoxFit.cover, // Cover the entire screen
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const LogIn(),
                        ),
                      );
                    },
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _isHoveringLogin = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _isHoveringLogin = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsetsDirectional.only(bottom: 16),
                        width: _isHoveringLogin
                            ? 260
                            : 240, // Increase width on hover
                        height: _isHoveringLogin
                            ? 50
                            : 40, // Increase height on hover
                        decoration: BoxDecoration(
                          color: _isHoveringLogin
                              ? Colors.blueGrey[100]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: _isHoveringLogin
                              ? [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 5))
                                ]
                              : [],
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const SignUp(),
                        ),
                      );
                    },
                    child: MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          _isHoveringSignup = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          _isHoveringSignup = false;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: _isHoveringSignup
                            ? 260
                            : 240, // Increase width on hover
                        height: _isHoveringSignup
                            ? 50
                            : 40, // Increase height on hover
                        decoration: BoxDecoration(
                          color: _isHoveringSignup
                              ? Colors.white70
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white, // Set the border color
                            width: 2.0, // Set the border width
                          ),
                          boxShadow: _isHoveringSignup
                              ? [
                                  BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 5))
                                ]
                              : [],
                        ),
                        child: const Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
