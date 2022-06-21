import 'package:clash_ap/screens/show_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AskingTag extends StatefulWidget {
  Function(String) test;

  AskingTag({
    Key? key,
    required this.test,
  }) : super(key: key);

  @override
  State<AskingTag> createState() => _AskingTagState();
}

class _AskingTagState extends State<AskingTag> {
  var battleTag = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'ur tag',
          ),
          onChanged: (value) => battleTag = value,
        ),
        TextButton(
            onPressed: () {
              widget.test(battleTag);
            },
            child: Text('find'))
      ],
    );
  }
}
