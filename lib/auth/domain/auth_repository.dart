import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

import '../../common/data/api_exception.dart';
import '../../common/data/init_logging.dart';
import 'user_entity.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Stream<AuthState> get onAuthStateChanged;

  Future<UserEntity?> get currentUser;

  Stream<UserEntity?> get onUserChanged;

  Future<UserEntity?> signInAnonymously();
}

enum AuthState { anonymous, authenticated, signedOut, loading }

const kStoredEmailKey = 'authEmail';

class FirAuthRepository implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  final _userController = StreamController<UserEntity?>.broadcast();
  StreamSubscription<UserEntityDocumentSnapshot>? _userListener;

  final _authStateController = BehaviorSubject<AuthState>();

  FirAuthRepository() {
    _auth.authStateChanges().listen((firUser) async {
      if (firUser == null) {
        _authStateController.add(AuthState.signedOut);
        _userController.add(null);
        await _userListener?.cancel();
        log.info('User was signed out.');
        return;
      }

      _authStateController.add(
        firUser.isAnonymous ? AuthState.anonymous : AuthState.authenticated,
      );

      final user = await currentUser;
      if (user != null) {
        await _listenOnCollectionChanges(user.id);
      } else {
        log.warning('No user found in database for ${firUser.uid}');
        await _makeDatabaseUser(firUser);
      }
    });
  }

  @override
  Stream<AuthState> get onAuthStateChanged => _authStateController.stream;

  @override
  Future<UserEntity?> get currentUser async {
    final firUser = _auth.currentUser;
    if (firUser == null) return Future.value();
    final snap = await usersRef.doc(firUser.uid).get();
    return snap.data;
  }

  @override
  Stream<UserEntity?> get onUserChanged => _userController.stream;

  @override
  Future<UserEntity?> signInAnonymously() async {
    log.info('Signing user in anonymously...');

    try {
      await _auth.signInAnonymously();

      final firUser = _auth.currentUser;
      if (firUser == null) throw ApiException('Unexpected null user.');

      var user = await currentUser;
      return user ??= await _makeDatabaseUser(firUser);
    } catch (e, st) {
      log.error('Failed to sign in anonymously:', e, st);
      throw ApiException('$e');
    }
  }

  Future<UserEntity> _makeDatabaseUser(
    User firUser, {
    String? displayName,
  }) async {
    final id = firUser.uid;
    final user = UserEntity(
      id: id,
      email: firUser.email,
      displayName: displayName ?? firUser.displayName,
      photoUrl: firUser.photoURL,
    );

    await usersRef.doc(id).set(user);
    await _listenOnCollectionChanges(id);
    log.info('Successfully made new database user for $id');

    return user;
  }

  Future<void> _listenOnCollectionChanges(String userId) async {
    await _userListener?.cancel();
    _userListener = usersRef.doc(userId).snapshots().listen((snap) {
      _userController.add(snap.data);
    });
    log.info('Subscribed to user collection changes.\nUser id: $userId');
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => FirAuthRepository();
