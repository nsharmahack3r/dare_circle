import 'package:dare_circle/src/model/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart'; // import your user model

part 'common_providers.g.dart';

@Riverpod(keepAlive: true) // Keep alive so token persists
class AuthToken extends _$AuthToken {
  @override
  String? build() {
    return null; // Initial state
  }

  // You need a method to change the state now
  void setToken(String? token) {
    state = token;
  }
}

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  @override
  User? build() {
    return null; // Initial state
  }

  void setUser(User? user) {
    state = user;
  }
}
