// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoDataModel _$VideoDataModelFromJson(Map<String, dynamic> json) {
  return VideoDataModel(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    videoUrl: json['video_url'] as String,
    notesUrl: json['note'] as String ?? '',
    index: json['index'] as int,
    chapterID: json['chapter'] as int,
  );
}

Map<String, dynamic> _$VideoDataModelToJson(VideoDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'video_url': instance.videoUrl,
      'note': instance.notesUrl,
      'index': instance.index,
      'chapter': instance.chapterID,
    };
