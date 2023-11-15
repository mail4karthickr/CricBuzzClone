import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/ui/matches/pages/matches_page.dart';
import 'package:equatable/equatable.dart';

part 'matches_layout_event.dart';
part 'matches_layout_state.dart';

class MatchesLayoutBloc extends Bloc<MatchesLayoutEvent, MatchesLayoutState> {
  MatchesLayoutBloc() : super(const MatchesLayoutState()) {
    on<LayoutTabChanged>(_mapTabChangedToState);
  }

  void _mapTabChangedToState(LayoutTabChanged event, Emitter<MatchesLayoutState> emit) {
    emit(state.copyWith(selectedTab: event.tab));
  }
}
