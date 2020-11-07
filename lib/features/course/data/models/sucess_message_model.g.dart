// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sucess_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SucessMessageModel _$SucessMessageModelFromJson(Map<String, dynamic> json) {
  return SucessMessageModel(
    paymentId: json['payment'] as String,
    message: json['message'] as String,
    stausCode: json['status'] as String,
  );
}

Map<String, dynamic> _$SucessMessageModelToJson(SucessMessageModel instance) =>
    <String, dynamic>{
      'payment': instance.paymentId,
      'message': instance.message,
      'status': instance.stausCode,
    };
