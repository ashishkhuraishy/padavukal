import 'package:dartz/dartz.dart';

import '../../../../core/config/api_config.dart';
import '../../../../core/constants/api_contsants.dart';
import '../../../../core/errors/error.dart';
import '../../domain/entity/chapter.dart';
import '../../domain/entity/subject.dart';
import '../../domain/entity/video_data.dart';
import '../models/chapter_model.dart';
import '../models/subject_model.dart';
import '../models/video_data_model.dart';

abstract class SubjectRemote {
  Future<Either<Errors, List<Subject>>> getHomePage();
  Future<Either<Errors, List<Chapter>>> getChapters(int id);
  Future<Either<Errors, List<VideoData>>> getVideos(int id);
}

class SubjectRemoteImpl extends SubjectRemote {
  final ApiConfig apiConfig;

  SubjectRemoteImpl({this.apiConfig});
  @override
  Future<Either<Errors, List<Subject>>> getHomePage() {
    return apiConfig.getList<SubjectModel>(
      endpoint: ApiEndpoints.home,
      instance: SubjectModel(),
    );
  }

  @override
  Future<Either<Errors, List<Chapter>>> getChapters(int id) {
    return apiConfig.getList<ChapterModel>(
      endpoint: ApiEndpoints.getChapters + '$id',
      instance: ChapterModel(),
    );
  }

  @override
  Future<Either<Errors, List<VideoData>>> getVideos(int id) {
    return apiConfig.getList<VideoDataModel>(
      endpoint: ApiEndpoints.getVideos + '$id',
      instance: VideoDataModel(),
    );
  }
}
