// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchDetails _$MatchDetailsFromJson(Map<String, dynamic> json) => MatchDetails(
      matchInfo: MatchInfo.fromJson(json['matchInfo'] as Map<String, dynamic>),
      matchScore: json['matchScore'] == null
          ? null
          : MatchScore.fromJson(json['matchScore'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchDetailsToJson(MatchDetails instance) =>
    <String, dynamic>{
      'matchInfo': instance.matchInfo,
      'matchScore': instance.matchScore,
    };

MatchScore _$MatchScoreFromJson(Map<String, dynamic> json) => MatchScore(
      team1Score: json['team1Score'] == null
          ? null
          : TeamScore.fromJson(json['team1Score'] as Map<String, dynamic>),
      team2Score: json['team2Score'] == null
          ? null
          : TeamScore.fromJson(json['team2Score'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MatchScoreToJson(MatchScore instance) =>
    <String, dynamic>{
      'team1Score': instance.team1Score,
      'team2Score': instance.team2Score,
    };

TeamScore _$TeamScoreFromJson(Map<String, dynamic> json) => TeamScore(
      inngs1: json['inngs1'] == null
          ? null
          : Inngs.fromJson(json['inngs1'] as Map<String, dynamic>),
      inngs2: json['inngs2'] == null
          ? null
          : Inngs.fromJson(json['inngs2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TeamScoreToJson(TeamScore instance) => <String, dynamic>{
      'inngs1': instance.inngs1,
      'inngs2': instance.inngs2,
    };

Inngs _$InngsFromJson(Map<String, dynamic> json) => Inngs(
      inningsId: json['inningsId'] as int?,
      runs: json['runs'] as int?,
      wickets: json['wickets'] as int?,
      overs: (json['overs'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InngsToJson(Inngs instance) => <String, dynamic>{
      'inningsId': instance.inningsId,
      'runs': instance.runs,
      'wickets': instance.wickets,
      'overs': instance.overs,
    };

MatchInfo _$MatchInfoFromJson(Map<String, dynamic> json) => MatchInfo(
      matchId: json['matchId'] as int,
      seriesId: json['seriesId'] as int,
      seriesName: json['seriesName'] as String,
      matchDesc: json['matchDesc'] as String,
      matchFormat: json['matchFormat'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      state: json['state'] as String,
      status: json['status'] as String,
      team1: Team.fromJson(json['team1'] as Map<String, dynamic>),
      team2: Team.fromJson(json['team2'] as Map<String, dynamic>),
      venueInfo: VenueInfo.fromJson(json['venueInfo'] as Map<String, dynamic>),
      seriesStartDt: json['seriesStartDt'] as String,
      seriesEndDt: json['seriesEndDt'] as String,
      isTimeAnnounced: json['isTimeAnnounced'] as bool?,
      stateTitle: json['stateTitle'] as String?,
      isFantasyEnabled: json['isFantasyEnabled'] as bool?,
    );

Map<String, dynamic> _$MatchInfoToJson(MatchInfo instance) => <String, dynamic>{
      'matchId': instance.matchId,
      'seriesId': instance.seriesId,
      'seriesName': instance.seriesName,
      'matchDesc': instance.matchDesc,
      'matchFormat': instance.matchFormat,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'state': instance.state,
      'status': instance.status,
      'team1': instance.team1,
      'team2': instance.team2,
      'venueInfo': instance.venueInfo,
      'seriesStartDt': instance.seriesStartDt,
      'seriesEndDt': instance.seriesEndDt,
      'isTimeAnnounced': instance.isTimeAnnounced,
      'stateTitle': instance.stateTitle,
      'isFantasyEnabled': instance.isFantasyEnabled,
    };

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      teamId: json['teamId'] as int,
      teamName: json['teamName'] as String,
      teamSName: json['teamSName'] as String,
      imageId: json['imageId'] as int,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'teamId': instance.teamId,
      'teamName': instance.teamName,
      'teamSName': instance.teamSName,
      'imageId': instance.imageId,
    };

VenueInfo _$VenueInfoFromJson(Map<String, dynamic> json) => VenueInfo(
      id: json['id'] as int?,
      ground: json['ground'] as String,
      city: json['city'] as String,
      timezone: json['timezone'] as String,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$VenueInfoToJson(VenueInfo instance) => <String, dynamic>{
      'id': instance.id,
      'ground': instance.ground,
      'city': instance.city,
      'timezone': instance.timezone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
