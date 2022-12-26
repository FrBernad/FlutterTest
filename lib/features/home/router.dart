import 'package:gender_picker/features/gender_picker/presentation/screens/gender_picker_screen.dart';
import 'package:gender_picker/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class HomeRouter {
  HomeRouter._();

  static final router = GoRoute(
    name: HomeScreen.routeName,
    path: HomeScreen.route,
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: HomeScreen()),
    routes: const [
      // Child Routes
      // GoRoute(
      //   path: '/',
      // ),
    ],
  );
}
