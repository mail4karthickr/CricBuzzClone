part of 'series_squad_list_bloc.dart';

class SeriesSquadListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetSeriesPlayers extends SeriesSquadListEvent {
  final int seriesId;
  final int squadId;

  GetSeriesPlayers({
    required this.seriesId,
    required this.squadId
  });

  @override
  List<Object> get props => [seriesId, squadId];
}
