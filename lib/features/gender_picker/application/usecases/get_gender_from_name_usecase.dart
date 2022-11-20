import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:test_app/features/gender_picker/domain/entities/gender_response.dart';
import 'package:test_app/features/gender_picker/domain/repositories/gender_picker_repository.dart';
import 'package:test_app/features/gender_picker/domain/values/person_name.dart';

class GetGenderFromNameUsecase
    extends StateNotifier<AsyncValue<Option<GenderResponse>>> {
  GetGenderFromNameUsecase({
    required this.genderPickerRepository,
  }) : super(AsyncValue.data(Option.none()));

  final GenderPickerRepository genderPickerRepository;

  Future<void> call({required PersonName name}) async {
    state = const AsyncLoading();

    final genderEither = await genderPickerRepository.getGenderFromName(
      name: name.value.getOrElse((_) => throw Exception()),
    );

    state = genderEither.fold(
      (l) => AsyncValue.error(l.toString(), StackTrace.current),
      (r) => AsyncValue.data(Option.of(r)),
    );
  }
}
