import 'package:flutter/material.dart';
import 'package:vecto/constants.dart';
import 'package:vecto/widgets/build_logo.dart';

// Routes
import 'package:vecto/screens/login.dart';
import 'package:vecto/screens/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 10),
            _buildTagline(),
            const SizedBox(height: 50),
            _buildTicketCard(),
            const SizedBox(height: 50),
            _buildLoginButton(context),
            const SizedBox(height: 10),
            _buildSignUpRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTagline() {
    return Text(
      'Get ahold of your subscriptions and never pay for something you don\'t need',
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey[400],
        letterSpacing: -0.5,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTicketCard() {
    return const Image(
      image: AssetImage("assets/images/flight-ticket.png"),
      height: 200,
      fit: BoxFit.cover,
    );
  }

  Widget _buildLoginButton(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryDark,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }

  Widget _buildSignUpRow(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(
            color: Colors.white,
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
            Navigator.push(
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
}
