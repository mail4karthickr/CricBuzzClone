part of 'matches_list_bloc.dart';

class MatchesListState extends Equatable {
  const MatchesListState({
    this.status = ApiStatus.initial,
    this.selectedCategory = MatchCategory.all,
    this.selectedTab = MatchesTab.live,
    MatchTypeList? liveMatches,
    MatchTypeList? filtertedLiveMatches,
    MatchTypeList? upcomingMatches,
    MatchTypeList? filteredUpcomingMatches,
    MatchTypeList? recentMatches,
    MatchTypeList? filteredRecentMatches,
    this.scrollToTop = false,
    this.navigateToSeriesDetail = false,
    this.selectedSeries
  }) : liveMatches = liveMatches ?? MatchTypeList.empty,
    filtertedLiveMatches = filtertedLiveMatches ?? MatchTypeList.empty,
    upcomingMatches = upcomingMatches ?? MatchTypeList.empty,
    filteredUpcomingMatches = filteredUpcomingMatches ?? MatchTypeList.empty,
    recentMatches = recentMatches ?? MatchTypeList.empty,
    filteredRecentMatches = filteredRecentMatches ?? MatchTypeList.empty;

  final MatchCategory selectedCategory;
  final MatchesTab selectedTab;
  final MatchTypeList liveMatches;
  final MatchTypeList? filtertedLiveMatches;
  final MatchTypeList upcomingMatches;
  final MatchTypeList? filteredUpcomingMatches;
  final MatchTypeList recentMatches;
  final MatchTypeList? filteredRecentMatches;
  final ApiStatus status;
  final bool scrollToTop;
  final bool navigateToSeriesDetail;
  final SeriesAdWrapper? selectedSeries;
  
  @override
  List<Object?> get props => [
    selectedCategory, 
    selectedTab, 
    liveMatches, 
    filtertedLiveMatches, 
    upcomingMatches, 
    filteredUpcomingMatches, 
    recentMatches, 
    filteredRecentMatches,
    scrollToTop,
    navigateToSeriesDetail,
    selectedSeries
  ];

  MatchesListState copyWith({
    MatchesTab? selectedTab,
    MatchCategory? selectedCategory,
    MatchTypeList? liveMatches,
    MatchTypeList? filtertedLiveMatches,
    MatchTypeList? upcomingMatches,
    MatchTypeList? filteredUpcomingMatches,
    MatchTypeList? recentMatches,
    MatchTypeList? filteredRecentMatches,
    ApiStatus? status,
    bool? scrollToTop,
    bool? navigateToSeriesDetail,
    SeriesAdWrapper? selectedSeries
  }) {
    return MatchesListState(
      selectedTab: selectedTab ?? this.selectedTab,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      liveMatches: liveMatches ?? this.liveMatches,
      filtertedLiveMatches: filtertedLiveMatches ?? this.filtertedLiveMatches,
      upcomingMatches: upcomingMatches ?? this.upcomingMatches,
      filteredUpcomingMatches: filteredUpcomingMatches ?? this.filteredUpcomingMatches,
      recentMatches: recentMatches ?? this.recentMatches,
      filteredRecentMatches: filteredRecentMatches ?? this.filteredRecentMatches,
      status: status ?? this.status,
      scrollToTop: scrollToTop ?? this.scrollToTop,
      navigateToSeriesDetail: navigateToSeriesDetail ?? this.navigateToSeriesDetail,
      selectedSeries: selectedSeries ?? this.selectedSeries
    );
  }
}