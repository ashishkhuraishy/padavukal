import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/error.dart';
import '../../domain/entity/quiz.dart';
import '../../domain/repo/quiz_repo.dart';
import '../data_source/quiz_model_remote.dart';

class QuizRepoImpl extends QuizRepo {
  final QuizRemote remote;

  QuizRepoImpl({
    @required this.remote,
  });

  @override
  Future<Either<Errors, List<Quiz>>> getAllQuiz(int id) {
    return remote.getAllQuiz(id);
  }

  @override
  Future<Either<Errors, List<Quiz>>> getAllExam(int id) {
    // TODO: implement getAllExam
    throw UnimplementedError();
  }
}
