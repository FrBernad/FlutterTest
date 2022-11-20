import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers.dart';

class GenderPickerResult extends ConsumerWidget {
  const GenderPickerResult({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getGenderProvider = ref.watch(getGenderFromNameUsecaseProvider);

    final gender = getGenderProvider.maybeWhen(
      data: (genderResponse) => genderResponse.fold(
        () => '',
        (t) => t.gender ?? 'No gender',
      ),
      orElse: () => '',
    );

    return Text(gender);
  }
}
