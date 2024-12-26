import 'package:flutter/material.dart';

class TdeeApp extends StatefulWidget {
  const TdeeApp({super.key});

  @override
  State<TdeeApp> createState() => TdeeAppState();
}

class TdeeAppState extends State<TdeeApp> {
<<<<<<< HEAD
=======
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

>>>>>>> 8d90c4f78a7aaefd5dc0d626213c75d77c457225
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text('Person Information'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(width: 100,height: 100,)
               child: Image.asset
            Text(
              'Enter your personal information',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your name...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your age...',
                border: OutlineInputBorder(),
              ),
            ),
            // Add more widgets or input fields as needed
          ],
=======
        title: const Text('Person Information'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Center(
                  child: Image.asset(
                    'assets/images/weightlifter.png', // Replace with actual path
                    width: 70,
                    height: 70,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('เพศ:'),
                    const SizedBox(width: 10),
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
                        const Text('ชาย'),
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
                        const Text('หญิง'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'ป้อนอายุ',
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue.shade300),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'ป้อนน้ำหนัก (กก.)',
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue.shade300),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'ป้อนส่วนสูง (ซม.)',
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue.shade300),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('กิจกรรมที่ทำในประจำวัน:'),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _activityLevel,
                  onChanged: (value) {
                    setState(() {
                      _activityLevel = value!;
                    });
                  },
                  items: _activityMultiplier.keys
                      .map((level) => DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          ))
                      .toList(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blue.shade300),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text('คำนวณ'),
                ),
                const SizedBox(height: 20),
                if (_bmr != null && _tdee != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('BMR: ${_bmr!.toStringAsFixed(2)} cal'),
                      Text('TDEE: ${_tdee!.toStringAsFixed(2)} cal'),
                    ],
                  ),
              ],
            ),
          ),
>>>>>>> 8d90c4f78a7aaefd5dc0d626213c75d77c457225
        ),
      ),
    );
  }
}
