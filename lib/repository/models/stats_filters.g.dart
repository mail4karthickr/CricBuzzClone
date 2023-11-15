// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatsFilters _$StatsFiltersFromJson(Map<String, dynamic> json) => StatsFilters(
      types: (json['types'] as List<dynamic>?)
          ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
          .toList(),
      appIndex: json['appIndex'] == null
          ? null
          : AppIndex.fromJson(json['appIndex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsFiltersToJson(StatsFilters instance) =>
    <String, dynamic>{
      'types': instance.types,
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

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      header: json['header'] as String?,
      value: json['value'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'header': instance.header,
      'value': instance.value,
      'category': instance.category,
    };
