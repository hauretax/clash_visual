import 'dart:ffi';
import 'dart:io';

import 'package:clash_ap/dataStruct/stateOfPlayer.dart';
import 'package:clash_ap/screens/asking_tag.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  void showData(val) {
    getData();
  }

  void getData() async {
    try {
      await StateOfPlayer().setStateOfPlayer();
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
            ],
          ),
        ),
      ),
    );
  }
}
