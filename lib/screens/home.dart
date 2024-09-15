import 'package:flutter/material.dart';
import 'package:vecto/constants.dart';

import 'package:vecto/widgets/featured_destinations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryDark,
        foregroundColor: const Color.fromARGB(255, 26, 80, 87),
        child: const Icon(Icons.airplane_ticket_sharp),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 47, 47, 47),
          selectedItemColor: primaryLight,
          unselectedItemColor: const Color.fromARGB(255, 88, 158, 167),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Plans'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
      backgroundColor: backgroundGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Welcome, Claire",
                    style: TextStyle(
                        color: primaryDark,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.5),
                  ),
                  const Spacer(),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Image(
                      image: AssetImage("assets/images/pfp.jpg"),
                      height: 40,
                    ),
                  )
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Where are you going next?",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: Icon(
                        Icons.send,
                        color: primaryDark,
                      ),
                      hintText: "Search for a destination",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: -0.5,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12.5,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const FeaturedDestinations(),
            ],
          ),
        ),
      ),
    );
  }
}
