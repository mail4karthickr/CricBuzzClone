// To parse this JSON data, do
//
//     final pointsTable = pointsTableFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'points_table.g.dart';

PointsTable pointsTableFromJson(String str) => PointsTable.fromJson(json.decode(str));

String pointsTableToJson(PointsTable data) => json.encode(data.toJson());

@JsonSerializable()
class PointsTable {
    @JsonKey(name: "pointsTable")
    List<PointsTableElement>? pointsTable;
    @JsonKey(name: "appIndex")
    AppIndex? appIndex;

    PointsTable({
        this.pointsTable,
        this.appIndex,
    });

    factory PointsTable.fromJson(Map<String, dynamic> json) => _$PointsTableFromJson(json);

    Map<String, dynamic> toJson() => _$PointsTableToJson(this);
}

@JsonSerializable()
class AppIndex {
    @JsonKey(name: "seoTitle")
    String? seoTitle;
    @JsonKey(name: "webURL")
    String? webUrl;

    AppIndex({
        this.seoTitle,
        this.webUrl,
    });

    factory AppIndex.fromJson(Map<String, dynamic> json) => _$AppIndexFromJson(json);

    Map<String, dynamic> toJson() => _$AppIndexToJson(this);
}

@JsonSerializable()
class PointsTableElement {
    @JsonKey(name: "groupName")
    String? groupName;
    @JsonKey(name: "pointsTableInfo")
    List<PointsTableInfo>? pointsTableInfo;

    PointsTableElement({
        this.groupName,
        this.pointsTableInfo,
    });

    factory PointsTableElement.fromJson(Map<String, dynamic> json) => _$PointsTableElementFromJson(json);

    Map<String, dynamic> toJson() => _$PointsTableElementToJson(this);
}

@JsonSerializable()
class PointsTableInfo {
    @JsonKey(name: "teamId")
    int? teamId;
    @JsonKey(name: "teamName")
    String? teamName;
    @JsonKey(name: "matchesPlayed")
    int? matchesPlayed;
    @JsonKey(name: "matchesWon")
    int? matchesWon;
    @JsonKey(name: "matchesDrawn")
    int? matchesDrawn;
    @JsonKey(name: "noRes")
    int? noRes;
    @JsonKey(name: "points")
    int? points;
    @JsonKey(name: "nrr")
    String? nrr;
    @JsonKey(name: "teamFullName")
    String? teamFullName;
    @JsonKey(name: "teamMatches")
    List<TeamMatch>? teamMatches;
    @JsonKey(name: "form")
    List<String>? form;
    @JsonKey(name: "teamImageId")
    int? teamImageId;
    @JsonKey(name: "matchesLost")
    int? matchesLost;
    @JsonKey(name: "teamQualifyStatus")
    String? teamQualifyStatus;

    PointsTableInfo({
        this.teamId,
        this.teamName,
        this.matchesPlayed,
        this.matchesWon,
        this.matchesDrawn,
        this.noRes,
        this.points,
        this.nrr,
        this.teamFullName,
        this.teamMatches,
        this.form,
        this.teamImageId,
        this.matchesLost,
    });

    factory PointsTableInfo.fromJson(Map<String, dynamic> json) => _$PointsTableInfoFromJson(json);

    Map<String, dynamic> toJson() => _$PointsTableInfoToJson(this);
}

@JsonSerializable()
class TeamMatch {
    @JsonKey(name: "opponent")
    String? opponent;
    @JsonKey(name: "startdt")
    String? startdt;
    @JsonKey(name: "result")
    String? result;
    @JsonKey(name: "opponentSName")
    String? opponentSName;
    @JsonKey(name: "matchId")
    int? matchId;
    @JsonKey(name: "matchName")
    String? matchName;
    @JsonKey(name: "winner")
    int? winner;
    @JsonKey(name: "opponentId")
    int? opponentId;
    @JsonKey(name: "opponentImageId")
    int? opponentImageId;

    TeamMatch({
        this.opponent,
        this.startdt,
        this.result,
        this.opponentSName,
        this.matchId,
        this.matchName,
        this.winner,
        this.opponentId,
        this.opponentImageId,
    });

    factory TeamMatch.fromJson(Map<String, dynamic> json) => _$TeamMatchFromJson(json);

    Map<String, dynamic> toJson() => _$TeamMatchToJson(this);
}