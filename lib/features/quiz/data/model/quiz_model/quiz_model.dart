import 'package:json_annotation/json_annotation.dart';

import '../../../../../core/config/json_config.dart';
import '../../../domain/entity/quiz.dart';

part 'quiz_model.g.dart';

@JsonSerializable(nullable: false)
class QuizModel extends Quiz implements JsonModel<QuizModel> {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "chapter")
  final int chapterId;

  QuizModel({
    this.id,
    this.name,
    this.type,
    this.chapterId,
  }) : super(
          chapterId: chapterId,
          name: name,
          id: id,
          type: type,
        );

  @override
  QuizModel fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QuizModelToJson(this);
}
