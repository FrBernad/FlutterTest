import 'package:flutter/material.dart';
import 'package:gender_picker/features/core/presentation/layouts/scaffold_with_navbar_layout.dart';
import 'package:gender_picker/features/core/presentation/screens/error_screen.dart';
import 'package:gender_picker/features/gender_picker/router.dart';
import 'package:gender_picker/features/home/presentation/screens/home_screen.dart';
import 'package:gender_picker/features/home/router.dart';
import 'package:go_router/go_router.dart';

import '../flavors.dart';

// GoRouter configuration

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: F.appFlavor == Flavor.local,
    initialLocation: HomeScreen.route,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) =>
            ScaffoldWithNavbarLayout(child: child),
        routes: [
          HomeRouter.router,
          GenderPickerRouter.router,
        ],
      ),
    ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
);
