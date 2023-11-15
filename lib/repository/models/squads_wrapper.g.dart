// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'squads_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquadsWrapper _$SquadsWrapperFromJson(Map<String, dynamic> json) =>
    SquadsWrapper(
      squads: (json['squads'] as List<dynamic>?)
          ?.map((e) => Squad.fromJson(e as Map<String, dynamic>))
          .toList(),
      appIndex: json['appIndex'] == null
          ? null
          : AppIndex.fromJson(json['appIndex'] as Map<String, dynamic>),
      seriesName: json['seriesName'] as String?,
      seriesId: json['seriesId'] as int?,
    );

Map<String, dynamic> _$SquadsWrapperToJson(SquadsWrapper instance) =>
    <String, dynamic>{
      'squads': instance.squads,
      'appIndex': instance.appIndex,
      'seriesName': instance.seriesName,
      'seriesId': instance.seriesId,
    };

AppIndex _$AppIndexFromJson(Map<String, dynamic> json) => AppIndex(
      seoTitle: json['seoTitle'] as String?,
      webUrl: json['webURL'] as String?,
    );

Map<String, dynamic> _$AppIndexToJson(AppIndex instance) => <String, dynamic>{
      'seoTitle': instance.seoTitle,
      'webURL': instance.webUrl,
    };

Squad _$SquadFromJson(Map<String, dynamic> json) => Squad(
      squadType: json['squadType'] as String?,
      isHeader: json['isHeader'] as bool?,
      squadId: json['squadId'] as int?,
      imageId: json['imageId'] as int?,
      teamId: json['teamId'] as int?,
    );

Map<String, dynamic> _$SquadToJson(Squad instance) => <String, dynamic>{
      'squadType': instance.squadType,
      'isHeader': instance.isHeader,
      'squadId': instance.squadId,
      'imageId': instance.imageId,
      'teamId': instance.teamId,
    };
