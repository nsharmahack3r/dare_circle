class Player {
  final String id;
  final String name;
  final bool hasPlayed;

  Player({required this.id, required this.name, required this.hasPlayed});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      hasPlayed: json['hasPlayed'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'hasPlayed': hasPlayed};
  }
}
