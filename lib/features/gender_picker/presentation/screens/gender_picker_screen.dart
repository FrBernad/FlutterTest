import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/features/gender_picker/presentation/widgets/gender_picker_form.dart';
import 'package:test_app/flavors.dart';

import '../widgets/gender_picker_result.dart';

class GenderPickerScreen extends ConsumerWidget {
  const GenderPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text(F.title),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [GenderPicker(), GenderPickerResult()],
        ),
      ),
    );
  }
}
