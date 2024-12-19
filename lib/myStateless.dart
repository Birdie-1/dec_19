import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Example',
                style: TextStyle(color: Colors.blue),),
      ),
      body: Center(
        child: Text('Hello, I am a stateless widget!!!',
              style: TextStyle(fontSize: 20, color: Colors.red,),),
      ) ,
    );
  }
}
