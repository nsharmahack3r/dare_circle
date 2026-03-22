import 'package:dare_circle/src/common/provider/common_providers.dart';
import 'package:dare_circle/src/common/repository/shared_preferences.dart';
import 'package:dare_circle/src/features/auth/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dare_circle/src/model/auth.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  bool build() {
    return false;
  }

  Future<void> login({required String email, required String password}) async {
    state = true;
    final result = await ref
        .read(authRepositoryProvider)
        .login(email: email, password: password);

    result.fold(
      (failure) {
        state = false;
      },
      (auth) {
        _handleAuth(auth).then((_) {
          state = false;
        });
      },
    );
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    state = true;
    final result = await ref
        .read(authRepositoryProvider)
        .signup(name: name, email: email, password: password);

    result.fold(
      (failure) {
        state = false;
      },
      (auth) {
        _handleAuth(auth).then((_) {
          state = false;
        });
      },
    );
  }

  void logout() {
    ref.read(sharedPreferencesRepositoryProvider).removeAuth();
    ref.read(authTokenProvider.notifier).setToken(null);
    ref.read(currentUserProvider.notifier).setUser(null);
  }

  Future<void> _handleAuth(Auth auth) async {
    ref.read(authTokenProvider.notifier).setToken(auth.token);
    ref.read(currentUserProvider.notifier).setUser(auth.user);
    return ref.read(sharedPreferencesRepositoryProvider).saveAuth(auth);
  }
}
