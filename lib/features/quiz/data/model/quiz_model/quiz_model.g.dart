// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) {
  return QuizModel(
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as String,
    chapterId: json['chapter'] as int,
  );
}

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'chapter': instance.chapterId,
    };
