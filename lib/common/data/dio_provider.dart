import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'dio_logger_interceptor.dart';
import 'xml_parser_interceptor.dart';

final dioProvider = Provider<Dio>((ref) {
  final Dio dio;

  final options = BaseOptions(contentType: 'application/json');
  dio = Dio(options);

  dio.interceptors.addAll(
    <Interceptor>[
      DioLoggerInterceptor(),
      XmlParserInterceptor(),
    ],
  );

  return dio;
});
