import 'package:equatable/equatable.dart';

class GenderResponse extends Equatable {
  const GenderResponse({
    required this.name,
    required this.gender,
    required this.probability,
  });

  final String name;
  final String? gender;
  final double probability;

  @override
  List<Object?> get props => [name, gender, probability];
}
