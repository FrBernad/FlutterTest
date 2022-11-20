import 'package:dio/dio.dart';
import 'package:test_app/config/logger/logger.dart';
import 'package:test_app/features/gender_picker/domain/entities/gender_response.dart';

import '../../../../core/error/exception.dart';
import '../../models/gender_response_model.dart';

abstract class GenderPickerRemoteDatasource {
  Future<GenderResponse> getGenderFromName({required String name});
}

class GenderPickerRemoteDatasourceImpl implements GenderPickerRemoteDatasource {
  GenderPickerRemoteDatasourceImpl({required httpClient})
      : _httpClient = httpClient;

  final Dio _httpClient;

  @override
  Future<GenderResponse> getGenderFromName({required String name}) async {
    try {
      final response = await _httpClient.get(
        '/',
        queryParameters: {'name': name},
      );
      if (response.statusCode != 200) {
        logger.d(response);
        throw ServerException();
      }
      return GenderResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d(e);
      throw ServerException();
    }
  }
}
