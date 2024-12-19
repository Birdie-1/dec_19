import 'package:flutter/material.dart';

class ShowInfo extends StatefulWidget {
  const ShowInfo({super.key});

  @override
  State<ShowInfo> createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {

  var _email = TextEditingController();
  var _name  = TextEditingController();
  var _phone = TextEditingController();
  var  data = '';

  void showData() { 
    setState(() {
        data = 'Name : ${_name.value.text}\n';
        data += 'Email : ${_email.value.text}\n';
        data += 'Phone : ${_phone.value.text}\n';
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person Information'),
      ) , 
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Input Personal Data',
            style: TextStyle(fontSize: 20,color: Colors.blue,
                             fontFamily: 'Itim'),
             ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'enter email......',
                border: OutlineInputBorder(),
              ),
              controller: _email,
            ),

            SizedBox(height: 20),

            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'enter name ......',
                border: OutlineInputBorder(),
              ),
              controller: _name,
            ),

            SizedBox(height: 20),

            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'enter phone number ......',
                border: OutlineInputBorder(),
              ),
              controller: _phone,
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: showData, 
              child: Text('แสดงข้อมูล',
                          style: TextStyle(fontFamily: 'Itim', fontSize: 20,),),
                          style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      foregroundColor: Colors.black,
                                      shape: StadiumBorder()),
            ),

            SizedBox(height: 40),

            Text(data,style: TextStyle(fontFamily: 'Itim',fontSize: 16,),),

          ],
        ),
      ) ,
    );
  }
}