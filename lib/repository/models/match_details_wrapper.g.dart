// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_details_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchDetailsWrapper _$MatchDetailsWrapperFromJson(Map<String, dynamic> json) =>
    MatchDetailsWrapper(
      matchDetails: (json['matchDetails'] as List<dynamic>?)
          ?.map((e) => MatchDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      appIndex: json['appIndex'] == null
          ? null
          : AppIndex.fromJson(json['appIndex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchDetailsWrapperToJson(
        MatchDetailsWrapper instance) =>
    <String, dynamic>{
      'matchDetails': instance.matchDetails,
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

MatchDetail _$MatchDetailFromJson(Map<String, dynamic> json) => MatchDetail(
      matchDetailsMap: json['matchDetailsMap'] == null
          ? null
          : MatchDetailsMap.fromJson(
              json['matchDetailsMap'] as Map<String, dynamic>),
      adDetail: json['adDetail'] == null
          ? null
          : AdDetail.fromJson(json['adDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchDetailToJson(MatchDetail instance) =>
    <String, dynamic>{
      'matchDetailsMap': instance.matchDetailsMap,
      'adDetail': instance.adDetail,
    };

AdDetail _$AdDetailFromJson(Map<String, dynamic> json) => AdDetail(
      name: json['name'] as String?,
      layout: json['layout'] as String?,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$AdDetailToJson(AdDetail instance) => <String, dynamic>{
      'name': instance.name,
      'layout': instance.layout,
      'position': instance.position,
    };

MatchDetailsMap _$MatchDetailsMapFromJson(Map<String, dynamic> json) =>
    MatchDetailsMap(
      key: json['key'] as String?,
      match: (json['match'] as List<dynamic>?)
          ?.map((e) => MatchDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      seriesId: json['seriesId'] as int?,
    );

Map<String, dynamic> _$MatchDetailsMapToJson(MatchDetailsMap instance) =>
    <String, dynamic>{
      'key': instance.key,
      'match': instance.match,
      'seriesId': instance.seriesId,
    };
