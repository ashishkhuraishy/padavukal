import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:padavukal/core/config/json_config.dart';
import 'package:padavukal/core/errors/error.dart';

class ApiConfig {
  final Dio client;
  final User user;
  final Logger logger;

  ApiConfig({
    @required this.client,
    @required this.user,
    @required this.logger,
  });

  Future<Either<Errors, T>> get<T extends JsonModel<T>>(
      {T instance, String endpoint}) async {
    String token = await user.getIdToken();
    Response response = await client.get(
      endpoint,
      options: Options(headers: {
        HttpHeaders.authorizationHeader: token,
      }),
    );

    logger.i(token);
    logger.i(response);

    try {
      Map data = jsonDecode(response.data);
      var res = _convertedData<T>(data, instance);
      return Right(res);
    } catch (e) {
      var err = _convertToError(response, e.toString());
      return Left(err);
    }
  }

  Future<Either<Errors, List<T>>> getList<T extends JsonModel<T>>(
      {T instance, String endpoint}) async {
    String token = await user.getIdToken();
    Response response = await client.get(
      endpoint,
      options: Options(headers: {
        HttpHeaders.authorizationHeader: token,
      }),
    );

    try {
      List data = jsonDecode(response.data);
      return Right(data.map<T>((e) => _convertedData(e, instance)).toList());
    } catch (e) {
      logger.e(e);
      logger.e(response);
      var err = _convertToError(response, e.toString());
      return Left(err);
    }
  }

  T _convertedData<T extends JsonModel<T>>(
      Map<String, dynamic> json, T instance) {
    return instance.fromJson(json);
  }

  Errors _convertToError(Response response, String stacktrace) {
    logger.e(stacktrace);
    try {
      return Errors.fromJson(response.data);
    } catch (e) {
      return Errors.newUnknownApiError(
        response: response,
        stackTrace: stacktrace,
      );
    }
  }
}
