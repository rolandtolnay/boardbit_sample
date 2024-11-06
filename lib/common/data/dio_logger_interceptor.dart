import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import 'init_logging.dart';

bool _kNeverLogBody(Response<dynamic> response) => false;

class DioLoggerInterceptor extends Interceptor {
  DioLoggerInterceptor({
    this.requestHeader = false,
    this.requestBody = false,
    this.responseHeader = false,
    this.shouldLogBody = _kNeverLogBody,
    this.error = true,
    this.maxWidth = 90,
    this.requestLevel,
    this.responseLevel,
    this.errorLevel,
  }) {
    _logger = log;
  }

  final Level? requestLevel;
  final Level? responseLevel;
  final Level? errorLevel;

  final bool requestHeader;
  final bool requestBody;
  late final bool Function(Response<dynamic> response) shouldLogBody;
  final bool responseHeader;
  final bool error;
  final int maxWidth;

  late final Logger _logger;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    _logRequest(options);
    super.onRequest(options, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (error) _logError(err);
    super.onError(err, handler);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    _logResponse(response);
    super.onResponse(response, handler);
  }

  void _logRequest(RequestOptions options) {
    _logger.log(
      requestLevel ?? Level.INFO,
      '>>> Request │ ${options.method} │ ${options.uri}',
    );

    if (requestHeader) {
      _prettyPrintObject(options.queryParameters, header: 'Query Parameters');
      final requestHeaders = <String, dynamic>{}
        ..addAll(options.headers)
        ..['contentType'] = options.contentType?.toString()
        ..['responseType'] = options.responseType.toString()
        ..['followRedirects'] = options.followRedirects
        ..['connectTimeout'] = options.connectTimeout
        ..['receiveTimeout'] = options.receiveTimeout;
      _prettyPrintObject(requestHeaders, header: 'Headers');
      _prettyPrintObject(options.extra, header: 'Extras');
    }

    if (requestBody && options.method != 'GET') {
      final data = options.data;
      if (data != null) {
        if (data is FormData) {
          final formDataMap = <String, dynamic>{}
            ..addEntries(data.fields)
            ..addEntries(data.files);
          _prettyPrintObject(
            formDataMap,
            header: 'Form data | ${data.boundary}',
          );
        } else {
          _prettyPrintObject(data, header: 'Body');
        }
      }
    }
  }

  void _logError(DioException err) {
    if (err.type == DioExceptionType.badResponse) {
      _logger.log(
        errorLevel ?? Level.SEVERE,
        '<<< DioError │ ${err.requestOptions.method} │ ${err.response?.statusCode} ${err.response?.statusMessage} │ ${err.requestOptions.uri}',
      );
      // don't log overly verbose message for unathorized errors
      if (err.response?.statusCode != 401) {
        _logger.log(errorLevel ?? Level.SEVERE, '$err');
      }
      if (err.response != null && err.response?.data != null) {
        _prettyPrintObject(
          err.response?.data,
          header: 'DioError │ ${err.type}',
        );
      }
    } else {
      _logger.log(
        errorLevel ?? Level.SEVERE,
        '<<< DioError (No response) │ ${err.requestOptions.method} │ ${err.requestOptions.uri}',
      );
      _logger.log(errorLevel ?? Level.SEVERE, '╔ ERROR');
      _logger.log(
        errorLevel ?? Level.SEVERE,
        '║ ${err.message?.replaceAll('\n', '\n║ ')}',
      );
      _printLine('╚');
    }
  }

  void _logResponse(Response<dynamic> response) {
    _logger.log(
      responseLevel ?? Level.INFO,
      '<<< Response │ ${response.requestOptions.method} │ ${response.statusCode} ${response.statusMessage} │ ${response.requestOptions.uri}',
    );

    if (responseHeader) {
      _prettyPrintObject(response.headers, header: 'Headers');
    }

    if (shouldLogBody(response)) {
      final data = response.data;
      if (data != null) _prettyPrintObject(data, header: 'Body');
    } else {
      _logger.log(requestLevel ?? Level.FINE, '║ Body not logged');
    }
  }

  void _prettyPrintObject(Object? data, {String? header}) {
    if (data != null) {
      String value;
      try {
        final object = json.decode(data.toString());
        final prettyString = const JsonEncoder.withIndent('  ').convert(object);
        value = prettyString.replaceAll('\n', '\n║ ');
      } catch (e) {
        value = data.toString().replaceAll('\n', '\n║ ');
      }

      _logger.log(requestLevel ?? Level.FINE, '║ $header:\n$value');
    }
  }

  void _printLine(String pre) {
    _logger.log(requestLevel ?? Level.FINE, '$pre${'═' * maxWidth}');
  }
}
