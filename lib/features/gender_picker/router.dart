import 'package:gender_picker/features/gender_picker/presentation/screens/gender_picker_screen.dart';
import 'package:go_router/go_router.dart';

class GenderPickerRouter {
  GenderPickerRouter._();

  static final router = GoRoute(
    name: GenderPickerScreen.routeName,
    path: GenderPickerScreen.route,
    pageBuilder: (context, state) =>
        const NoTransitionPage(child: GenderPickerScreen()),
    routes: const [
      // Child Routes
      // GoRoute(
      //   path: '/',
      // ),
    ],
  );
}
