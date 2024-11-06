import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AsyncValueConvenience<T> on AsyncValue<T?> {
  R whenDataNotNull<R>(
    R Function(T data) processData, {
    required R Function(Object? error) orElse,
  }) {
    return maybeWhen(
      skipLoadingOnRefresh: false,
      data: (data) => data != null ? processData(data) : orElse.call(null),
      error: (err, _) => orElse.call(err),
      orElse: () => orElse.call(null),
    );
  }
}
