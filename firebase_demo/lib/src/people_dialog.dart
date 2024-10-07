import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PeopleDialog extends StatefulWidget {
  const PeopleDialog({super.key});

  @override
  State<PeopleDialog> createState() => _PeopleDialogState();
}

class _PeopleDialogState extends State<PeopleDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("How many in your party?"),
      content: TextField(
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter> [
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    actions: <Widget>[
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        )
    ],
    );
  }
}