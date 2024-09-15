import 'package:flutter/material.dart';
import 'package:vecto/constants.dart';

class NewTripPage extends StatefulWidget {
  const NewTripPage({super.key});

  @override
  State<NewTripPage> createState() => _NewTripPageState();
}

class _NewTripPageState extends State<NewTripPage> {
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _returnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: _nextButton(),
      ),
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        title: const Text('New Trip'),
        backgroundColor: backgroundGrey,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Headings with questions
              const SizedBox(height: 40),
              const Text(
                'Where are you going?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _destinationController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    hintText: "Type in a destination",
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
              const SizedBox(height: 20),
              const Text(
                'How many people are going?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _peopleController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.people,
                      color: Colors.grey,
                    ),
                    hintText: "Number of people",
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
              const SizedBox(height: 20),
              const Text(
                'Choose a departure date',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _departureController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.flight_takeoff,
                      color: Colors.grey,
                    ),
                    hintText: "DD-MM-YYYY",
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
              const SizedBox(height: 20),
              const Text(
                'Choose a return date',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  controller: _returnController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.flight_land,
                      color: Colors.grey,
                    ),
                    hintText: "DD-MM-YYYY",
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
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
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          print("""
Departure: ${_departureController.text} 
Destination: ${_destinationController.text}
People: ${_peopleController.text}
Return: ${_returnController.text}
""");
          print(_departureController.text);
          print(_destinationController.text);
          print(_peopleController.text);
          print(_returnController.text);
        },
      ),
    );
  }
}
