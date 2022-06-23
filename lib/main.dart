import 'dart:ffi';
import 'dart:io';

import 'package:clash_ap/dataStruct/stateOfPlayer.dart';
import 'package:clash_ap/screens/asking_tag.dart';
import 'package:clash_ap/screens/show_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String totalNeededCards = 'awaiting for data';

  //i using a fake function whit val in cose i don't undersdant why didn't whytout
  void showData(val) {
    getData();
  }

  void getData() async {
    try {
      num tmpValue = await StateOfPlayer().setStateOfPlayer;
      setState(() {
        totalNeededCards = tmpValue.toString();
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text('it work'),
              AskingTag(
                test: showData,
              ),
              ShowData(data: totalNeededCards),
            ],
          ),
        ),
      ),
    );
  }
}
