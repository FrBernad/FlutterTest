import 'package:flutter/material.dart';

import 'config/router.dart';
import 'flavors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: F.title,
      routerConfig: router,
    );
  }
}