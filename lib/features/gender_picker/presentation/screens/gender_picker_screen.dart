import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gender_picker/features/core/utils/extensions/build_context_extensions.dart';
import 'package:gender_picker/features/gender_picker/presentation/widgets/gender_picker_form.dart';
import 'package:gender_picker/flavors.dart';

import '../widgets/gender_picker_result.dart';

class GenderPickerScreen extends StatelessWidget {
  static const route = "/picker";
  static const routeName = "gender_picker";

  const GenderPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          GenderPicker(),
          GenderPickerResult(),
        ],
      ),
    );
  }
}
