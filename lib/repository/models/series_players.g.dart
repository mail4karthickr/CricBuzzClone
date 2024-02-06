// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_players.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesPlayers _$SeriesPlayersFromJson(Map<String, dynamic> json) =>
    SeriesPlayers(
      player: (json['player'] as List<dynamic>?)
          ?.map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesPlayersToJson(SeriesPlayers instance) =>
    <String, dynamic>{
      'player': instance.player,
    };

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      name: json['name'] as String?,
      isHeader: json['isHeader'] as bool?,
      id: json['id'] as String?,
      role: json['role'] as String?,
      imageId: json['imageId'] as int?,
      battingStyle: json['battingStyle'] as String?,
      bowlingStyle: json['bowlingStyle'] as String?,
      captain: json['captain'] as bool?,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'name': instance.name,
      'isHeader': instance.isHeader,
      'id': instance.id,
      'role': instance.role,
      'imageId': instance.imageId,
      'battingStyle': instance.battingStyle,
      'bowlingStyle': instance.bowlingStyle,
      'captain': instance.captain,
    };
