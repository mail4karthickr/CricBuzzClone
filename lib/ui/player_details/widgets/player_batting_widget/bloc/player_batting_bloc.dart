import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:equatable/equatable.dart';

part 'player_batting_event.dart';
part 'player_batting_state.dart';

class PlayerBattingBloc extends Bloc<PlayerBattingEvent, PlayerBattingState> {
  final CricBuzzRepository repository;
  final String playerId;

  PlayerBattingBloc({required this.repository, required this.playerId}) : super(PlayerBattingInitial()) {
    on<PlayerBattingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
