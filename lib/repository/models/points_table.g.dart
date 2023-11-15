// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointsTable _$PointsTableFromJson(Map<String, dynamic> json) => PointsTable(
      pointsTable: (json['pointsTable'] as List<dynamic>?)
          ?.map((e) => PointsTableElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      appIndex: json['appIndex'] == null
          ? null
          : AppIndex.fromJson(json['appIndex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PointsTableToJson(PointsTable instance) =>
    <String, dynamic>{
      'pointsTable': instance.pointsTable,
      'appIndex': instance.appIndex,
    };

AppIndex _$AppIndexFromJson(Map<String, dynamic> json) => AppIndex(
      seoTitle: json['seoTitle'] as String?,
      webUrl: json['webURL'] as String?,
    );

Map<String, dynamic> _$AppIndexToJson(AppIndex instance) => <String, dynamic>{
      'seoTitle': instance.seoTitle,
      'webURL': instance.webUrl,
    };

PointsTableElement _$PointsTableElementFromJson(Map<String, dynamic> json) =>
    PointsTableElement(
      groupName: json['groupName'] as String?,
      pointsTableInfo: (json['pointsTableInfo'] as List<dynamic>?)
          ?.map((e) => PointsTableInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PointsTableElementToJson(PointsTableElement instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'pointsTableInfo': instance.pointsTableInfo,
    };

PointsTableInfo _$PointsTableInfoFromJson(Map<String, dynamic> json) =>
    PointsTableInfo(
      teamId: json['teamId'] as int?,
      teamName: json['teamName'] as String?,
      matchesPlayed: json['matchesPlayed'] as int?,
      matchesWon: json['matchesWon'] as int?,
      matchesDrawn: json['matchesDrawn'] as int?,
      noRes: json['noRes'] as int?,
      points: json['points'] as int?,
      nrr: json['nrr'] as String?,
      teamFullName: json['teamFullName'] as String?,
      teamMatches: (json['teamMatches'] as List<dynamic>?)
          ?.map((e) => TeamMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      form: (json['form'] as List<dynamic>?)?.map((e) => e as String).toList(),
      teamImageId: json['teamImageId'] as int?,
      matchesLost: json['matchesLost'] as int?,
    )..teamQualifyStatus = json['teamQualifyStatus'] as String?;

Map<String, dynamic> _$PointsTableInfoToJson(PointsTableInfo instance) =>
    <String, dynamic>{
      'teamId': instance.teamId,
      'teamName': instance.teamName,
      'matchesPlayed': instance.matchesPlayed,
      'matchesWon': instance.matchesWon,
      'matchesDrawn': instance.matchesDrawn,
      'noRes': instance.noRes,
      'points': instance.points,
      'nrr': instance.nrr,
      'teamFullName': instance.teamFullName,
      'teamMatches': instance.teamMatches,
      'form': instance.form,
      'teamImageId': instance.teamImageId,
      'matchesLost': instance.matchesLost,
      'teamQualifyStatus': instance.teamQualifyStatus,
    };

TeamMatch _$TeamMatchFromJson(Map<String, dynamic> json) => TeamMatch(
      opponent: json['opponent'] as String?,
      startdt: json['startdt'] as String?,
      result: json['result'] as String?,
      opponentSName: json['opponentSName'] as String?,
      matchId: json['matchId'] as int?,
      matchName: json['matchName'] as String?,
      winner: json['winner'] as int?,
      opponentId: json['opponentId'] as int?,
      opponentImageId: json['opponentImageId'] as int?,
    );

Map<String, dynamic> _$TeamMatchToJson(TeamMatch instance) => <String, dynamic>{
      'opponent': instance.opponent,
      'startdt': instance.startdt,
      'result': instance.result,
      'opponentSName': instance.opponentSName,
      'matchId': instance.matchId,
      'matchName': instance.matchName,
      'winner': instance.winner,
      'opponentId': instance.opponentId,
      'opponentImageId': instance.opponentImageId,
    };
