import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:padavukal/core/config/api_config.dart';
import 'package:padavukal/core/constants/api_contsants.dart';
import 'package:padavukal/core/errors/error.dart';
import 'package:padavukal/features/course/data/models/course_model.dart';

import '../../fixtures/fixture.dart';

class MockDio extends Mock implements Dio {}

main() {
  MockDio client = MockDio();
  Logger logger = Logger();
  ApiConfig apiConfig = ApiConfig(client: client, logger: logger);

  test('should return a valid [CourseModel] if using [CourseModel] as [T]',
      () async {
    Errors _err;
    CourseModel _courseModel;

    when(client.get(any)).thenAnswer((realInvocation) async => Response(
          statusCode: 200,
          data: fixture('course.json'),
        ));

    var res = await apiConfig.get<CourseModel>(
      endpoint: ApiEndpoints.courses,
      instance: CourseModel(),
    );

    res.fold((l) => _err = l, (r) => _courseModel = r);

    verify(client.get(ApiEndpoints.courses));
    expect(res, isA<Right>());
    expect(_err, isNull);
    expect(_courseModel, isNotNull);
  });

  test(
      'should return a valid list of [CourseModel] if using [CourseModel] as [T]',
      () async {
    Errors _err;
    List<CourseModel> _courseModels;
    when(client.get(any)).thenAnswer((realInvocation) async => Response(
          statusCode: 200,
          data: fixture('course_list.json'),
        ));

    var res = await apiConfig.getList<CourseModel>(
      endpoint: ApiEndpoints.courses,
      instance: CourseModel(),
    );
    res.fold((l) => _err = l, (r) => _courseModels = r);
    verify(client.get(ApiEndpoints.courses));
    expect(res, isA<Right>());
    expect(_err, isNull);
    expect(_courseModels, isNotNull);
  });
}
