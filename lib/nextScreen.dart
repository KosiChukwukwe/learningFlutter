// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  void showBar() {
    scaffoldState.currentState!
        .showSnackBar(SnackBar(content: Text('Thanks for using the app!')));
  }

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

  Future showAlert(BuildContext context, String messsage) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(title: Text(messsage), actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: (() => Navigator.pop(context)),
                    child: Text('Not at all'),
                  ),
                  TextButton(
                    onPressed: (() => Navigator.pop(context)),
                    child: Text('Same'),
                  )
                ],
              ),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: Text('more widgets'),
      ),
      drawer: Drawer(
          child: Container(
              padding: EdgeInsets.only(top: 70, bottom: 20),
              child: Column(children: [
                Text(
                  'CONTENTS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'THE CURRENT TIME',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
              ]))),
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  'SNACK BAR WIDGET',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: showBar,
                  child: Text('Click me & look below'),
                ),
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'ALERT DIALOG WIDGET',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                ElevatedButton(
                  onPressed: (() => showAlert(
                      context, 'I\'m just starting out in flutter, you?')),
                  child: Text('Click me'),
                ),
              ],
            )

            // how to use sliders, remember to check above
            // for the functions needed...

            ),
      ),
      persistentFooterButtons: [
        Align(
          alignment: Alignment.bottomLeft,
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_outlined)),
        ),
      ],
    );
  }
}
