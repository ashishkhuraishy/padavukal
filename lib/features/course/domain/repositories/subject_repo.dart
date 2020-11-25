import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../entity/chapter.dart';
import '../entity/subject.dart';
import '../entity/video_data.dart';

abstract class SubjectRepo {
  Future<Either<Errors, List<Subject>>> getHomePage();
  Future<Either<Errors, List<Chapter>>> getChapters(int id);
  Future<Either<Errors, List<VideoData>>> getVideos(int id);
}
