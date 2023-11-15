// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchTypeList _$MatchTypeListFromJson(Map<String, dynamic> json) =>
    MatchTypeList(
      typeMatches: (json['typeMatches'] as List<dynamic>)
          .map((e) => TypeMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
      filters: Filters.fromJson(json['filters'] as Map<String, dynamic>),
      appIndex: AppIndex.fromJson(json['appIndex'] as Map<String, dynamic>),
      responseLastUpdated: json['responseLastUpdated'] as String,
    );

Map<String, dynamic> _$MatchTypeListToJson(MatchTypeList instance) =>
    <String, dynamic>{
      'typeMatches': instance.typeMatches,
      'filters': instance.filters,
      'appIndex': instance.appIndex,
      'responseLastUpdated': instance.responseLastUpdated,
    };

AppIndex _$AppIndexFromJson(Map<String, dynamic> json) => AppIndex(
      seoTitle: json['seoTitle'] as String,
      webUrl: json['webURL'] as String,
    );

Map<String, dynamic> _$AppIndexToJson(AppIndex instance) => <String, dynamic>{
      'seoTitle': instance.seoTitle,
      'webURL': instance.webUrl,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      matchType:
          (json['matchType'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'matchType': instance.matchType,
    };

TypeMatch _$TypeMatchFromJson(Map<String, dynamic> json) => TypeMatch(
      matchType: json['matchType'] as String,
      seriesMatches: (json['seriesMatches'] as List<dynamic>)
          .map((e) => SeriesMatch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TypeMatchToJson(TypeMatch instance) => <String, dynamic>{
      'matchType': instance.matchType,
      'seriesMatches': instance.seriesMatches,
    };

SeriesMatch _$SeriesMatchFromJson(Map<String, dynamic> json) => SeriesMatch(
      seriesAdWrapper: json['seriesAdWrapper'] == null
          ? null
          : SeriesAdWrapper.fromJson(
              json['seriesAdWrapper'] as Map<String, dynamic>),
      adDetail: json['adDetail'] == null
          ? null
          : AdDetail.fromJson(json['adDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SeriesMatchToJson(SeriesMatch instance) =>
    <String, dynamic>{
      'seriesAdWrapper': instance.seriesAdWrapper,
      'adDetail': instance.adDetail,
    };

AdDetail _$AdDetailFromJson(Map<String, dynamic> json) => AdDetail(
      name: json['name'] as String,
      layout: json['layout'] as String,
      position: json['position'] as int,
    );

Map<String, dynamic> _$AdDetailToJson(AdDetail instance) => <String, dynamic>{
      'name': instance.name,
      'layout': instance.layout,
      'position': instance.position,
    };

SeriesAdWrapper _$SeriesAdWrapperFromJson(Map<String, dynamic> json) =>
    SeriesAdWrapper(
      seriesId: json['seriesId'] as int,
      seriesName: json['seriesName'] as String,
      matches: (json['matches'] as List<dynamic>)
          .map((e) => MatchDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesAdWrapperToJson(SeriesAdWrapper instance) =>
    <String, dynamic>{
      'seriesId': instance.seriesId,
      'seriesName': instance.seriesName,
      'matches': instance.matches,
    };
