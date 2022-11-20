import 'package:fpdart/fpdart.dart';
import 'package:gender_picker/features/gender_picker/data/datasources/remote/gender_picker_remote_datasource.dart';
import 'package:gender_picker/features/gender_picker/domain/entities/gender_response.dart';
import 'package:gender_picker/features/gender_picker/domain/repositories/gender_picker_repository.dart';

import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';

class GenderPickerRepositoryImpl implements GenderPickerRepository {
  GenderPickerRepositoryImpl(
      {required GenderPickerRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  final GenderPickerRemoteDatasource _remoteDatasource;

  @override
  Future<Either<Failure, GenderResponse>> getGenderFromName(
      {required String name}) async {
    try {
      final genderResponse =
          await _remoteDatasource.getGenderFromName(name: name);
      return Right(genderResponse);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }
}
