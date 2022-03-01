import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String message;

  const CustomError({
    this.message = '',
  });

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'CustomError(errorMsg: $message)';
}
