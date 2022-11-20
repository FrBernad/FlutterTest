import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/gender_response.dart';

part 'gender_response_model.g.dart';

@JsonSerializable()
class GenderResponseModel extends GenderResponse {
  const GenderResponseModel({
    required String name,
    required String? gender,
    required double probability,
  }) : super(name: name, gender: gender, probability: probability);

  factory GenderResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GenderResponseModelFromJson(json);
}
