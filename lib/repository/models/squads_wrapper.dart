// To parse this JSON data, do
//
//     final squadsWrapper = squadsWrapperFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'squads_wrapper.g.dart';

SquadsWrapper squadsWrapperFromJson(String str) => SquadsWrapper.fromJson(json.decode(str));

String squadsWrapperToJson(SquadsWrapper data) => json.encode(data.toJson());

@JsonSerializable()
class SquadsWrapper {
    @JsonKey(name: "squads")
    List<Squad>? squads;
    @JsonKey(name: "appIndex")
    AppIndex? appIndex;
    @JsonKey(name: "seriesName")
    String? seriesName;
    @JsonKey(name: "seriesId")
    int? seriesId;

    SquadsWrapper({
        this.squads,
        this.appIndex,
        this.seriesName,
        this.seriesId,
    });

    factory SquadsWrapper.fromJson(Map<String, dynamic> json) => _$SquadsWrapperFromJson(json);

    Map<String, dynamic> toJson() => _$SquadsWrapperToJson(this);
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
class Squad {
    @JsonKey(name: "squadType")
    String? squadType;
    @JsonKey(name: "isHeader")
    bool? isHeader;
    @JsonKey(name: "squadId")
    int? squadId;
    @JsonKey(name: "imageId")
    int? imageId;
    @JsonKey(name: "teamId")
    int? teamId;

    Squad({
        this.squadType,
        this.isHeader,
        this.squadId,
        this.imageId,
        this.teamId,
    });

    factory Squad.fromJson(Map<String, dynamic> json) => _$SquadFromJson(json);

    Map<String, dynamic> toJson() => _$SquadToJson(this);
}
