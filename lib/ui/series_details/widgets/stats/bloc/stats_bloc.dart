import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/stats_filters.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:equatable/equatable.dart';

part 'stats_event.dart';
part 'stats_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final CricBuzzRepository repository;
  StatsBloc({required this.repository}) : super(const StatsState()) {
    on<GetStatsFilters>(_mapGetStatsFiltersEventToState);
  }

   _mapGetStatsFiltersEventToState(GetStatsFilters event, Emitter<StatsState> emit) async {
    try {
      emit(state.copyWith(status: ApiStatus.loading));
      final response = await repository.getStatsFilters(seriesId: event.seriesId);
      emit(state.copyWith(status: ApiStatus.success, filters: response));
    } catch (error) {
      emit(state.copyWith(status: ApiStatus.error));
    }
  }
}
