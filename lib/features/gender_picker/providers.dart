// Data
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:gender_picker/config/providers.dart';
import 'package:gender_picker/features/gender_picker/application/usecases/get_gender_from_name_usecase.dart';
import 'package:gender_picker/features/gender_picker/data/datasources/remote/gender_picker_remote_datasource.dart';
import 'package:gender_picker/features/gender_picker/data/repositories/gender_picker_repository_impl.dart';
import 'package:gender_picker/features/gender_picker/domain/entities/gender_response.dart';

///
/// Data dependencies
///

final genderPickerRemoteDatasource = Provider(
  (ref) => GenderPickerRemoteDatasourceImpl(
    httpClient: ref.watch(dioProvider),
  ),
);

final genderPickerRepositoryProvider = Provider(
  (ref) => GenderPickerRepositoryImpl(
    remoteDatasource: ref.watch(genderPickerRemoteDatasource),
  ),
);

///
/// Application dependencies
///

final getGenderFromNameUsecaseProvider = StateNotifierProvider.autoDispose<
    GetGenderFromNameUsecase, AsyncValue<Option<GenderResponse>>>(
  (ref) => GetGenderFromNameUsecase(
    genderPickerRepository: ref.watch(genderPickerRepositoryProvider),
  ),
);
