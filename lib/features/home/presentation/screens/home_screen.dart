import 'package:flutter/material.dart';
import 'package:gender_picker/features/core/utils/extensions/build_context_extensions.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/";
  static const routeName = "home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.tr.homeWelcome),
    );
  }
}
