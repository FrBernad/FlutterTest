import 'package:fpdart/fpdart.dart';

import '../../../core/error/failure.dart';
import '../../../core/values/value_abstract.dart';

class PersonName extends ValueAbstract<String> {

  factory PersonName(String input) {
    return PersonName._(
      _validate(input),
    );
  }

  const PersonName._(this._value);

  final Either<Failure, String> _value;

  @override
  Either<Failure, String> get value => _value;

}

Either<Failure, String> _validate(String input) {
  if (input.length >= 2) {
    return right(input);
  }

  return left(
    const UnprocessableEntityFailure(
      message: 'The name must be at least 2 characters in length',
    ),
  );
}
