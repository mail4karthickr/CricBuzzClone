import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/match_details_wrapper.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/utils/date_utils.dart';
import 'package:equatable/equatable.dart';

part 'match_details_event.dart';
part 'match_details_state.dart';

class MatchDetailsBloc extends Bloc<MatchDetailsEvent, MatchDetailsState> {
  final CricBuzzRepository repository;
  MatchDetailsBloc({required this.repository}) : super(const MatchDetailsState()) {
    on<GetMatches>(_mapGetMatchesEventToState);
  }

  void _mapGetMatchesEventToState(GetMatches event, Emitter<MatchDetailsState> emit) async {
    try {
      emit(state.copyWith(status: ApiStatus.loading));
      final response = await repository.getMatchesFor(seriesId: event.seriesId);
      var currentMatchIndex = 0;
      response.matchDetails?.asMap().forEach((index, type) {
        final matchDetailsMap = type.matchDetailsMap;
        if (matchDetailsMap != null) {
          final today = DateTime.now();
          final inputDate = DateUtils.parseDate(matchDetailsMap.key ?? "");
          if (DateUtils.isSameDate(today, inputDate)) {
            currentMatchIndex = index;
          }
        }
      });
      emit(state.copyWith(status: ApiStatus.success, matchDetails: response, currentMatchIndex: currentMatchIndex));
    } catch (error) {
        emit(state.copyWith(status: ApiStatus.error, matchDetails: MatchDetailsWrapper().copyWith()));
    }
  }
}
