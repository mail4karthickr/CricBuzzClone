// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryList _$StoryListFromJson(Map<String, dynamic> json) => StoryList(
      storyList: (json['storyList'] as List<dynamic>?)
          ?.map((e) => StoryListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdatedTime: json['lastUpdatedTime'] as String?,
      appIndex: json['appIndex'] == null
          ? null
          : AppIndex.fromJson(json['appIndex'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryListToJson(StoryList instance) => <String, dynamic>{
      'storyList': instance.storyList,
      'lastUpdatedTime': instance.lastUpdatedTime,
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

StoryListElement _$StoryListElementFromJson(Map<String, dynamic> json) =>
    StoryListElement(
      story: json['story'] == null
          ? null
          : Story.fromJson(json['story'] as Map<String, dynamic>),
      ad: json['ad'] == null
          ? null
          : Ad.fromJson(json['ad'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryListElementToJson(StoryListElement instance) =>
    <String, dynamic>{
      'story': instance.story,
      'ad': instance.ad,
    };

Ad _$AdFromJson(Map<String, dynamic> json) => Ad(
      name: json['name'] as String?,
      layout: json['layout'] as String?,
      position: json['position'] as int?,
    );

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'name': instance.name,
      'layout': instance.layout,
      'position': instance.position,
    };

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
      id: json['id'] as int?,
      hline: json['hline'] as String?,
      intro: json['intro'] as String?,
      pubTime: json['pubTime'] as String?,
      source: json['source'] as String?,
      storyType: json['storyType'] as String?,
      imageId: json['imageId'] as int?,
      seoHeadline: json['seoHeadline'] as String?,
      context: json['context'] as String?,
      coverImage: json['coverImage'] == null
          ? null
          : CoverImage.fromJson(json['coverImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoryToJson(Story instance) => <String, dynamic>{
      'id': instance.id,
      'hline': instance.hline,
      'intro': instance.intro,
      'pubTime': instance.pubTime,
      'source': instance.source,
      'storyType': instance.storyType,
      'imageId': instance.imageId,
      'seoHeadline': instance.seoHeadline,
      'context': instance.context,
      'coverImage': instance.coverImage,
    };

CoverImage _$CoverImageFromJson(Map<String, dynamic> json) => CoverImage(
      id: json['id'] as String?,
      caption: json['caption'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$CoverImageToJson(CoverImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'caption': instance.caption,
      'source': instance.source,
    };
