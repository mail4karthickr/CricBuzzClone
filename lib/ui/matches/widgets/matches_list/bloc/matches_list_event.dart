// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'matches_list_bloc.dart';

sealed class MatchesListEvent extends Equatable {
  const MatchesListEvent();

  @override
  List<Object?> get props => [];
}

class GetMatches extends MatchesListEvent {
  final MatchType type;
  const GetMatches({
    required this.type,
  });

  @override
  List<Object> get props => [type];
}

class TabChanged extends MatchesListEvent {
  final MatchesTab tab;
  const TabChanged({
    required this.tab,
  });
}

class CategorySelected extends MatchesListEvent {
  final MatchCategory category;

  const CategorySelected({
    required this.category,
  });

  @override
  List<Object> get props => [category];
}

class SetScrollToTop extends MatchesListEvent {
  final bool scrollToTop;

  const SetScrollToTop({
    required this.scrollToTop,
  });

  @override
  List<Object> get props => [scrollToTop];
}

class NavigateToSeriesDetail extends MatchesListEvent {
  final SeriesAdWrapper? series;
  final bool? shouldNavigate;

  const NavigateToSeriesDetail({required this.shouldNavigate, required this.series});

  @override
  List<Object?> get props => [shouldNavigate, series];
}