import 'dart:typed_data';

import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/match_details_wrapper.dart';
import 'package:cricbuzz_clone/repository/models/match_type.dart';
import 'package:cricbuzz_clone/repository/models/matches_list.dart';
import 'package:cricbuzz_clone/repository/models/points_table.dart';
import 'package:cricbuzz_clone/repository/models/result_error.dart';
import 'package:cricbuzz_clone/repository/models/series_venue.dart';
import 'package:cricbuzz_clone/repository/models/squads_wrapper.dart';
import 'package:cricbuzz_clone/repository/models/stats_filters.dart';
import 'package:cricbuzz_clone/repository/models/story_list.dart';
import 'package:dio/dio.dart';

import 'dio_factory.dart';

// FIXME - Refactor API call functions.
class CricBuzzService {
  CricBuzzService({
    Dio? dio
  }) : _dio = dio ?? DioFactory().instance();

  final Dio _dio;

  Future<MatchTypeList> getMatches({required MatchType type}) async {
    final response = await _dio.get('/matches/v1/${type.name}');
    final data = response.data as Map<String, dynamic>;
    if (response.statusCode == 200 && data.isEmpty) {
      throw DataIsEmpty();
    }
    if (response.statusCode == 200) {
      try {
        return MatchTypeList.fromJson(response.data);
      } catch(e) {
        throw ErrorGettingMatchesList('Error getting matches List');
      }
    } else {
      throw ErrorGettingMatchesList('Error getting matches List');
    }
  }

  Future<MatchDetailsWrapper> getMatchesFor({required int seriesId}) async {
    final response = await _dio.get('/series/v1/$seriesId');
    final data = response.data as Map<String, dynamic>;
    if (response.statusCode == 200 && data.isEmpty) {
      throw DataIsEmpty();
    }
    if (response.statusCode == 200) {
      try {
        return MatchDetailsWrapper.fromJson(response.data);
      } catch(e) {
        rethrow;
      }
    } else {
      throw ErrorGettingMatchesList('Error getting matches List');
    }  
  }

  Future<Uint8List> getImage({required String imageId, ImageResolution? resolution, ImageType? imageType}) async {
    final modifiedImageId = "c$imageId";
    final queryParameters = <String, String>{};
    if (resolution != null) {
      queryParameters['d'] = resolution.toString().split('.').last;
    }
    if (imageType != null) {
      queryParameters['p'] = resolution.toString().split('.').last;
    }
    final response = await _dio.get(
      '/img/v1/i1/$modifiedImageId/i.jpg',
      queryParameters: queryParameters,
      options:  Options(responseType: ResponseType.bytes)
    );
    if (response.statusCode == 200) {
      return Uint8List.fromList(response.data); 
    } else {
      throw ErrorGettingImage('Error getting image');
    }
  }

  Future<PointsTable> getPointsTable({required int seriesId}) async {
    final response = await _dio.get('/stats/v1/series/$seriesId/points-table');
    if (response.statusCode == 200 && response.data.isEmpty) {
      throw DataIsEmpty();
    }
    if (response.statusCode == 200) {
      try {
        return PointsTable.fromJson(response.data);
      } catch(e) {
        print("Parsing error ${e}");
        throw ErrorGettingMatchesList('Error getting matches List');
      }
    } else {
      throw ErrorGettingMatchesList('Error getting matches List');
    }
  }

    Future<SquadsWrapper> getSquads({required int seriesId}) async {
    final response = await _dio.get('/series/v1/$seriesId/squads');
    if (response.statusCode == 200 && response.data.isEmpty) {
      throw DataIsEmpty();
    }
    if (response.statusCode == 200) {
      try {
        return SquadsWrapper.fromJson(response.data);
      } catch(e) {
        throw ErrorGettingMatchesList('Error getting matches List');
      }
    } else {
      throw ErrorGettingMatchesList('Error getting matches List');
    }
  }

  Future<StatsFilters> getStatsFilters({required int seriesId}) async {
    final response = await _dio.get('/stats/v1/series/$seriesId');
    if (response.statusCode == 200 && response.data.isEmpty) {
      throw DataIsEmpty();
    }
    if (response.statusCode == 200) {
      try {
        return StatsFilters.fromJson(response.data);
      } catch(e) {
        throw ErrorGettingMatchesList('Error getting matches List');
      }
    } else {
      throw ErrorGettingMatchesList('Error getting matches List');
    }
  }

    Future<StoryList> getStoryList({required int seriesId}) async {
    final response = await _dio.get('/news/v1/series/$seriesId');
    if (response.statusCode == 200 && response.data.isEmpty) {
      throw DataIsEmpty();
    }
    if (response.statusCode == 200) {
      try {
        return StoryList.fromJson(response.data);
      } catch(e) {
        throw ErrorGettingMatchesList('Error getting matches List');
      }
    } else {
      throw ErrorGettingMatchesList('Error getting matches List');
    }
  }

  Future<SeriesVenue> getSeriesVenues({required int seriesId}) async {
    final response = await _dio.get('/series/v1/$seriesId/venues');
    if (response.statusCode == 200 && response.data.isEmpty) {
      throw DataIsEmpty();
    }
    if (response.statusCode == 200) {
      try {
        return SeriesVenue.fromJson(response.data);
      } catch(e) {
        throw ErrorGettingMatchesList('Error getting matches List');
      }
    } else {
      throw ErrorGettingMatchesList('Error getting matches List');
    }
  }
}

