import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String message) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"))
        ],
        content: Text(message),
      );
    },
  );
}
