import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/match_type.dart';
import 'package:cricbuzz_clone/repository/models/model_barrel.dart';
import 'package:cricbuzz_clone/repository/models/result_error.dart';
import 'package:cricbuzz_clone/ui/matches/pages/matches_page.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_categories/matches_categories.dart';
import 'package:equatable/equatable.dart';

part 'matches_list_event.dart';
part 'matches_list_state.dart';

class MatchesListBloc extends Bloc<MatchesListEvent, MatchesListState> {
  MatchesListBloc({
    required this.repository
  }) : super(const MatchesListState()) {
    on<GetMatches>(_mapGetMatchesEventToState);
    on<TabChanged>(_mapTabChangedToState);
    on<CategorySelected>(_mapCategorySelectedEventToState);
    on<SetScrollToTop>(_mapScrollToTopEventToState);
    on<NavigateToSeriesDetail>(_mapNavigateToSeriesDetailEventToState);
  }

  final CricBuzzRepository repository;

  void _mapScrollToTopEventToState(SetScrollToTop event, Emitter<MatchesListState> emit) {
    emit(state.copyWith(scrollToTop: event.scrollToTop));
  }

  void _mapGetMatchesEventToState(GetMatches event, Emitter<MatchesListState> emit) async {
    try {
      emit(state.copyWith(status: ApiStatus.loading));
      final response = await repository.getMatches(type: event.type);
      _updateResponse(event, emit, response, response);
      // switch (event.type) {
      //   case MatchType.live:
      //   emit(state.copyWith(status: ApiStatus.success, liveMatches: response, filtertedLiveMatches: response));
      //   case MatchType.upcoming:
      //   emit(state.copyWith(status: ApiStatus.success, upcomingMatches: response, filteredUpcomingMatches: response));
      //   case MatchType.recent:
      //   emit(state.copyWith(status: ApiStatus.success, recentMatches: response, filteredRecentMatches: response));
      // }
    } on DataIsEmpty {
      _updateResponse(event, emit, null, null);
    } catch (error) {
      emit(state.copyWith(status: ApiStatus.error));
    }
  }

  void _updateResponse(GetMatches event, Emitter<MatchesListState> emit, MatchTypeList? matches, MatchTypeList? filteredMatches) {
     switch (event.type) {
        case MatchType.live:
        emit(state.copyWith(status: ApiStatus.success, liveMatches: matches, filtertedLiveMatches: filteredMatches));
        case MatchType.upcoming:
        emit(state.copyWith(status: ApiStatus.success, upcomingMatches: matches, filteredUpcomingMatches: filteredMatches));
        case MatchType.recent:
        emit(state.copyWith(status: ApiStatus.success, recentMatches: matches, filteredRecentMatches: filteredMatches));
      }
  }

  void _mapTabChangedToState(TabChanged event, Emitter<MatchesListState> emit) {
    emit(state.copyWith(selectedTab: event.tab));
  }

  void _mapCategorySelectedEventToState(CategorySelected event, Emitter<MatchesListState> emit) {
    final category = event.category;
    final selectedTab = state.selectedTab;
    switch (selectedTab) {
      case MatchesTab.live:
       final matchesList = _filterTypeMatches(typeList: state.liveMatches, category: category);
       emit(state.copyWith(
          filtertedLiveMatches: category.isAll ? state.liveMatches : _matchTypeList(matchesList), 
          scrollToTop: true
        ));
      case MatchesTab.upcoming:
       final matchesList = _filterTypeMatches(typeList: state.upcomingMatches, category: category);
       emit(state.copyWith(filteredUpcomingMatches: category.isAll ? state.upcomingMatches : _matchTypeList(matchesList), scrollToTop: true));
      case MatchesTab.recent:
       final matchesList = _filterTypeMatches(typeList: state.recentMatches, category: category);
       final f = _matchTypeList(matchesList);
       print("Recent matches list ${f}");
       emit(state.copyWith(filteredRecentMatches: category.isAll ? state.recentMatches : f, scrollToTop: true));
    }
  }

  void _mapNavigateToSeriesDetailEventToState(NavigateToSeriesDetail event, Emitter<MatchesListState> emit) {
    emit(state.copyWith(
      navigateToSeriesDetail: event.shouldNavigate, 
      selectedSeries: event.series
    ));
  }

  List<TypeMatch> _filterTypeMatches({required MatchTypeList typeList, required MatchCategory category}) {
    return typeList.typeMatches.where((element) => element.matchType == category.name).toList();
  }

  MatchTypeList _matchTypeList(List<TypeMatch> typeMatches) {
    return MatchTypeList(
        typeMatches: typeMatches, 
        filters: state.liveMatches.filters, 
        appIndex: state.liveMatches.appIndex, 
        responseLastUpdated: state.liveMatches.responseLastUpdated
      );
  }
}
