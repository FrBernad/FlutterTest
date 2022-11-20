import 'package:go_router/go_router.dart';
import 'package:test_app/features/gender_picker/presentation/screens/gender_picker_screen.dart';

class GenderPickerRouter {
  GenderPickerRouter._();

  static const route = "/";

  static final router = GoRoute(
    name: route,
    path: route,
    builder: (context, state) => const GenderPickerScreen(),
    routes: const [
      // Child Routes
      // GoRoute(
      //   path: '/',
      // ),
    ],
  );
}
