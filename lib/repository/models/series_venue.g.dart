// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_venue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesVenue _$SeriesVenueFromJson(Map<String, dynamic> json) => SeriesVenue(
      seriesVenue: (json['seriesVenue'] as List<dynamic>?)
          ?.map((e) => SeriesVenueElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      appIndex: json['appIndex'] == null
          ? null
          : AppIndex.fromJson(json['appIndex'] as Map<String, dynamic>),
      seriesId: json['seriesId'] as int?,
      seriesName: json['seriesName'] as String?,
    );

Map<String, dynamic> _$SeriesVenueToJson(SeriesVenue instance) =>
    <String, dynamic>{
      'seriesVenue': instance.seriesVenue,
      'appIndex': instance.appIndex,
      'seriesId': instance.seriesId,
      'seriesName': instance.seriesName,
    };

AppIndex _$AppIndexFromJson(Map<String, dynamic> json) => AppIndex(
      seoTitle: json['seoTitle'] as String?,
      webUrl: json['webURL'] as String?,
    );

Map<String, dynamic> _$AppIndexToJson(AppIndex instance) => <String, dynamic>{
      'seoTitle': instance.seoTitle,
      'webURL': instance.webUrl,
    };

SeriesVenueElement _$SeriesVenueElementFromJson(Map<String, dynamic> json) =>
    SeriesVenueElement(
      id: json['id'] as int?,
      ground: json['ground'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      imageId: json['imageId'] as String?,
    );

Map<String, dynamic> _$SeriesVenueElementToJson(SeriesVenueElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ground': instance.ground,
      'city': instance.city,
      'country': instance.country,
      'imageId': instance.imageId,
    };
