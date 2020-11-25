import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import 'core/config/api_config.dart';
import 'features/auth/data/repo/auth_repo_impl.dart';
import 'features/auth/domain/repositories/auth_repo.dart';
import 'features/course/data/data_source/courses_remote.dart';
import 'features/course/data/data_source/subject_remote.dart';
import 'features/course/data/repository/course_repo_impl.dart';
import 'features/course/data/repository/subject_repo.dart';
import 'features/course/domain/repositories/course_repo.dart';
import 'features/course/domain/repositories/subject_repo.dart';

final sl = GetIt.instance;
Future<void> init() async {
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
      auth: sl<FirebaseAuth>(),
      logger: sl<Logger>(),
    ),
  );

  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      firebaseAuth: sl(),
      googleSignIn: sl(),
      logger: sl(),
    ),
  );

  FirebaseAuth _auth = FirebaseAuth.instance;

  sl.registerLazySingleton(() => Client());
  sl.registerLazySingleton(() => Logger());
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => _auth);
}
