// To parse this JSON data, do
//
//     final playerInfo = playerInfoFromJson(jsonString);

import 'dart:convert';

PlayerInfo playerInfoFromJson(String str) => PlayerInfo.fromJson(json.decode(str));

String playerInfoToJson(PlayerInfo data) => json.encode(data.toJson());

class PlayerInfo {
    String? id;
    String? bat;
    String? bowl;
    String? name;
    String? nickName;
    String? role;
    String? birthPlace;
    String? intlTeam;
    String? teams;
    String? doB;
    String? image;
    String? bio;
    Rankings? rankings;
    AppIndex? appIndex;
    String? doBFormat;
    String? faceImageId;

    PlayerInfo({
        this.id,
        this.bat,
        this.bowl,
        this.name,
        this.nickName,
        this.role,
        this.birthPlace,
        this.intlTeam,
        this.teams,
        this.doB,
        this.image,
        this.bio,
        this.rankings,
        this.appIndex,
        this.doBFormat,
        this.faceImageId,
    });

    factory PlayerInfo.fromJson(Map<String, dynamic> json) => PlayerInfo(
        id: json["id"],
        bat: json["bat"],
        bowl: json["bowl"],
        name: json["name"],
        nickName: json["nickName"],
        role: json["role"],
        birthPlace: json["birthPlace"],
        intlTeam: json["intlTeam"],
        teams: json["teams"],
        doB: json["DoB"],
        image: json["image"],
        bio: json["bio"],
        rankings: json["rankings"] == null ? null : Rankings.fromJson(json["rankings"]),
        appIndex: json["appIndex"] == null ? null : AppIndex.fromJson(json["appIndex"]),
        doBFormat: json["DoBFormat"],
        faceImageId: json["faceImageId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bat": bat,
        "bowl": bowl,
        "name": name,
        "nickName": nickName,
        "role": role,
        "birthPlace": birthPlace,
        "intlTeam": intlTeam,
        "teams": teams,
        "DoB": doB,
        "image": image,
        "bio": bio,
        "rankings": rankings?.toJson(),
        "appIndex": appIndex?.toJson(),
        "DoBFormat": doBFormat,
        "faceImageId": faceImageId,
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

class Rankings {
    Bat? bat;
    Bat? bowl;
    All? all;

    Rankings({
        this.bat,
        this.bowl,
        this.all,
    });

    factory Rankings.fromJson(Map<String, dynamic> json) => Rankings(
        bat: json["bat"] == null ? null : Bat.fromJson(json["bat"]),
        bowl: json["bowl"] == null ? null : Bat.fromJson(json["bowl"]),
        all: json["all"] == null ? null : All.fromJson(json["all"]),
    );

    Map<String, dynamic> toJson() => {
        "bat": bat?.toJson(),
        "bowl": bowl?.toJson(),
        "all": all?.toJson(),
    };
}

class All {
    String? testRank;
    String? odiRank;
    String? t20Rank;
    String? testBestRank;
    String? odiBestRank;
    String? t20BestRank;

    All({
        this.testRank,
        this.odiRank,
        this.t20Rank,
        this.testBestRank,
        this.odiBestRank,
        this.t20BestRank,
    });

    factory All.fromJson(Map<String, dynamic> json) => All(
        testRank: json["testRank"],
        odiRank: json['odiRank'],
        t20Rank: json['t20Rank'],
        testBestRank: json["testBestRank"],
        odiBestRank: json["odiBestRank"],
        t20BestRank: json["t20BestRank"],
    );

    Map<String, dynamic> toJson() => {
        "testBestRank": testBestRank,
        "odiBestRank": odiBestRank,
        "t20BestRank": t20BestRank,
    };
}

class Bat {
    String? testRank;
    String? odiRank;
    String? t20Rank;
    String? testBestRank;
    String? odiBestRank;
    String? t20BestRank;

    Bat({
        this.testRank,
        this.odiRank,
        this.t20Rank,
        this.testBestRank,
        this.odiBestRank,
        this.t20BestRank,
    });

    factory Bat.fromJson(Map<String, dynamic> json) => Bat(
        testRank: json["testRank"],
        odiRank: json['odiRank'],
        t20Rank: json['t20Rank'],
        testBestRank: json["testBestRank"],
        odiBestRank: json["odiBestRank"],
        t20BestRank: json["t20BestRank"],
    );

    Map<String, dynamic> toJson() => {
        "testBestRank": testBestRank,
        "odiBestRank": odiBestRank,
        "t20BestRank": t20BestRank,
    };
}
