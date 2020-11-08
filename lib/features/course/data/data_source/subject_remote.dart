import 'package:dartz/dartz.dart';
import 'package:padavukal/core/config/api_config.dart';
import 'package:padavukal/core/constants/api_contsants.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/data/models/chapter_model.dart';
import 'package:padavukal/features/course/data/models/subject_model.dart';
import 'package:padavukal/features/course/domain/entity/chapter.dart';
import 'package:padavukal/features/course/domain/entity/subject.dart';

abstract class SubjectRemote {
  Future<Either<Errors, List<Subject>>> getHomePage();
  Future<Either<Errors, List<Chapter>>> getChapters(int id);
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
}
