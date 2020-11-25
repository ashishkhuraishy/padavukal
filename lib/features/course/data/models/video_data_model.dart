import 'package:json_annotation/json_annotation.dart';

import '../../../../core/config/json_config.dart';
import '../../domain/entity/video_data.dart';

part 'video_data_model.g.dart';

@JsonSerializable(nullable: false)
class VideoDataModel extends VideoData implements JsonModel<VideoDataModel> {
  final int id;
  final String name;
  final String description;
  @JsonKey(name: 'video_url')
  final String videoUrl;
  @JsonKey(name: 'note', nullable: true, defaultValue: '')
  final String notesUrl;
  final int index;
  @JsonKey(name: 'chapter')
  final int chapterID;

  VideoDataModel({
    this.id,
    this.name,
    this.description,
    this.videoUrl,
    this.notesUrl,
    this.index,
    this.chapterID,
  }) : super(
          chapterID: chapterID,
          description: description,
          id: id,
          index: index,
          name: name,
          notesUrl: notesUrl,
          videoUrl: videoUrl,
        );

  @override
  VideoDataModel fromJson(Map<String, dynamic> json) =>
      _$VideoDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VideoDataModelToJson(this);
}
