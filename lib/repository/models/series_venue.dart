// To parse this JSON data, do
//
//     final seriesVenue = seriesVenueFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'series_venue.g.dart';

SeriesVenue seriesVenueFromJson(String str) => SeriesVenue.fromJson(json.decode(str));

String seriesVenueToJson(SeriesVenue data) => json.encode(data.toJson());

@JsonSerializable()
class SeriesVenue {
    @JsonKey(name: "seriesVenue")
    List<SeriesVenueElement>? seriesVenue;
    @JsonKey(name: "appIndex")
    AppIndex? appIndex;
    @JsonKey(name: "seriesId")
    int? seriesId;
    @JsonKey(name: "seriesName")
    String? seriesName;

    SeriesVenue({
        this.seriesVenue,
        this.appIndex,
        this.seriesId,
        this.seriesName,
    });

    factory SeriesVenue.fromJson(Map<String, dynamic> json) => _$SeriesVenueFromJson(json);

    Map<String, dynamic> toJson() => _$SeriesVenueToJson(this);
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
class SeriesVenueElement {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "ground")
    String? ground;
    @JsonKey(name: "city")
    String? city;
    @JsonKey(name: "country")
    String? country;
    @JsonKey(name: "imageId")
    String? imageId;

    SeriesVenueElement({
        this.id,
        this.ground,
        this.city,
        this.country,
        this.imageId,
    });

    factory SeriesVenueElement.fromJson(Map<String, dynamic> json) => _$SeriesVenueElementFromJson(json);

    Map<String, dynamic> toJson() => _$SeriesVenueElementToJson(this);
}
