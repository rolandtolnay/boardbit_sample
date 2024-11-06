extension CompactMap<T> on Iterable<T> {
  Iterable<E> compactMap<E>(E? Function(T element) f) {
    Iterable<E> imp(E? Function(T element) f) sync* {
      for (final value in this) {
        final mapped = f(value);
        if (mapped != null) {
          yield mapped;
        }
      }
    }

    return imp(f);
  }

  Iterable<R> compactMapIndexed<R>(
    R? Function(int index, T element) convert,
  ) sync* {
    var index = 0;
    for (final element in this) {
      final result = convert(index, element);
      if (result != null) {
        yield result;
      }
      index++;
    }
  }
}
