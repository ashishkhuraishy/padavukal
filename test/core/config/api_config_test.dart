import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:padavukal/core/config/api_config.dart';
import 'package:padavukal/core/constants/api_contsants.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/data/models/course_model.dart';

import '../../fixtures/fixture.dart';

class MockHttp extends Mock implements Client {}

class MockUser extends Mock implements User {}

main() {
  MockHttp client = MockHttp();
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
      client.get(any, headers: anyNamed('headers')),
    ).thenAnswer(
      (realInvocation) async => Response(
        fixture('course.json'),
        200,
      ),
    );

    var res = await apiConfig.get<CourseModel>(
      endpoint: ApiEndpoints.courses,
      instance: CourseModel(),
    );

    res.fold((l) => _err = l, (r) => _courseModel = r);

    verify(client.get(
      ApiEndpoints.courses,
      headers: {
        HttpHeaders.authorizationHeader: mockToken,
      },
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
    when(client.get(any, headers: anyNamed("headers"))).thenAnswer(
      (realInvocation) async => Response(
        fixture('course_list.json'),
        200,
      ),
    );

    var res = await apiConfig.getList<CourseModel>(
      endpoint: ApiEndpoints.courses,
      instance: CourseModel(),
    );
    res.fold((l) => _err = l, (r) => _courseModels = r);
    verify(client.get(
      ApiEndpoints.courses,
      headers: {
        HttpHeaders.authorizationHeader: mockToken,
      },
    ));
    verify(mockUser.getIdToken());
    expect(res, isA<Right>());
    expect(_err, isNull);
    expect(_courseModels, isNotNull);
  });
}
