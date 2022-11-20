import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

abstract class ValueAbstract<T> {
  const ValueAbstract();

  Either<Failure, T> get value;

  @override
  String toString() => value.fold((l) => l.toString(), (r) => r.toString());

  String? get validate => value.fold((l) => l.toString(), (r) => null);
}
