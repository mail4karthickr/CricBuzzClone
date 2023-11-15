// To parse this JSON data, do
//
//     final storyList = storyListFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'story_list.g.dart';

StoryList storyListFromJson(String str) => StoryList.fromJson(json.decode(str));

String storyListToJson(StoryList data) => json.encode(data.toJson());

@JsonSerializable()
class StoryList {
    @JsonKey(name: "storyList")
    List<StoryListElement>? storyList;
    @JsonKey(name: "lastUpdatedTime")
    String? lastUpdatedTime;
    @JsonKey(name: "appIndex")
    AppIndex? appIndex;

    StoryList({
        this.storyList,
        this.lastUpdatedTime,
        this.appIndex,
    });

    factory StoryList.fromJson(Map<String, dynamic> json) => _$StoryListFromJson(json);

    Map<String, dynamic> toJson() => _$StoryListToJson(this);
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
class StoryListElement {
    @JsonKey(name: "story")
    Story? story;
    @JsonKey(name: "ad")
    Ad? ad;

    StoryListElement({
        this.story,
        this.ad,
    });

    factory StoryListElement.fromJson(Map<String, dynamic> json) => _$StoryListElementFromJson(json);

    Map<String, dynamic> toJson() => _$StoryListElementToJson(this);
}

@JsonSerializable()
class Ad {
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "layout")
    String? layout;
    @JsonKey(name: "position")
    int? position;

    Ad({
        this.name,
        this.layout,
        this.position,
    });

    factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);

    Map<String, dynamic> toJson() => _$AdToJson(this);
}

@JsonSerializable()
class Story {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "hline")
    String? hline;
    @JsonKey(name: "intro")
    String? intro;
    @JsonKey(name: "pubTime")
    String? pubTime;
    @JsonKey(name: "source")
    String? source;
    @JsonKey(name: "storyType")
    String? storyType;
    @JsonKey(name: "imageId")
    int? imageId;
    @JsonKey(name: "seoHeadline")
    String? seoHeadline;
    @JsonKey(name: "context")
    String? context;
    @JsonKey(name: "coverImage")
    CoverImage? coverImage;

    Story({
        this.id,
        this.hline,
        this.intro,
        this.pubTime,
        this.source,
        this.storyType,
        this.imageId,
        this.seoHeadline,
        this.context,
        this.coverImage,
    });

    factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);

    Map<String, dynamic> toJson() => _$StoryToJson(this);
}

@JsonSerializable()
class CoverImage {
    @JsonKey(name: "id")
    String? id;
    @JsonKey(name: "caption")
    String? caption;
    @JsonKey(name: "source")
    String? source;

    CoverImage({
        this.id,
        this.caption,
        this.source,
    });

    factory CoverImage.fromJson(Map<String, dynamic> json) => _$CoverImageFromJson(json);

    Map<String, dynamic> toJson() => _$CoverImageToJson(this);
}
