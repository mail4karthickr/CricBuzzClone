import 'dart:typed_data';

import 'package:cricbuzz_clone/repository/models/match_details_wrapper.dart';
import 'package:cricbuzz_clone/repository/models/match_type.dart';
import 'package:cricbuzz_clone/repository/models/player_info.dart';
import 'package:cricbuzz_clone/repository/models/points_table.dart';
import 'package:cricbuzz_clone/repository/models/series_players.dart';
import 'package:cricbuzz_clone/repository/models/series_venue.dart';
import 'package:cricbuzz_clone/repository/models/squads_wrapper.dart';
import 'package:cricbuzz_clone/repository/models/stats_filters.dart';
import 'package:cricbuzz_clone/repository/models/story_list.dart';
import 'package:cricbuzz_clone/repository/service/cricbuzz_service.dart';
import 'models/model_barrel.dart';

enum ImageResolution {
  high, low
}

enum ImageType {
  de, det, gthumb, thumb
}

class CricBuzzRepository {
  const CricBuzzRepository({
    required this.service
  });
  final CricBuzzService service;

  Future<MatchTypeList> getMatches({
    required MatchType type
  }) async => service.getMatches(type: type);

  Future<MatchDetailsWrapper> getMatchesFor({
    required int seriesId
  }) async => service.getMatchesFor(seriesId: seriesId);
  
  Future<Uint8List> getImage({
    required String imageId, 
    ImageResolution? resolution, 
    ImageType? type
  }) async => service.getImage(imageId: imageId, resolution: resolution, imageType: type);

  Future<PointsTable> getPointsTable({
    required int seriesId
  }) async => service.getPointsTable(seriesId: seriesId);

  Future<SquadsWrapper> getSquads({
    required int seriesId
  }) async => service.getSquads(seriesId: seriesId);

  Future<StatsFilters> getStatsFilters({
    required int seriesId
  }) async => service.getStatsFilters(seriesId: seriesId);

  Future<StoryList> getStoryList({
    required int seriesId
  }) async => service.getStoryList(seriesId: seriesId);

  Future<SeriesVenue> getSeriesVenues({
    required int seriesId
  }) async => service.getSeriesVenues(seriesId: seriesId);

  Future<SeriesPlayers> getSeriesPlayers({ 
    required int seriesId, 
    required int squadId 
  }) async => service.getSeriesPlayers(seriesId: seriesId, squadId: squadId);

  Future<PlayerInfo> getPlayerInfo({ 
    required String playerId, 
  }) async => service.getPlayerInfo(playerId: playerId);
}