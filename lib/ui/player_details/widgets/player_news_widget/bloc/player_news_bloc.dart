import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:equatable/equatable.dart';

part 'player_news_event.dart';
part 'player_news_state.dart';

class PlayerNewsBloc extends Bloc<PlayerNewsEvent, PlayerNewsState> {
  final CricBuzzRepository repository;
  final String playerId;

  PlayerNewsBloc({required this.repository, required this.playerId}) : super(PlayerNewsInitial()) {
    on<PlayerNewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
