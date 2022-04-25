import 'package:flutter/material.dart';

class ShowAlertDialog extends StatefulWidget {
  ShowAlertDialog({Key? key}) : super(key: key);

  @override
  State<ShowAlertDialog> createState() => _ShowAlertDialogState();
}

class _ShowAlertDialogState extends State<ShowAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [],
    );
  }
}
