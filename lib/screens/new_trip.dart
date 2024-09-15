import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:vecto/constants.dart';
import 'package:http/http.dart' as http;
import 'package:vecto/screens/report.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

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

  String trimMessage(String input) {
    if (input.startsWith("{message:") && input.endsWith("}")) {
      return input.substring(9, input.length - 1).trim();
    }
    return input;
  }

  Future<void> savePrice(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    final String key = 'vecto_${const Uuid().v4()}';
    await prefs.setString(key, value);
    print('Saved price with key: $key');
  }

  String trimNumber(String input) {
    if (input.startsWith("{price:") && input.endsWith("}")) {
      return input.substring(7, input.length - 1).trim();
    }
    return input;
  }

  void createTrip(
    destination,
    people,
    departureDate,
    returnDate,
    departureCity,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(
          "http://127.0.0.1:5000/new_trip",
        ),
        body: json.encode(
          {
            "destinationCity": destination,
            "departureDate": departureDate,
            "arrivalDate": returnDate,
            "departureCity": departureCity,
            "numPeople": people,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      );
      final report = trimMessage(json.decode(response.body).toString());


      final priceResponse = await http.post(
        Uri.parse(
          "http://127.0.0.1:5000/find_price",
        ),
        body: json.encode(
          {
            "text": report,
          },
        ),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      );
      final price = trimNumber(json.decode(priceResponse.body).toString());
      savePrice('$destination-$price');

      print(report);
      print(price);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReportScreen(
            report: report,
          ),
        ),
      );
    } catch (error) {
      print(error);
    }
  }

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
          print("Creating trip...");
          createTrip(
            _destinationController.text,
            _peopleController.text,
            _departureController.text,
            _returnController.text,
            "Monterrey, México",
          );
        },
      ),
    );
  }
}
