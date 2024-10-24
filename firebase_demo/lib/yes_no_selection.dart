import 'package:flutter/material.dart';
import 'package:gtk_flutter/people_dialog.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'src/widgets.dart';

class YesNoSelection extends StatefulWidget {
  const YesNoSelection(
      {super.key, required this.state, required this.onSelection});
  final Attending state;
  final void Function(Attending selection) onSelection;
  @override
  State<YesNoSelection> createState() => _YesNoSelectionState();
}

class _YesNoSelectionState extends State<YesNoSelection> {
  @override
  Widget build(BuildContext context) {
    //switch (state) {
      //case Attending.yes:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              FilledButton(
                onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const PeopleDialog();
                  });
            },
                child: const Text('YES'),
              ),
              const SizedBox(width: 8),
              Consumer<ApplicationState>(
              builder: (context, appState, _) =>
              TextButton(
                onPressed: () {
                  setState(() {
              appState.attendees = 0;
                });
                },
                child: const Text('NO'),
              ),
          )],
          ),
  );}}

       /* );
      case Attending.no:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                onPressed: (){
              showDialog(
                  context: context,
                  builder: (_) {
                    return const PeopleDialog();
                  });
            },
                child: const Text('YES'),
              ),
              const SizedBox(width: 8),
              FilledButton(
                onPressed: () => onSelection(Attending.no),
                child: const Text('NO'),
              ),
            ],
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              StyledButton(
                onPressed: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const PeopleDialog();
                  });
            },
                child: const Text('YES'),
                
              ),
              const SizedBox(width: 8),
              StyledButton(
                onPressed: () => onSelection(Attending.no),
                child: const Text('NO'),
              ),
            ],
          ),
        );
    }
  }
}*/