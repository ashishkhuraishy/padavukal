// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Errors _$ErrorsFromJson(Map<String, dynamic> json) {
  return Errors(
    message: json['message'] as String,
    statusCode: json['status'] as int,
    error: json['error'] as String,
    stackTrace: json['stackTrace'] as String,
  );
}

Map<String, dynamic> _$ErrorsToJson(Errors instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('status', instance.statusCode);
  writeNotNull('error', instance.error);
  writeNotNull('stackTrace', instance.stackTrace);
  return val;
}
