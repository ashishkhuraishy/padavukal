import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../entity/quiz.dart';

abstract class QuizRepo {
  // List All quiz based on chapter id
  Future<Either<Errors, List<Quiz>>> getAllQuiz(int id);

  // List All Questions based on quiz
  Future<Either<Errors, List<Quiz>>> getAllExam(int id);
}
