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

  String Texts = "Hi there, welcome to my app";

  void onClick() {
    setState(() {
      Texts = "My name is Kosi.";
    });
  }

  var value = "Click to know the date and time";

  void onPressed() {
    setState(() {
      value = DateTime.now().toString();
    });
  }

  int digit = 0;

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

  int? num1 = 0;
  int? num2 = 0;

  void setNumRadio1(int? num) {
    setState(() {
      num1 = num;
    });
  }

  void setNumRadio2(int? num) {
    setState(() {
      num2 = num;
    });
  }

  Widget makeRadio() {
    List<Widget> list = [];

    for (int i = 0; i < 4; i++) {
      list.add(Radio(value: i, groupValue: num1, onChanged: setNumRadio1));
    }
    Column column = Column(
      children: list,
    );

    return column;
  }

  Widget makeRadioTiles() {
    List<Widget> list = [];

    for (int i = 0; i < 4; i++) {
      list.add(RadioListTile(
        value: i,
        groupValue: num2,
        onChanged: setNumRadio2,
        title: Text("List: $i"),
        subtitle: Text("bought..."),
      ));
    }
    Column column = Column(
      children: list,
    );

    return column;
  }

  bool entry1 = false;
  bool entry2 = false;

  void onSwitched1(bool value) {
    setState(() {
      entry1 = value;
    });
  }

  void onSwitched2(bool value) {
    setState(() {
      entry2 = value;
    });
  }

  double figure = 0.0;

  void onSlide(double value) {
    setState(() {
      figure = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('trying out flutter widgets'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: <Widget>[
                // how to use elevated buttons, remember to check above
                // for the functions needed...
                SizedBox(
                  height: 10,
                ),

                Text(
                  'ELEVATED BUTTON WIDGET',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
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

                Divider(
                  thickness: 2,
                ),

                SizedBox(
                  height: 20,
                ),

                // how to use text buttons, remember to check above
                // for the functions needed...

                Text(
                  'TEXT BUTTON WIDGET',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
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
                    )),

                Divider(thickness: 2),
                SizedBox(
                  height: 20,
                ),

                // how to use icon buttons, remember to check above
                // for the functions needed...

                Text(
                  'ICON BUTTON WIDGET',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),

                Text('Digit = $digit'),
                SizedBox(
                  height: 10,
                ),

                IconButton(onPressed: add, icon: Icon(Icons.add)),
                IconButton(onPressed: subtract, icon: Icon(Icons.remove)),

                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 30,
                ),

                // how to textfields, remember to check above
                // for the functions needed...

                Text(
                  'TEXTFIELD WIDGET',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),

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

                SizedBox(
                  height: 30,
                ),

                Divider(
                  thickness: 2,
                ),

                SizedBox(
                  height: 20,
                ),

                // how to use check boxes, remember to check above
                // for the functions needed...

                Text(
                  'CHECKBOX WIDGETS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CheckBox',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Checkbox(value: value1, onChanged: value1Changed),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'CheckBoxListTile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                CheckboxListTile(
                    value: value2,
                    title: Text("Assignment"),
                    controlAffinity: ListTileControlAffinity.leading,
                    subtitle: Text("Done"),
                    activeColor: Colors.blueGrey,
                    // checkColor: Colors.black,
                    secondary: Icon(Icons.check_box),
                    onChanged: value2Changed),

                Divider(
                  thickness: 2,
                ),

                SizedBox(
                  height: 20,
                ),

                //point to note, checkboxListTile > && beter than checkbox

                // how to use radios, remember to check above
                // for the functions needed...

                Text(
                  'RADIO WIDGETS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Radio',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                makeRadio(),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'RadiolistTile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                makeRadioTiles(),

                Divider(
                  thickness: 2,
                ),

                SizedBox(
                  height: 20,
                ),

                // how to use switches, remember to check above
                // for the functions needed...

                Text(
                  'SWITCH WIDGETS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Switch',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Switch(value: entry1, onChanged: onSwitched1),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'SwitchListTile',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SwitchListTile(
                  value: entry2,
                  onChanged: onSwitched2,
                  title: Text(
                    "grocery shopping",
                  ),
                ),
                Divider(
                  thickness: 2,
                ),

                SizedBox(
                  height: 20,
                ),

                // how to use sliders, remember to check above
                // for the functions needed...

                Text(
                  'SLIDER WIDGET',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),

                Text("figure: ${(figure * 50).round()}"),
                Slider(value: figure, onChanged: onSlide),
                Divider(
                  thickness: 2,
                ),

                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
