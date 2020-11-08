import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:padavukal/core/config/json_config.dart';
import 'package:padavukal/core/errors/error.dart';

class ApiConfig {
  final Client client;
  final FirebaseAuth auth;
  final Logger logger;

  ApiConfig({
    @required this.client,
    @required this.auth,
    @required this.logger,
  });

  Future<String> get _token async => auth.currentUser.getIdToken();

  Future<Either<Errors, T>> get<T extends JsonModel<T>>(
      {T instance, String endpoint}) async {
    Response response;

    try {
      String token = await _token;
      response = await client.get(endpoint, headers: {
        HttpHeaders.authorizationHeader: token,
      });

      logger.i(response);

      Map data = jsonDecode(response.body);
      var res = _convertedData<T>(data, instance);
      return Right(res);
    } catch (e) {
      var err = _convertToError(response, e.toString());
      return Left(err);
    }
  }

  Future<Either<Errors, List<T>>> getList<T extends JsonModel<T>>(
      {T instance, String endpoint}) async {
    Response response;
    try {
      String token = await _token;
      log(token);
      response = await client.get(
        endpoint,
        headers: {
          HttpHeaders.authorizationHeader: token,
        },
      );
      logger.i(response);
      List data = jsonDecode(response.body);
      return Right(data.map<T>((e) => _convertedData(e, instance)).toList());
    } catch (e) {
      logger.e(e);
      logger.e(response.statusCode);
      var err = _convertToError(response, e.toString());
      return Left(err);
    }
  }

  Future<Either<Errors, T>> post<T extends JsonModel<T>>({
    String endpoint,
    Map<String, dynamic> data,
    T instance,
  }) async {
    Response response;
    logger.i(jsonEncode(data));
    try {
      String token = await _token;
      response = await client.post(
        endpoint,
        body: jsonEncode(data),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
          HttpHeaders.authorizationHeader: token,
        },
      );
      if (response.statusCode > 299)
        throw Exception(["Error occured with status ${response.statusCode}"]);
      var res = _convertedData<T>(jsonDecode(response.body), instance);
      return Right(res);
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
    try {
      return Errors.fromJson(jsonDecode(response.body));
    } catch (e) {
      logger.e(e.toString());
      return Errors.newUnknownApiError(
        response: response,
        stackTrace: stacktrace,
      );
    }
  }
}
