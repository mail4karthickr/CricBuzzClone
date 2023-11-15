import 'package:json_annotation/json_annotation.dart';

part 'match_details.g.dart';

@JsonSerializable()
class MatchDetails {
    final MatchInfo matchInfo;
    final MatchScore? matchScore;

    const MatchDetails({
        required this.matchInfo,
        required this.matchScore
    });

    static const empty = MatchDetails(matchInfo: MatchInfo.empty,matchScore: MatchScore.empty);

    factory MatchDetails.fromJson(Map<String, dynamic> json) => _$MatchDetailsFromJson(json);
}

@JsonSerializable()
class MatchScore {
    final TeamScore? team1Score;
    final TeamScore? team2Score;

    const MatchScore({
        this.team1Score,
        this.team2Score,
    });

    static const empty = MatchScore(team1Score: TeamScore.empty, team2Score: TeamScore.empty);

    factory MatchScore.fromJson(Map<String, dynamic> json) => _$MatchScoreFromJson(json);
}

@JsonSerializable()
class TeamScore {
    final Inngs? inngs1;
    final Inngs? inngs2;

    const TeamScore({
      required this.inngs1,
      required this.inngs2
    });

    static const empty = TeamScore(
      inngs1: Inngs.empty, 
      inngs2: Inngs.empty
    );

    factory TeamScore.fromJson(Map<String, dynamic> json) => _$TeamScoreFromJson(json);
}

@JsonSerializable()
class Inngs {
    final int? inningsId;
    final int? runs;
    final int? wickets;
    final double? overs;

    const Inngs({
        required this.inningsId,
        required this.runs,
        this.wickets,
        required this.overs,
    });

    static const empty = Inngs(inningsId: 0, runs: 0, overs: 0);
    
    factory Inngs.fromJson(Map<String, dynamic> json) => _$InngsFromJson(json);
}

@JsonSerializable() 
class MatchInfo {
    final int matchId;
    final int seriesId;
    final String seriesName;
    final String matchDesc;
    final String matchFormat;
    final String startDate;
    final String endDate;
    final String state;
    final String status;
    final Team team1;
    final Team team2;
    final VenueInfo venueInfo;
    final String seriesStartDt;
    final String seriesEndDt;
    final bool? isTimeAnnounced;
    final String? stateTitle;
    final bool? isFantasyEnabled;

    const MatchInfo({
        required this.matchId,
        required this.seriesId,
        required this.seriesName,
        required this.matchDesc,
        required this.matchFormat,
        required this.startDate,
        required this.endDate,
        required this.state,
        required this.status,
        required this.team1,
        required this.team2,
        required this.venueInfo,
        required this.seriesStartDt,
        required this.seriesEndDt,
        required this.isTimeAnnounced,
        required this.stateTitle,
        this.isFantasyEnabled,
    });

    static const empty = MatchInfo(
      matchId: 0, 
      seriesId: 0, 
      seriesName: '',
      matchDesc: '',
      matchFormat: '', 
      startDate: '', 
      endDate: '', 
      state: '', 
      status: "",
      team1: Team.empty, 
      team2: Team.empty, 
      venueInfo: VenueInfo.empty, 
      seriesStartDt: '', 
      seriesEndDt: '', 
      isTimeAnnounced: false, 
      stateTitle: ''
    );

    factory MatchInfo.fromJson(Map<String, dynamic> json) => _$MatchInfoFromJson(json);
}

@JsonSerializable()
class Team {
    final int teamId;
    final String teamName;
    final String teamSName;
    final int imageId;

    const Team({
      required this.teamId,
      required this.teamName,
      required this.teamSName,
      required this.imageId,
    });

    static const empty = Team(
      teamId: 0, 
      teamName: '', 
      teamSName: '', 
      imageId: 0
    );

    factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
}

@JsonSerializable()
class VenueInfo {
    final int? id;
    final String ground;
    final String city;
    final String timezone;
    final String? latitude;
    final String? longitude;

    const VenueInfo({
        this.id,
        required this.ground,
        required this.city,
        required this.timezone,
        this.latitude,
        this.longitude,
    });

    static const empty = VenueInfo(ground: '', city: '', timezone: '');

    factory VenueInfo.fromJson(Map<String, dynamic> json) => _$VenueInfoFromJson(json);
}

