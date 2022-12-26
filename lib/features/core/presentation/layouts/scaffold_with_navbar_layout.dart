import 'package:flutter/material.dart';
import 'package:gender_picker/features/core/utils/extensions/build_context_extensions.dart';
import 'package:go_router/go_router.dart';

import '../../../../flavors.dart';
import '../widgets/bottom_navigation.dart';

class ScaffoldWithNavbarLayout extends StatelessWidget {
  const ScaffoldWithNavbarLayout({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(
          color: Colors.black,
          child: Text(F.title),
        ),
      ),
      body: child,
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
