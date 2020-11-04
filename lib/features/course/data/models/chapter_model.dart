import 'package:json_annotation/json_annotation.dart';
import 'package:padavukal/core/config/json_config.dart';
import 'package:padavukal/features/course/domain/entity/chapter.dart';

part 'chapter_model.g.dart';

@JsonSerializable(nullable: false)
class ChapterModel extends Chapter implements JsonModel<ChapterModel> {
  final int id;
  @JsonKey(name: 'subject')
  final int subjectId;
  final String name;

  ChapterModel({
    this.id,
    this.subjectId,
    this.name,
  }) : super(
          id: id,
          name: name,
          subjectId: subjectId,
        );

  @override
  ChapterModel fromJson(Map<String, dynamic> json) =>
      _$ChapterModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ChapterModelToJson(this);
}
