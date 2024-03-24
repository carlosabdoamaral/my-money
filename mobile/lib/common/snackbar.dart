import 'package:flutter/material.dart';

void showSnackBar(
    {required BuildContext context,
    required String label,
    SnackBarAction? action}) {
  final snackBar = SnackBar(
    content: Text(label),
    action: action ??
        SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
