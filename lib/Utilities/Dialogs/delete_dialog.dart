import 'package:flutter/material.dart';
import 'package:notes_app/Utilities/Dialogs/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete',
    content: 'Are you sure you want to delete this note?',
    optionsBuilder:()=>{
      'Yes': true,
      'Cancel': false,
    },
  ).then((value) => value ?? false);
}
