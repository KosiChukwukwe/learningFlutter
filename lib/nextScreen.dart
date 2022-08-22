// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  void buttomPopUp() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(15),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Enjoying The App?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: Icon(Icons.cancel),
            )
          ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('more widgets'),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'BOTTOM SHEET WIDGET',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  ElevatedButton(
                      onPressed: buttomPopUp,
                      child: Text('Click me & look below')),
                  Divider(
                    thickness: 2,
                  ),
                ],
              )

              // how to use sliders, remember to check above
              // for the functions needed...

              ),
        ));
  }
}
