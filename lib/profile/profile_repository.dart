import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/domain/auth_repository.dart';
import '../auth/domain/user_entity.dart';
import '../common/data/api_exception.dart';
import '../common/data/init_logging.dart';

part 'profile_repository.g.dart';

abstract class ProfileRepository {
  Future<UserEntity?> updateDisplayName(String name);
}

class FirProfileRepository implements ProfileRepository {
  final _firAuth = FirebaseAuth.instance;
  final AuthRepository _authRepository;

  FirProfileRepository(this._authRepository);

  @override
  Future<UserEntity?> updateDisplayName(String name) async {
    assert(
      _firAuth.currentUser != null,
      'Current user cannot be null when updating name',
    );
    try {
      await _firAuth.currentUser?.updateDisplayName(name);

      final user = await _authRepository.currentUser;
      if (user != null) await usersRef.doc(user.id).update(displayName: name);

      return user;
    } catch (e, st) {
      log.error('Failed to update display name:', e, st);
      throw ApiException('$e');
    }
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) =>
    FirProfileRepository(ref.watch(authRepositoryProvider));
