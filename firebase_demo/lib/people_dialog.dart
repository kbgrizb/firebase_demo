import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';                          

class PeopleDialog extends StatefulWidget {
  const PeopleDialog({super.key});

  @override
  State<PeopleDialog> createState() => _PeopleDialogState();
}

int valueText = 0;
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
        onChanged: (value){
          valueText = int.parse(value);
        },
      ),
    actions: <Widget>[
      Consumer<ApplicationState>(
            builder: (context, appState, _) =>
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () {
            setState(() {
              appState.attendees = valueText;
              Navigator.pop(context);
            });
          },
        )
      )
    ],
    );
  }
}