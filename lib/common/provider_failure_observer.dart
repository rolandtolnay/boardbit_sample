import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/api_exception.dart';
import 'data/init_logging.dart';

class ProviderFailureObserver extends ProviderObserver {
  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    final message = 'Provider [${provider.name}] threw ${error.debugMessage}';
    log.error(message, error, stackTrace);
  }
}

extension on Object {
  String get debugMessage {
    if (this is DioException) {
      final response = (this as DioException).response;
      if (response?.statusCode == 401) return 'DioException [401 Unauthorized]';
      return 'DioException [${response?.statusCode} ${response?.statusMessage}]';
    }
    if (this is ApiException) {
      return 'ApiException [${(this as ApiException).message}]';
    }
    return toString();
  }
}
