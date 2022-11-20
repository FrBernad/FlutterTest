// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenderResponseModel _$GenderResponseModelFromJson(Map<String, dynamic> json) =>
    GenderResponseModel(
      name: json['name'] as String,
      gender: json['gender'] as String?,
      probability: (json['probability'] as num).toDouble(),
    );

Map<String, dynamic> _$GenderResponseModelToJson(
        GenderResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'probability': instance.probability,
    };
