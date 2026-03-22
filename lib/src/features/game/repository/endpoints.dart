import 'package:dare_circle/src/resources/endpoints.dart';

class GameEndpoints {
  const GameEndpoints._();

  static const _baseUrl = Endpoints.baseUrl;

  static const createGameRoom = "$_baseUrl/rooms";

  static String joinGameRoom(String code) => "$_baseUrl/rooms/$code/join";
}
