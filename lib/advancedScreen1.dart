// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, unused_local_variable, unnecessary_new

import 'package:flutter/material.dart';

class advancedScreen1 extends StatefulWidget {
  const advancedScreen1({Key? key}) : super(key: key);

  @override
  State<advancedScreen1> createState() => _advancedScreen1State();
}

class _advancedScreen1State extends State<advancedScreen1> {
  int counter = 0;
  List<Widget> list = [];

  @override
  void initState() {
    for (int i = 0; i < 5; i++) {
      Widget child = newItem(i);
      list.add(child);
    }
  }

  var value = "Nothing to see yet";

  void onPressed() {
    setState(() {
      value = DateTime.now().toString();
    });
  }

  void onClicked() {
    Widget child = newItem(counter);
    setState(() {
      list.add(child);
    });
  }

  Widget newItem(int i) {
    Key key = Key('item_$i');
    Container child = new Container(
      key: key,
      padding: EdgeInsets.all(10.0),
      child: Chip(
        label: Text('$i Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(i.toString()),
        ),
      ),
    );

    counter++;
    return child;
  }

  void removeItem(Key key) {
    for (int i = 0; i < list.length; i++) {
      Widget child = list.elementAt(i);
      if (child.key == key) {
        setState(() {
          list.removeAt(i);
          print('removing ${key.toString()}');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onClicked,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            children: [
              Text(value),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.timer),
                tooltip: 'click me',
              ),
              ...list,
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        IconButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const advancedScreen1()),
                ),
            icon: Icon(Icons.arrow_forward_ios_outlined)),
      ],
    );
  }
}
