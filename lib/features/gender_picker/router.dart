import 'package:gender_picker/features/gender_picker/presentation/screens/gender_picker_screen.dart';
import 'package:go_router/go_router.dart';

class GenderPickerRouter {
  GenderPickerRouter._();

  static const route = "/";
  static const name = "gender_picker";

  static final router = GoRoute(
    name: name,
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
