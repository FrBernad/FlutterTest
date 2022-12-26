import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, this.error}) : super(key: key);

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        error.toString(),
      ),
    );
  }
}
