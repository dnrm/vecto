import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vecto/constants.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  List<String> plans = [];

  @override
  void initState() {
    super.initState();
    _loadPlans();
  }

  Future<void> _loadPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    final vectoKeys = keys.where((key) => key.startsWith('vecto_')).toList();
    final vectoPlans =
        vectoKeys.map((key) => prefs.getString(key) ?? '').toList();

    setState(() {
      plans = vectoPlans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundGrey,
      appBar: AppBar(
        title: const Text('Plans'),
        backgroundColor: primaryDark,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                plans.isEmpty
                    ? const Text(
                        'No plans available.',
                        style: TextStyle(
                          fontSize: 18,
                          color: primaryDark,
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: plans.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              plans[index].split("-")[0] + "MXN/month" + " - " + plans[index].split("-")[1],
                              style: const TextStyle(
                                fontSize: 18,
                                color: primaryDark,
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
