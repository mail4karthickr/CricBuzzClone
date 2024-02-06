// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'series_squad_list_bloc.dart';

class SeriesSquadListState extends Equatable {
   const SeriesSquadListState({
    this.status = ApiStatus.initial,
    SeriesPlayers? players
  }) : players = players ?? SeriesPlayers.empty;

  final SeriesPlayers players;
  final ApiStatus status;
  
  @override
  List<Object> get props => [players, status];

  SeriesSquadListState copyWith({
    SeriesPlayers? players,
    ApiStatus? status,
  }) {
    return SeriesSquadListState(
      players: players ?? this.players,
      status: status ?? this.status,
    );
  }
}
