import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:padavukal/core/config/json_config.dart';
import 'package:padavukal/core/errors/error.dart';

class ApiConfig {
  final Dio client;
  final Logger logger;

  ApiConfig({
    @required this.client,
    @required this.logger,
  });

  Future<Either<Errors, T>> get<T extends JsonModel<T>>({
    T instance,
    String endpoint,
  }) async {
    Response response = await client.get(endpoint);
    Map data = jsonDecode(response.data);

    try {
      var res = _convertedData<T>(data, instance);
      return Right(res);
    } catch (e) {
      var err = _convertToError(response, e.toString());
      return Left(err);
    }
  }

  Future<Either<Errors, List<T>>> getList<T extends JsonModel<T>>({
    T instance,
    String endpoint,
  }) async {
    Response response = await client.get(endpoint);

    try {
      List data = jsonDecode(response.data);
      return Right(data.map<T>((e) => _convertedData(e, instance)).toList());
    } catch (e) {
      var err = _convertToError(response, e.toString());
      return Left(err);
    }
  }

  T _convertedData<T extends JsonModel<T>>(
      Map<String, dynamic> json, T instance) {
    return instance.fromJson(json);
  }

  Errors _convertToError(Response response, String stacktrace) {
    Errors err;

    try {
      err = Errors.fromJson(response.data);
    } catch (e) {
      err = Errors.newUnknownApiError(
        response: response,
        stackTrace: stacktrace,
      );
    }
    return err;
  }
}
