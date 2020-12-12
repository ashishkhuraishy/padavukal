import 'package:json_annotation/json_annotation.dart';

import '../../../../core/config/json_config.dart';
import '../../domain/entity/course.dart';

part 'course_model.g.dart';

@JsonSerializable(nullable: false)
class CourseModel extends Course implements JsonModel<CourseModel> {
  final int id;
  final String name;
  final int duration;
  final double price;
  @JsonKey(name: 'premium')
  final bool isPremium;
  @JsonKey(name: 'subscription')
  final bool isSubscribed;
  @JsonKey(name: 'expiry')
  final bool isExpired;

  CourseModel({
    this.id,
    this.name,
    this.duration,
    this.price,
    this.isPremium,
    this.isExpired,
    this.isSubscribed,
  }) : super(
          duration: duration,
          id: id,
          isPremium: isPremium,
          name: name,
          price: price,
          isExpired: isExpired,
          isSubscribed: isSubscribed,
        );

  @override
  CourseModel fromJson(Map<String, dynamic> json) =>
      _$CourseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CourseModelToJson(this);
}
