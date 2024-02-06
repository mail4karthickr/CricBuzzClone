import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/series_venue.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:equatable/equatable.dart';

part 'venues_event.dart';
part 'venues_state.dart';

class VenuesBloc extends Bloc<VenuesEvent, VenuesState> {
  final CricBuzzRepository repository;
  VenuesBloc({required this.repository}) : super(const VenuesState()) {
    on<GetSeriesVenues>(_mapGetSeriesVenuesEventToState);
  }

  _mapGetSeriesVenuesEventToState(GetSeriesVenues event, Emitter<VenuesState> emit) async {
    try {
      emit(state.copyWith(status: ApiStatus.loading));
      final response = await repository.getSeriesVenues(seriesId: event.seriesId);
      emit(state.copyWith(status: ApiStatus.success, venues: response));
    } catch (error) {
      emit(state.copyWith(status: ApiStatus.error));
    }
  }
}
