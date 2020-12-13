import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:padavukal/core/config/api_config.dart';
import 'package:padavukal/core/constants/api_contsants.dart';
import 'package:padavukal/features/quiz/data/model/quiz_model/quiz_model.dart';

import '../../../../core/errors/error.dart';
import '../../domain/entity/quiz.dart';

abstract class QuizRemote {
  Future<Either<Errors, List<Quiz>>> getAllQuiz(int id);

  Future<Either<Errors, List<Quiz>>> getAllExam(int id);
}

class QuizRemoteImpl extends QuizRemote {
  final ApiConfig apiConfig;

  QuizRemoteImpl({
    @required this.apiConfig,
  });

  @override
  Future<Either<Errors, List<Quiz>>> getAllQuiz(int id) {
    return apiConfig.getList<QuizModel>(
      endpoint: ApiEndpoints.listExams + id.toString(),
      instance: QuizModel(),
    );
  }

  @override
  Future<Either<Errors, List<Quiz>>> getAllExam(int id) {
    // TODO: implement getAllExam
    throw UnimplementedError();
  }
}
