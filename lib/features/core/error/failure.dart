import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return message;
  }
}

class ServerFailure extends Failure {
  const ServerFailure() : super(message: _failureMessage);

  static const _failureMessage = "Server Failure";
}

class UnprocessableEntityFailure extends Failure {
  const UnprocessableEntityFailure({required super.message});
}
