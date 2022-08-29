// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_unnecessary_containers, constant_identifier_names, unnecessary_brace_in_string_interps, must_call_super

import 'package:flutter/material.dart';
import 'dart:async';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learningflutter/advancedScreen1.dart';

class NextScreen extends StatefulWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

enum Answers { YES, NO, MAYBE }

class _NextScreenState extends State<NextScreen> {
  final GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();

  String value = '';

  void setValue(String input) => setState(() {
        value = input;
      });

  Future askUser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: SimpleDialog(
              title: Text('Do You Like Flutter?'),
              children: [
                SimpleDialogOption(
                  child: Text("Yes"),
                  onPressed: () => Navigator.pop(context),
                ),
                SimpleDialogOption(
                  child: Text("No"),
                  onPressed: () => Navigator.pop(context),
                ),
                SimpleDialogOption(
                  child: Text("Maybe"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          );
        })) {
      case Answers.YES:
        setValue("Yes");
        break;
      case Answers.NO:
        setValue("No");
        break;
      case Answers.MAYBE:
        setValue("Maybe");
        break;
    }
  }

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

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  String displayText = "LOGIN";

  // Map Countries = Map();

  // void getData() async {
  //   var url = 'http://country.io/names.json';
  //   var response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       Countries = json.decode(response.body);
  //       print('Loaded ${Countries.length} countres');
  //     });
  //   } else {
  //     print("Status code: ${response.statusCode}");
  //   }
  // }

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
                    'BOTTOM SHEET WIDGET',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'SNACK BAR WIDGET',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'ALERT DIALOG WIDGET',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  title: Text(
                    'SIMPLE DIALOG WIDGET',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: (() => Navigator.pop(context)),
                  child: Text('Close'),
                )
              ]))),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),

                  // how to use bottom sheet, remember to check above
                  // for the functions needed...
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

                  // how to use snack bar, remember to check above
                  // for the functions needed...
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

                  // how to use alert dialog, remember to check above
                  // for the functions needed...
                  Text(
                    'ALERT DIALOG WIDGET',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: (() => showAlert(
                        context, 'I\'m just starting out in flutter, you?')),
                    child: Text('Click me'),
                  ),

                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // how to use a simple dialog widget, remember to check above
                  // for the functions needed...
                  Text(
                    'SIMPLE DIALOG WIDGET',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  ElevatedButton(
                    onPressed: askUser,
                    child: Text('Click me'),
                  ),

                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // how to use a text-editing controller whilst also learning about the expanded widget, remember to check above
                  // for the functions needed...
                  Text(
                    'TEXT CONTROLLER WIDGET',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  Row(
                    children: [
                      Text('Username'),
                      Expanded(
                        child: TextField(
                          controller: username,
                        ),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Text('Password'),
                      Expanded(
                        child: TextField(
                          controller: password,
                          obscureText: true,
                        ),
                      )
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: (() => setState(() {
                            displayText = 'LOGGED IN';
                          })),
                      child: Text(displayText),
                    ),
                  ),

                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // how to use the card widget, remember to check above
                  // for the functions needed...
                  Text(
                    'CARD WIDGET',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(30),
                            child: Column(children: [Text('I\'m a Card')]),
                          )),
                      Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(30),
                            child: Column(children: [Text('I\'m also a Card')]),
                          )),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  // how to use the card widget, remember to check above
                  // for the functions needed...
                  Text(
                    'IMAGE WIDGET',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  Image.asset('assets/images/memoji.png'),

                  Text(
                    'cos my memoji looks good',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  // // how to use the list view widget, remember to check above
                  // // for the functions needed...

                  // Text(
                  //   'LISTVIEW WIDGET',
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  // ),

                  // Text(
                  //   'Countries',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  // Expanded(
                  //     child: ListView.builder(
                  //   itemCount: Countries.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     String key = Countries.keys.elementAt(index);
                  //     return Row(
                  //       children: <Widget>[
                  //         Text('${key} : '),
                  //         Text(Countries[key])
                  //       ],
                  //     );
                  //   },
                  // ))
                ],
              )),
        ),
      ),

      // how to use footer button, remember to check above
      // for the functions needed...
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_outlined)),
            IconButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const advancedScreen1()),
                    ),
                icon: Icon(Icons.arrow_forward_ios_outlined)),
          ],
        ),
      ],
    );
  }

  // @override
  // void initState() {
  //   getData();
  // }
}
