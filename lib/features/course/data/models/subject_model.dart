import 'package:json_annotation/json_annotation.dart';

import '../../../../core/config/json_config.dart';
import '../../domain/entity/subject.dart';

part 'subject_model.g.dart';

@JsonSerializable(nullable: false)
class SubjectModel extends Subject implements JsonModel<SubjectModel> {
  final int id;
  @JsonKey(name: 'course')
  final int courseId;
  final String name;

  SubjectModel({
    this.id,
    this.courseId,
    this.name,
  }) : super(
          courseId: courseId,
          id: id,
          name: name,
        );

  @override
  SubjectModel fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}
