import 'dart:convert';

import 'package:dare_circle/src/model/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesRepositoryProvider =
    Provider<SharedPreferencesRepository>(
      (ref) => SharedPreferencesRepository(),
    );

class SharedPreferencesRepository {
  final String authKey = 'AUTH_STATUS_KEY';

  Future<void> saveAuth(Auth auth) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(authKey, jsonEncode(auth.toJson()));
  }

  Future<Auth?> getAuth() async {
    final prefs = await SharedPreferences.getInstance();
    final auth = prefs.getString(authKey);
    if (auth == null) return null;
    try {
      return Auth.fromJson(jsonDecode(auth));
    } catch (e) {
      return null;
    }
  }

  Future<void> removeAuth() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(authKey);
  }
}
