import 'package:equatable/equatable.dart';

class SucessMessage extends Equatable {
  final String paymentId;
  final String message;
  final String stausCode;

  SucessMessage({
    this.paymentId,
    this.message,
    this.stausCode,
  });

  @override
  List<Object> get props => [
        message,
        paymentId,
        stausCode,
      ];
}
