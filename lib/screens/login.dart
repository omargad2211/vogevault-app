import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_application_5/screens/success.dart';
import 'package:flutter_application_5/models/user.dart';
import 'package:collection/collection.dart';

class LogIn extends StatelessWidget {
   LogIn({super.key});

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const SizedBox(height: 32),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Please Login or Sign up to continue ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 56),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _login(context),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          minimumSize: const Size(320, 60),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your Facebook login logic here
                        },
                        icon: const Icon(Icons.facebook, color: Colors.white),
                        label: const Text(
                          'Continue with Facebook',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(320, 60),
                          backgroundColor: Colors.blue[800],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 19, 3, 3)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Add your Google login logic here
                          },
                          icon: const Icon(Icons.account_circle,
                              color: Colors.black),
                          label: const Text(
                            'Continue with Google',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(320, 60),
                            iconColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add your Apple login logic here
                        },
                        icon: const Icon(Icons.apple, color: Colors.black),
                        label: const Text(
                          'Continue with Apple',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(320, 60),
                          iconColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(BuildContext context) async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    // Open the Hive box
    var userBox = Hive.box<User>('users');

    // Find the user using firstWhere with a default value
    var user = userBox.values.firstWhereOrNull(
      (user) => user.email == email && user.password == password,
    );

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid email or password.'),
        ),
      );
      return;
    }

    // Proceed to the success page
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const Success(),
      ),
    );
  }
}
