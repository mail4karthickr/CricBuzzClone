import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/squads_wrapper.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:equatable/equatable.dart';

part 'squads_event.dart';
part 'squads_state.dart';

class SquadsBloc extends Bloc<SquadsEvent, SquadsState> {
  final CricBuzzRepository repository;

  SquadsBloc({required this.repository}) : super(const SquadsState()) {
    on<GetSquads>(_mapGetSquadsEventToState);
  }

  _mapGetSquadsEventToState(GetSquads event, Emitter<SquadsState> emit) async {
    try {
      emit(state.copyWith(status: ApiStatus.loading));
      final response = await repository.getSquads(seriesId: event.seriesId);
      emit(state.copyWith(status: ApiStatus.success, squadsWrapper: response));
    } catch (error) {
      emit(state.copyWith(status: ApiStatus.error));
    }
  }
}
