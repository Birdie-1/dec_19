import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  String data = 'Hello, I am stateful widget';

  void updateMessage(){
    setState(() {
      data = 'State changed!!!! You clicked the button';
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Widget Example!!!',
                style: TextStyle(fontSize: 18,color: Colors.red),),
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data,
                style: TextStyle(color: Colors.green,),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: updateMessage, 
                           child: Text('Click Me!!!'))
          ],
        ),
      ),

    );
  }
}