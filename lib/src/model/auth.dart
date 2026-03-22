import 'package:dare_circle/src/model/user.dart';

class Auth {
  final String token;
  final User user;

  Auth({required this.token, required this.user});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(token: json['token'], user: User.fromMap(json['user']));
  }

  Map<String, dynamic> toJson() {
    return {'token': token, 'user': user.toMap()};
  }
}
