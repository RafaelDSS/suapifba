import 'package:flutter/material.dart';

SnackBar snackBarError(String messageError) {
  return SnackBar(
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
    content: Text(messageError),
  );
}
