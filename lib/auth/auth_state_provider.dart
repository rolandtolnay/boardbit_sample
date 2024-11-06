import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'domain/auth_repository.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  AuthRepository get _repository => ref.read(authRepositoryProvider);

  StreamSubscription<AuthState>? _listener;

  @override
  AuthState build() {
    _listener = _repository.onAuthStateChanged.listen((authState) {
      state = authState;
    });
    ref.onDispose(() => _listener?.cancel());

    return AuthState.loading;
  }
}
