import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:padavukal/core/config/api_config.dart';
import 'package:padavukal/features/course/data/data_source/courses_remote.dart';
import 'package:padavukal/features/course/data/data_source/subject_remote.dart';
import 'package:padavukal/features/course/data/repository/course_repo_impl.dart';
import 'package:padavukal/features/course/domain/repositories/course_repo.dart';
import 'package:padavukal/features/course/domain/repositories/subject_repo.dart';

import 'features/course/data/repository/subject_repo.dart';

final sl = GetIt.instance;
Future<void> init() {
  sl.registerLazySingleton<CourseRepo>(
    () => CourseRepoImpl(
      coursesRemote: sl(),
    ),
  );

  sl.registerLazySingleton<CoursesRemote>(
    () => CourseRemoteImpl(
      config: sl(),
    ),
  );

  sl.registerLazySingleton<SubjectRepo>(
    () => SubjectRepoImpl(
      subjectRemote: sl(),
    ),
  );

  sl.registerLazySingleton<SubjectRemote>(
    () => SubjectRemoteImpl(
      apiConfig: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => ApiConfig(
      client: sl<Client>(),
      user: sl<User>(),
      logger: sl<Logger>(),
    ),
  );

  FirebaseAuth _auth = FirebaseAuth.instance;

  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => Logger());
  sl.registerLazySingleton(() => _auth.currentUser);
}
