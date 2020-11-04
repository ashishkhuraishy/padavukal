// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) {
  return CourseModel(
    id: json['id'] as int,
    name: json['name'] as String,
    duration: json['duration'] as int,
    price: (json['price'] as num).toDouble(),
    isPremium: json['premium'] as bool,
  );
}

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'duration': instance.duration,
      'price': instance.price,
      'premium': instance.isPremium,
    };
