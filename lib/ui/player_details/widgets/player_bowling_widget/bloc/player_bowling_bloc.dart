import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:equatable/equatable.dart';

part 'player_bowling_event.dart';
part 'player_bowling_state.dart';

class PlayerBowlingBloc extends Bloc<PlayerBowlingEvent, PlayerBowlingState> {
  final CricBuzzRepository repository;
  final String playerId;

  PlayerBowlingBloc({required this.repository, required this.playerId}) : super(PlayerBowlingInitial()) {
    on<PlayerBowlingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
