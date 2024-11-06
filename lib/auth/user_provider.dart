import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../profile/profile_repository.dart';
import 'domain/auth_repository.dart';
import 'domain/user_entity.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class User extends _$User {
  AuthRepository get _authRepository => ref.read(authRepositoryProvider);

  ProfileRepository get _profileRepository =>
      ref.read(profileRepositoryProvider);

  StreamSubscription<UserEntity?>? _listener;

  @override
  UserEntity? build() {
    _listener = _authRepository.onUserChanged.listen((user) {
      if (state == null && user == null) _authRepository.signInAnonymously();

      state = user;
    });
    ref.onDispose(() => _listener?.cancel());

    return null;
  }

  Future<void> updateDisplayName(String name) async {
    await _profileRepository.updateDisplayName(name);
  }
}
