// To parse this JSON data, do
//
//     final matchDetailsWrapper = matchDetailsWrapperFromJson(jsonString);

import 'package:cricbuzz_clone/repository/models/match_details.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'match_details_wrapper.g.dart';

MatchDetailsWrapper matchDetailsWrapperFromJson(String str) => MatchDetailsWrapper.fromJson(json.decode(str));

String matchDetailsWrapperToJson(MatchDetailsWrapper data) => json.encode(data.toJson());

@JsonSerializable()
class MatchDetailsWrapper {
    @JsonKey(name: "matchDetails")
    List<MatchDetail>? matchDetails;
    @JsonKey(name: "appIndex")
    AppIndex? appIndex;

    MatchDetailsWrapper({
        this.matchDetails,
        this.appIndex,
    });

    MatchDetailsWrapper copyWith({
        List<MatchDetail>? matchDetails,
        AppIndex? appIndex,
    }) => 
        MatchDetailsWrapper(
            matchDetails: matchDetails ?? this.matchDetails,
            appIndex: appIndex ?? this.appIndex,
        );

    factory MatchDetailsWrapper.fromJson(Map<String, dynamic> json) => _$MatchDetailsWrapperFromJson(json);

    Map<String, dynamic> toJson() => _$MatchDetailsWrapperToJson(this);
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

    AppIndex copyWith({
        String? seoTitle,
        String? webUrl,
    }) => 
        AppIndex(
            seoTitle: seoTitle ?? this.seoTitle,
            webUrl: webUrl ?? this.webUrl,
        );

    factory AppIndex.fromJson(Map<String, dynamic> json) => _$AppIndexFromJson(json);

    Map<String, dynamic> toJson() => _$AppIndexToJson(this);
}

@JsonSerializable()
class MatchDetail {
    @JsonKey(name: "matchDetailsMap")
    MatchDetailsMap? matchDetailsMap;
    @JsonKey(name: "adDetail")
    AdDetail? adDetail;

    MatchDetail({
        this.matchDetailsMap,
        this.adDetail,
    });

    MatchDetail copyWith({
        MatchDetailsMap? matchDetailsMap,
        AdDetail? adDetail,
    }) => 
        MatchDetail(
            matchDetailsMap: matchDetailsMap ?? this.matchDetailsMap,
            adDetail: adDetail ?? this.adDetail,
        );

    factory MatchDetail.fromJson(Map<String, dynamic> json) => _$MatchDetailFromJson(json);

    Map<String, dynamic> toJson() => _$MatchDetailToJson(this);
}

@JsonSerializable()
class AdDetail {
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "layout")
    String? layout;
    @JsonKey(name: "position")
    int? position;

    AdDetail({
        this.name,
        this.layout,
        this.position,
    });

    AdDetail copyWith({
        String? name,
        String? layout,
        int? position,
    }) => 
        AdDetail(
            name: name ?? this.name,
            layout: layout ?? this.layout,
            position: position ?? this.position,
        );

    factory AdDetail.fromJson(Map<String, dynamic> json) => _$AdDetailFromJson(json);

    Map<String, dynamic> toJson() => _$AdDetailToJson(this);
}

@JsonSerializable()
class MatchDetailsMap {
    @JsonKey(name: "key")
    String? key;
    @JsonKey(name: "match")
    List<MatchDetails>? match;
    @JsonKey(name: "seriesId")
    int? seriesId;

    MatchDetailsMap({
        this.key,
        this.match,
        this.seriesId,
    });

    MatchDetailsMap copyWith({
        String? key,
        List<MatchDetails>? match,
        int? seriesId,
    }) => 
        MatchDetailsMap(
            key: key ?? this.key,
            match: match ?? this.match,
            seriesId: seriesId ?? this.seriesId,
        );

    factory MatchDetailsMap.fromJson(Map<String, dynamic> json) => _$MatchDetailsMapFromJson(json);

    Map<String, dynamic> toJson() => _$MatchDetailsMapToJson(this);
}