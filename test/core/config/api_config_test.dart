import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:padavukal/core/config/api_config.dart';
import 'package:padavukal/core/constants/api_contsants.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/data/models/course_model.dart';

import '../../fixtures/fixture.dart';

class MockDio extends Mock implements Dio {}

class MockUser extends Mock implements User {}

main() {
  MockDio client = MockDio();
  MockUser mockUser = MockUser();
  Logger logger = Logger();
  ApiConfig apiConfig = ApiConfig(
    client: client,
    logger: logger,
    user: mockUser,
  );

  final mockToken = "1234556";

  setUp(() {
    when(mockUser.getIdToken()).thenAnswer((realInvocation) async => mockToken);
  });

  test('should return a valid [CourseModel] if using [CourseModel] as [T]',
      () async {
    Errors _err;
    CourseModel _courseModel;

    when(
      client.get(any, options: anyNamed('options')),
    ).thenAnswer(
      (realInvocation) async => Response(
        statusCode: 200,
        data: fixture('course.json'),
      ),
    );

    var res = await apiConfig.get<CourseModel>(
      endpoint: ApiEndpoints.courses,
      instance: CourseModel(),
    );

    res.fold((l) => _err = l, (r) => _courseModel = r);

    verify(client.get(
      ApiEndpoints.courses,
      options: anyNamed("options"),
    ));
    verify(mockUser.getIdToken());
    expect(res, isA<Right>());
    expect(_err, isNull);
    expect(_courseModel, isNotNull);
  });

  test(
      'should return a valid list of [CourseModel] if using [CourseModel] as [T]',
      () async {
    Errors _err;
    List<CourseModel> _courseModels;
    when(client.get(any, options: anyNamed("options"))).thenAnswer(
      (realInvocation) async => Response(
          statusCode: 200,
          data: fixture('course_list.json'),
          statusMessage: "Sucess"),
    );

    var res = await apiConfig.getList<CourseModel>(
      endpoint: ApiEndpoints.courses,
      instance: CourseModel(),
    );
    res.fold((l) => _err = l, (r) => _courseModels = r);
    verify(client.get(
      ApiEndpoints.courses,
      options: anyNamed('options'),
    ));
    verify(mockUser.getIdToken());
    expect(res, isA<Right>());
    expect(_err, isNull);
    expect(_courseModels, isNotNull);
  });
}
