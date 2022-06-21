import 'package:clash_ap/screens/asking_tag.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  void showData(val) {
    print(val);
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
