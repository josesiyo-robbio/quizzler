


import 'package:flutter/material.dart';



Future<void> messageFinish(BuildContext context)
{
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Finish!'),
        content: Text('In upcoming updates, we\'ll have more questions for you. Feel free to retake the quiz whenever you\'d like'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);

            },
            child: Text('close'),
          ),
        ],
      );
    },
  );
}
