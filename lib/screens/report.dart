import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:vecto/constants.dart';
import 'package:vecto/screens/home.dart';

class ReportScreen extends StatelessWidget {
  final String report;
  const ReportScreen({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        title: const Text('Travel Report'),
        backgroundColor: primaryDark,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                buildMarkdownFix(report),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
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
                        'Finish',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMarkdownFix(data) => Column(
        children: MarkdownGenerator().buildWidgets(
          data,
          config: MarkdownConfig(
            configs: [
              const PConfig(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.5,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
        ),
      );
}
