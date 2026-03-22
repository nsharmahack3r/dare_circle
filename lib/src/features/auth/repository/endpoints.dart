import 'package:dare_circle/src/resources/endpoints.dart';

class AuthEndpoints {
  const AuthEndpoints._();

  static const _baseUrl = Endpoints.baseUrl;

  static const String login = "$_baseUrl/auth/login";
  static const String signup = "$_baseUrl/auth/signup";
}
