import 'package:flutter/material.dart';
import 'package:vecto/constants.dart';
import 'package:vecto/screens/home.dart';

import 'package:vecto/screens/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryDark,
        title: const Text(
          "VECTO",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: primaryLight,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: backgroundGrey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text(
                'LOG IN',
                style: TextStyle(
                  color: primaryLight,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'With your Capital One account',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildTextField(icon: Icons.email, hintText: 'Email'),
              const SizedBox(height: 20),
              _buildTextField(
                  icon: Icons.lock, hintText: 'Password', isPassword: true),
              const SizedBox(height: 20),
              _buildSubmitButton(context),
              const SizedBox(height: 100),
              _buildSignUpRow(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required IconData icon,
      required String hintText,
      bool isPassword = false}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        style: const TextStyle(
          color: Colors.white,
        ),
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            color: Colors.grey[400],
            letterSpacing: -0.5,
          ),
        ),
        TextButton(
          child: const Text(
            'Sign up',
            style: TextStyle(
              color: primaryDark,
              letterSpacing: -0.5,
            ),
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignUpScreen(),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryDark,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: const Text(
        'Log In',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      },
    );
  }
}
