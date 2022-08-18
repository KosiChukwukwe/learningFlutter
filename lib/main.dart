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
  int digit = 0;
  String data = "";

  void onChange(String input) {
    setState(() {
      data = "Change: $input";
    });
  }

  void onSubmit(String input) {
    setState(() {
      data = "Submit: $input";
    });
  }

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

  void add() {
    setState(() {
      digit++;
    });
  }

  void subtract() {
    setState(() {
      digit--;
    });
  }

  bool? value1 = false;
  bool? value2 = false;

  void value1Changed(bool? value) {
    setState(() {
      value1 = value;
    });
  }

  void value2Changed(bool? value) {
    setState(() {
      value2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('trying out flutter'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: <Widget>[
              // how to use elevated buttons, remember to check above
              // for the functions needed...

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

              // how to use text buttons, remember to check above
              // for the functions needed...

              Text(value),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'Click me',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),

              // how to use icon buttons, remember to check above
              // for the functions needed...

              Text('Digit = $digit'),
              SizedBox(
                height: 10,
              ),

              IconButton(onPressed: add, icon: Icon(Icons.add)),
              IconButton(onPressed: subtract, icon: Icon(Icons.remove)),

              // how to textfields, remember to check above
              // for the functions needed...

              Text(data),
              TextField(
                decoration: InputDecoration(
                  labelText: "Hello",
                  hintText: "just type",
                  icon: Icon(Icons.type_specimen),
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.text,
                onChanged: onChange,
                onSubmitted: onSubmit,
              ),

              // how to use check boxes, remember to check above
              // for the functions needed...

              Checkbox(value: value1, onChanged: value1Changed),
              CheckboxListTile(value: value2, onChanged: value2Changed),
            ],
          ),
        ),
      ),
    );
  }
}
