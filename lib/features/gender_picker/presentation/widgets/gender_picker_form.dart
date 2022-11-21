import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gender_picker/features/gender_picker/providers.dart';

import '../../domain/values/person_name.dart';

class GenderPicker extends ConsumerStatefulWidget {
  const GenderPicker({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DepartmentCreateFormState();
}

class _DepartmentCreateFormState extends ConsumerState<GenderPicker> {
  final _formKey = GlobalKey<FormState>();
  PersonName? _name;

  @override
  Widget build(BuildContext context) {
    final getGenderProvider = ref.watch(getGenderFromNameUsecaseProvider);

    final errorText = getGenderProvider.maybeWhen(
      error: (error, _) => error.toString(),
      orElse: () => null,
    );

    final isLoading = getGenderProvider.maybeWhen(
      loading: () => true,
      data: (_) => getGenderProvider.isRefreshing, // TODO:
      orElse: () => false,
    );

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: (value) => _name = PersonName(value),
            decoration: InputDecoration(
              errorText: errorText,
              hintText: "Your name",
            ),
            validator: (value) => _name?.validate,
            readOnly: isLoading,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (_name == null) return;

                      if (!_formKey.currentState!.validate()) return;

                      ref.read(getGenderFromNameUsecaseProvider.notifier)(
                          name: _name!);
                    },
              child: isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Get Gender"),
            ),
          ),
        ],
      ),
    );
  }
}
