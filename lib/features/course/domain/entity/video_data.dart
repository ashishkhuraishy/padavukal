import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class VideoData extends Equatable {
  final int id;
  final String name;
  final String description;
  final String videoUrl;
  final String notesUrl;
  final int index;
  final int chapterID;

  VideoData({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.videoUrl,
    @required this.notesUrl,
    @required this.index,
    @required this.chapterID,
  });

  @override
  List<Object> get props => [
        id,
        name,
        description,
        videoUrl,
        notesUrl,
        index,
        chapterID,
      ];
}
