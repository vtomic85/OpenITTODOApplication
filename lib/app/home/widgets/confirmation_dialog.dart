import 'package:flutter/material.dart';

showConfirmationDialog(
    {required String title,
    required Function onConfirm,
    required BuildContext context,
    TextStyle? confirmationButtonStyle}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text(
          title,
        ),
        actions: <Widget>[
          new TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: new Text(
              'Cancel',
            ),
          ),
          new TextButton(
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
            child: new Text(
              'Confirm',
              style: confirmationButtonStyle ??
                  TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      );
    },
  );
}
