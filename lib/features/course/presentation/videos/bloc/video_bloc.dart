import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/errors/error.dart';
import '../../../domain/entity/video_data.dart';
import '../../../domain/repositories/subject_repo.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final SubjectRepo subjectRepo;

  VideoBloc({
    @required this.subjectRepo,
  }) : super(VideoInitial());

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {
    if (event is VideoPageStartEvent) {
      yield VideoInProgress();
      final res = await subjectRepo.getVideos(event.chapterID);

      yield* res.fold((error) async* {
        yield VideoFailure(error);
        log(error.message ?? error.stackTrace);
      }, (videos) async* {
        yield VideoSuccess(videos);
        if (videos.length > 0) {
          yield CurrentVideoState(videos[0]);
        }
      });
    }

    if (event is VideoChangeEvent) {
      yield CurrentVideoState(event.videoData);
    }
  }
}
