import 'package:flutter/material.dart';

showConfirmationDialog(String title, Function onConfirm, BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(
          title,
        ),
        actions: <Widget>[
          new TextButton(onPressed: () => Navigator.of(context).pop(), child: new Text('Cancel')),
          new TextButton(
              onPressed: () {
                onConfirm();
                Navigator.of(context).pop();
              },
              child: new Text(
                'Confirm',
              )),
        ],
      );
    },
  );
}