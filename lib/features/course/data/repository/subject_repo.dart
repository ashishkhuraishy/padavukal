import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../../domain/entity/chapter.dart';
import '../../domain/entity/subject.dart';
import '../../domain/entity/video_data.dart';
import '../../domain/repositories/subject_repo.dart';
import '../data_source/subject_remote.dart';

class SubjectRepoImpl extends SubjectRepo {
  final SubjectRemote subjectRemote;

  SubjectRepoImpl({this.subjectRemote});

  @override
  Future<Either<Errors, List<Subject>>> getHomePage() {
    return subjectRemote.getHomePage();
  }

  @override
  Future<Either<Errors, List<Chapter>>> getChapters(int id) {
    return subjectRemote.getChapters(id);
  }

  @override
  Future<Either<Errors, List<VideoData>>> getVideos(int id) {
    return subjectRemote.getVideos(id);
  }
}
