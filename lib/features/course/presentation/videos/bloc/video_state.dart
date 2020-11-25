part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoInProgress extends VideoState {}

class VideoSuccess extends VideoState {
  const VideoSuccess(this.videoDatas);

  final List<VideoData> videoDatas;

  @override
  List<Object> get props => [videoDatas];
}

class VideoFailure extends VideoState {
  const VideoFailure(this.error);

  final Errors error;

  @override
  List<Object> get props => [error];
}

class CurrentVideoState extends VideoState {
  final VideoData videoData;

  CurrentVideoState(this.videoData);

  @override
  List<Object> get props => [videoData];
}
