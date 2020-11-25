// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterModel _$ChapterModelFromJson(Map<String, dynamic> json) {
  return ChapterModel(
    thumbnail: json['thumbnail'] as String ?? '',
    id: json['id'] as int,
    subjectId: json['subject'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ChapterModelToJson(ChapterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subjectId,
      'thumbnail': instance.thumbnail,
      'name': instance.name,
    };
