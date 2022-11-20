import 'package:fpdart/fpdart.dart';
import 'package:gender_picker/features/gender_picker/domain/entities/gender_response.dart';

import '../../../core/error/failure.dart';

abstract class GenderPickerRepository {
  Future<Either<Failure, GenderResponse>> getGenderFromName({required String name});
}
