import 'package:flutter/material.dart';

class TdeeApp extends StatefulWidget {
  const TdeeApp({super.key});

  @override
  State<TdeeApp> createState() => TdeeAppState();
}

class TdeeAppState extends State<TdeeApp> {
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  String _gender = 'Male';
  String _activityLevel = 'No Exercise';
  double? _bmr;
  double? _tdee;

  final Map<String, double> _activityMultiplier = {
    'No Exercise': 1.2,
    'Light Exercise (1-3 days/week)': 1.375,
    'Moderate Exercise (4-5 days/week)': 1.55,
    'Heavy Exercise (6-7 days/week)': 1.7,
    'Athlete (2 times/day)': 1.9,
  };

  void _calculate() {
    double weight = double.tryParse(_weightController.text) ?? 0;
    double height = double.tryParse(_heightController.text) ?? 0;
    int age = int.tryParse(_ageController.text) ?? 0;

    if (weight > 0 && height > 0 && age > 0) {
      setState(() {
        if (_gender == 'Male') {
          _bmr = 66 + (13.7 * weight) + (5 * height) - (6.8 * age);
        } else {
          _bmr = 665 + (9.6 * weight) + (1.8 * height) - (4.7 * age);
        }
        _tdee = _bmr! * _activityMultiplier[_activityLevel]!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person Information'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/weightlifter.png', // Corrected file name
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Gender:'),
                SizedBox(width: 10),
                Row(
                  children: [
                    Radio(
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text('Male'), // Corrected label
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value!;
                        });
                      },
                    ),
                    Text('Female'),
                  ],
                ),
              ],
            ),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Age'),
            ),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Weight (kg)'),
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Height (cm)'),
            ),
            SizedBox(height: 10),
            Text('Activity Level:'),
            DropdownButton<String>(
              value: _activityLevel,
              onChanged: (value) {
                setState(() {
                  _activityLevel = value!;
                });
              },
              items: _activityMultiplier.keys
                  .map((level) => DropdownMenuItem(
                        value: level,
                        child: Text(level), // Corrected text
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _calculate,
                child: Text('Calculate'),
              ),
            ),
            SizedBox(height: 20),
            if (_bmr != null && _tdee != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('BMR: ${_bmr!.toStringAsFixed(2)} cal'),
                  Text('TDEE: ${_tdee!.toStringAsFixed(2)} cal'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
