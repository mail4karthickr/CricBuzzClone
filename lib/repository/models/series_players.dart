// To parse this JSON data, do
//
//     final seriesPlayers = seriesPlayersFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'series_players.g.dart';

SeriesPlayers seriesPlayersFromJson(String str) => SeriesPlayers.fromJson(json.decode(str));

String seriesPlayersToJson(SeriesPlayers data) => json.encode(data.toJson());

@JsonSerializable()
class SeriesPlayers {
    @JsonKey(name: "player")
    final List<Player>? player;

    const SeriesPlayers({
        this.player,
    });

    static const empty = SeriesPlayers(player:[]);

    factory SeriesPlayers.fromJson(Map<String, dynamic> json) => _$SeriesPlayersFromJson(json);

    Map<String, dynamic> toJson() => _$SeriesPlayersToJson(this);
}

@JsonSerializable()
class Player {
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "isHeader")
    bool? isHeader;
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "role")
    String? role;
    @JsonKey(name: "imageId")
    int? imageId;
    @JsonKey(name: "battingStyle")
    String? battingStyle;
    @JsonKey(name: "bowlingStyle")
    String? bowlingStyle;
    @JsonKey(name: "captain")
    bool? captain;

    Player({
        this.name,
        this.isHeader,
        this.id,
        this.role,
        this.imageId,
        this.battingStyle,
        this.bowlingStyle,
        this.captain,
    });

    static final empty = Player(
      name: '',
      isHeader: false,
      id: '',
      role: '',
      imageId: 0,
      battingStyle: '',
      bowlingStyle: '',
      captain: false
    );

    factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

    Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
