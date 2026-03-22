import 'package:dare_circle/src/model/player.dart';

class Game {
  final String code;
  final String hostId;
  final List<Player> players;
  final String currentPlayerIndex;
  final String status;

  Game({
    required this.code,
    required this.hostId,
    required this.players,
    required this.currentPlayerIndex,
    required this.status,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      code: json['code'],
      hostId: json['hostId'],
      players: json['players']
          .map((player) => Player.fromJson(player))
          .toList(),
      currentPlayerIndex: json['currentPlayerIndex'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'hostId': hostId,
      'players': players.map((player) => player.toJson()).toList(),
      'currentPlayerIndex': currentPlayerIndex,
      'status': status,
    };
  }
}
