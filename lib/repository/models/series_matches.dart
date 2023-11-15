import 'dart:convert';

import 'package:cricbuzz_clone/repository/models/matches_list.dart';

SeriesMatches seriesMatchesFromJson(String str) => SeriesMatches.fromJson(json.decode(str));

String seriesMatchesToJson(SeriesMatches data) => json.encode(data.toJson());

class SeriesMatches {
    List<MatchDetail>? matchDetails;
    AppIndex? appIndex;

    SeriesMatches({
        this.matchDetails,
        this.appIndex,
    });

    factory SeriesMatches.fromJson(Map<String, dynamic> json) => SeriesMatches(
        matchDetails: json["matchDetails"] == null ? [] : List<MatchDetail>.from(json["matchDetails"]!.map((x) => MatchDetail.fromJson(x))),
        appIndex: json["appIndex"] == null ? null : AppIndex.fromJson(json["appIndex"]),
    );

    Map<String, dynamic> toJson() => {
        "matchDetails": matchDetails == null ? [] : List<dynamic>.from(matchDetails!.map((x) => x.toJson())),
        "appIndex": appIndex?.toJson(),
    };
}

class AppIndex {
    String? seoTitle;
    String? webUrl;

    AppIndex({
        this.seoTitle,
        this.webUrl,
    });

    factory AppIndex.fromJson(Map<String, dynamic> json) => AppIndex(
        seoTitle: json["seoTitle"],
        webUrl: json["webURL"],
    );

    Map<String, dynamic> toJson() => {
        "seoTitle": seoTitle,
        "webURL": webUrl,
    };
}

class MatchDetail {
    MatchDetailsMap? matchDetailsMap;
    AdDetail? adDetail;

    MatchDetail({
        this.matchDetailsMap,
        this.adDetail,
    });

    factory MatchDetail.fromJson(Map<String, dynamic> json) => MatchDetail(
        matchDetailsMap: json["matchDetailsMap"] == null ? null : MatchDetailsMap.fromJson(json["matchDetailsMap"]),
        adDetail: json["adDetail"] == null ? null : AdDetail.fromJson(json["adDetail"]),
    );
}

class AdDetail {
    String? name;
    String? layout;
    int? position;

    AdDetail({
        this.name,
        this.layout,
        this.position,
    });

    factory AdDetail.fromJson(Map<String, dynamic> json) => AdDetail(
        name: json["name"],
        layout: json["layout"],
        position: json["position"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "layout": layout,
        "position": position,
    };
}

class MatchDetailsMap {
    String? key;
    List<Match>? match;
    int? seriesId;

    MatchDetailsMap({
        this.key,
        this.match,
        this.seriesId,
    });

    factory MatchDetailsMap.fromJson(Map<String, dynamic> json) => MatchDetailsMap(
        key: json["key"],
        match: json["match"] == null ? [] : List<Match>.from(json["match"]!.map((x) => Match.fromJson(x))),
        seriesId: json["seriesId"],
    );
}

class Match {
    MatchInfo? matchInfo;

    Match({
        this.matchInfo,
    });

    factory Match.fromJson(Map<String, dynamic> json) => Match(
        matchInfo: json["matchInfo"] == null ? null : MatchInfo.fromJson(json["matchInfo"]),
    );
}

// class Team {
//     int? teamId;
//     String? teamName;
//     String? teamSName;
//     int? imageId;

//     Team({
//         this.teamId,
//         this.teamName,
//         this.teamSName,
//         this.imageId,
//     });

//     factory Team.fromJson(Map<String, dynamic> json) => Team(
//         teamId: json["teamId"],
//         teamName: json["teamName"],
//         teamSName: json["teamSName"],
//         imageId: json["imageId"],
//     );

//     Map<String, dynamic> toJson() => {
//         "teamId": teamId,
//         "teamName": teamName,
//         "teamSName": teamSName,
//         "imageId": imageId,
//     };
// }

// class VenueInfo {
//     int? id;
//     String? ground;
//     String? city;
//     String? timezone;

//     VenueInfo({
//         this.id,
//         this.ground,
//         this.city,
//         this.timezone,
//     });

//     factory VenueInfo.fromJson(Map<String, dynamic> json) => VenueInfo(
//         id: json["id"],
//         ground: json["ground"],
//         city: json["city"],
//         timezone: json["timezone"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "ground": ground,
//         "city": city,
//         "timezone": timezone,
//     };
// }
