import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_application_5/components/app_bar.dart';
import 'package:flutter_application_5/screens/login.dart';
import 'package:flutter_application_5/models/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool value = false;

  // Check if the user exists in the local Hive database
  Future<bool> _userExists(String email) async {
    var userBox = Hive.box<User>('users');
    return userBox.values.any((user) => user.email == email);
  }

  // Function to sign up the user
  Future<void> _signUp(BuildContext context) async {
    final userName = _userNameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields.'),
        ),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match.'),
        ),
      );
      return;
    }

    // Check if the user already exists
    if (await _userExists(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User already exists with this email.'),
        ),
      );
      return;
    }

    // Open the Hive box and add the new user
    var userBox = Hive.box<User>('users');
    final newUser = User(
      userName: userName, // Ensure the parameter name matches the User model
      email: email,
      password: password,
    );
    await userBox.add(newUser);

    // Show success message and navigate to login page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sign up successful!'),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>  LogIn(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), // Use the fixed CustomAppBar
      body: SingleChildScrollView(
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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Create a new account ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 56),
                ],
              ),
              TextField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  labelText: 'User Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
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
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: <Widget>[
                  const SizedBox(width: 10),
                  const Text(
                    'Agree to Terms & Conditions:',
                    style: TextStyle(fontSize: 17.0, color: Colors.grey),
                  ),
                  const SizedBox(width: 10),
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.yellow[700],
                    value: value,
                    onChanged: (bool? newValue) {
                      setState(() {
                        value = newValue!;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        if (value) {
                          _signUp(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please accept the terms and conditions.'),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Sign Up',
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
