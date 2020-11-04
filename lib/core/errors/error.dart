import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(includeIfNull: false)
class Errors {
  final String message;
  @JsonKey(name: 'status')
  final String statusCode;
  final String error;
  final String stackTrace;

  Errors({
    @required this.message,
    @required this.statusCode,
    @required this.error,
    this.stackTrace,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  factory Errors.newUnknownApiError({Response response, String stackTrace}) {
    return Errors(
      message: response.reasonPhrase ?? '',
      statusCode: response.statusCode.toString(),
      error: 'unknown_api_error',
      stackTrace: stackTrace,
    );
  }

  factory Errors.newApiError({Response response, String stackTrace}) {
    return Errors(
      message: response.reasonPhrase ?? '',
      statusCode: response.statusCode.toString(),
      error: 'unknown_api_error',
      stackTrace: stackTrace,
    );
  }

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
