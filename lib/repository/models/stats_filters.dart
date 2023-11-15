// To parse this JSON data, do
//
//     final statsFilters = statsFiltersFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'stats_filters.g.dart';

StatsFilters statsFiltersFromJson(String str) => StatsFilters.fromJson(json.decode(str));

String statsFiltersToJson(StatsFilters data) => json.encode(data.toJson());

@JsonSerializable()
class StatsFilters {
    @JsonKey(name: "types")
    List<Type>? types;
    @JsonKey(name: "appIndex")
    AppIndex? appIndex;

    StatsFilters({
        this.types,
        this.appIndex,
    });

    factory StatsFilters.fromJson(Map<String, dynamic> json) => _$StatsFiltersFromJson(json);

    Map<String, dynamic> toJson() => _$StatsFiltersToJson(this);
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
class Type {
    @JsonKey(name: "header")
    String? header;
    @JsonKey(name: "value")
    String? value;
    @JsonKey(name: "category")
    String? category;

    Type({
        this.header,
        this.value,
        this.category,
    });

    factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

    Map<String, dynamic> toJson() => _$TypeToJson(this);
}
