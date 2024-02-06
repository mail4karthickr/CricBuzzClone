import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:equatable/equatable.dart';

part 'player_carrer_event.dart';
part 'player_carrer_state.dart';

class PlayerCarrerBloc extends Bloc<PlayerCarrerEvent, PlayerCarrerState> {
  final CricBuzzRepository repository;
  final String playerId;

  PlayerCarrerBloc({required this.repository, required this.playerId}) : super(PlayerCarrerInitial()) {
    on<PlayerCarrerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
