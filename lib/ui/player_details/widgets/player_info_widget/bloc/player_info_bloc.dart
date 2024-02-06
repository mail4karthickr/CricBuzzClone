import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/player_info.dart';
import 'package:equatable/equatable.dart';

part 'player_info_event.dart';
part 'player_info_state.dart';

class PlayerInfoBloc extends Bloc<PlayerInfoEvent, PlayerInfoState> {
  final CricBuzzRepository repository;
  final String playerId;
  PlayerInfoBloc({required this.repository, required this.playerId}) : super(const PlayerInfoState()) {
    on<GetPlayerInfo>(_mapGetPlayerInfoEventToState);
  }

  void _mapGetPlayerInfoEventToState(GetPlayerInfo event, Emitter<PlayerInfoState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    try {
      final playerInfo = await repository.getPlayerInfo(playerId: playerId);
      emit(state.copyWith(status: ApiStatus.success, playerInfo: playerInfo));
    } catch(error) {
      emit(state.copyWith(status: ApiStatus.error, playerInfo: null));
    }
  }
}
