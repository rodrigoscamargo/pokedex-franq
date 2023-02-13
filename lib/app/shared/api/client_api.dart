import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex/app/shared/errors/failure.dart';
import 'package:result_dart/result_dart.dart';

abstract class Client {
  Future<Result<Response, Exception>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
  Future<Result<Response, Exception>> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Result<Response, Exception>> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });
}

class ClientPokedex extends Client {
  final _client = Dio();

  @override
  Future<Result<Response, Exception>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    var hasConnection = await _checkInternetConnection();

    if (hasConnection) {
      var result = await _client.get(
        path,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
      );

      return Success(result);
    }

    return Failure(ConnectionError(message: 'Sem conexão à Internet.'));
  }

  @override
  Future<Result<Response, Exception>> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    var hasConnection = await _checkInternetConnection();

    if (hasConnection) {
      var result = await _client.post(
        path,
        data: data,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Success(result);
    }

    return Failure(ConnectionError(message: 'Sem conexão à Internet.'));
  }

  @override
  Future<Result<Response, Exception>> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    var hasConnection = await _checkInternetConnection();

    if (hasConnection) {
      var result = await _client.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return Success(result);
    }

    return Failure(ConnectionError(message: 'Sem conexão à Internet.'));
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }

    return false;
  }
}
