part of 'video_bloc.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

class VideoPageStartEvent extends VideoEvent {
  final int chapterID;

  VideoPageStartEvent({
    @required this.chapterID,
  });
}

class VideoChangeEvent extends VideoEvent {
  final VideoData videoData;

  VideoChangeEvent({
    @required this.videoData,
  });
}
