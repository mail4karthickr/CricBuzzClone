import 'package:cricbuzz_clone/repository/models/match_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'matches_list.g.dart';

@JsonSerializable()
class MatchTypeList {
    const MatchTypeList({
        required this.typeMatches,
        required this.filters,
        required this.appIndex,
        required this.responseLastUpdated,
    });

    final List<TypeMatch> typeMatches;
    final Filters filters;
    final AppIndex appIndex;
    final String responseLastUpdated;

    static const empty = MatchTypeList(
      typeMatches: [TypeMatch.empty],
      filters: Filters.empty,
      appIndex: AppIndex.empty,
      responseLastUpdated: ''
    );

    factory MatchTypeList.fromJson(Map<String, dynamic> json) => _$MatchTypeListFromJson(json);
}

@JsonSerializable()
class AppIndex {
    final String seoTitle;
    @JsonKey(name:"webURL")
    final String webUrl;

    const AppIndex({
      required this.seoTitle,
      required this.webUrl,
    });

    static const empty = AppIndex(seoTitle: '', webUrl: '');

    factory AppIndex.fromJson(Map<String, dynamic> json) => _$AppIndexFromJson(json);
}

@JsonSerializable()
class Filters {
    final List<String> matchType;

    const Filters({
      required this.matchType,
    });

    static const empty = Filters(matchType: []);

    factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);
}

@JsonSerializable()
class TypeMatch {
    final String matchType;
    final List<SeriesMatch> seriesMatches;

    const TypeMatch({
      required this.matchType,
      required this.seriesMatches,
    });

    static const empty = TypeMatch(matchType: '', seriesMatches: [SeriesMatch.empty]);

    factory TypeMatch.fromJson(Map<String, dynamic> json) => _$TypeMatchFromJson(json);
}

@JsonSerializable()
class SeriesMatch {
    final SeriesAdWrapper? seriesAdWrapper;
    final AdDetail? adDetail;

    const SeriesMatch({
        this.seriesAdWrapper,
        this.adDetail,
    });

    static const empty = SeriesMatch(seriesAdWrapper: null, adDetail: null);

    factory SeriesMatch.fromJson(Map<String, dynamic> json) => _$SeriesMatchFromJson(json);
}

@JsonSerializable()
class AdDetail {
    final String name;
    final String layout;
    final int position;

    const AdDetail({
        required this.name,
        required this.layout,
        required this.position,
    });

    static const empty = AdDetail(name: '', layout: '', position: 0);

    factory AdDetail.fromJson(Map<String, dynamic> json) => _$AdDetailFromJson(json);
}

@JsonSerializable()
class SeriesAdWrapper {
    final int seriesId;
    final String seriesName;
    final List<MatchDetails> matches;

    const SeriesAdWrapper({
        required this.seriesId,
        required this.seriesName,
        required this.matches,
    });

    static const empty = SeriesAdWrapper(
      seriesId: 0, 
      seriesName: '', 
      matches: [MatchDetails.empty]
    );

    factory SeriesAdWrapper.fromJson(Map<String, dynamic> json) => _$SeriesAdWrapperFromJson(json);
}