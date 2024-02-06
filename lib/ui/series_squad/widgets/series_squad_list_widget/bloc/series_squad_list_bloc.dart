import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/series_players.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:equatable/equatable.dart';

part 'series_squad_list_event.dart';
part 'series_squad_list_state.dart';

class SeriesSquadListBloc extends Bloc<SeriesSquadListEvent, SeriesSquadListState> {
  SeriesSquadListBloc({
    required this.repository
  }) : super(const SeriesSquadListState()) {
    on<GetSeriesPlayers>(_mapGetSeriesPlayersEventToState);
  }

  final CricBuzzRepository repository;

  void _mapGetSeriesPlayersEventToState(GetSeriesPlayers event, Emitter<SeriesSquadListState> emit) async {
    try {
       emit(state.copyWith(status: ApiStatus.loading));
       final players = await repository.getSeriesPlayers(
        seriesId: event.seriesId, 
        squadId: event.squadId
      );
      emit(state.copyWith(status: ApiStatus.success, players: players));
    } catch (error) {
      emit(state.copyWith(status: ApiStatus.error, players: SeriesPlayers.empty));
    }
  }
}
