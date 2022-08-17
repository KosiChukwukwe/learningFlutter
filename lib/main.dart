// ignore_for_file: use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: learningFlutter(),
  ));
}

class learningFlutter extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<learningFlutter> {
  String Texts = "Hi there, welcome to my app";
  var value = "Click to know the date and time";

  void onClick() {
    setState(() {
      Texts = "My name is Kosi.";
    });
  }

  void onPressed() {
    setState(() {
      value = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Vera is mad'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(Texts),
              ElevatedButton(
                  onPressed: onClick,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  child: Text(
                    'Click me',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(value),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'Click me',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
