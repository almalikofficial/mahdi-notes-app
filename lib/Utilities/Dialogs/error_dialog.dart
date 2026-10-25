import 'package:flutter/material.dart';
import 'package:notes_app/Utilities/Dialogs/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog<void>(
    context: context,
    title: 'an Error accurred',
    content: text,
    optionsBuilder: () => {'Ok': null},
  );
}
