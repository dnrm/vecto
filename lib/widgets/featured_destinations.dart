import 'package:flutter/material.dart';

class FeaturedDestinations extends StatelessWidget {
  const FeaturedDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Featured Destinations',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.5,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 350,
          child: ListView(
            scrollDirection: Axis.horizontal,
            
            children: [
              _buildDestinationCard(
                image: 'assets/images/nyc-1.jpg',
                title: 'New York',
                subtitle: 'USA',
              ),
              _buildDestinationCard(
                image: 'assets/images/nyc-2.jpg',
                title: 'Berlin',
                subtitle: 'Germany',
              ),
              _buildDestinationCard(
                image: 'assets/images/einstein.JPG',
                title: 'Houston',
                subtitle: 'USA',
              ),
              _buildDestinationCard(
                image: 'assets/images/cupertino.jpeg',
                title: 'Cupertino',
                subtitle: 'USA',
              ),
              _buildDestinationCard(
                image: 'assets/images/cesky.jpg',
                title: 'Český Krumlov',
                subtitle: 'Czech Republic',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDestinationCard({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.65),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    letterSpacing: -0.5
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
