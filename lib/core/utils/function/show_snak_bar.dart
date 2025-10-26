import 'package:flutter/material.dart';

void ShowSnakBar(BuildContext context, String Message, {required Color color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        Message,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    ),
  );
}
