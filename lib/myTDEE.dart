import 'package:flutter/material.dart';

class TdeeApp extends StatefulWidget {
  const TdeeApp({super.key});

  @override
  State<TdeeApp> createState() => TdeeAppState();
}

class TdeeAppState extends State<TdeeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        ),
      ),
    );
  }
}
