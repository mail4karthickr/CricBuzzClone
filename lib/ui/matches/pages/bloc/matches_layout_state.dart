// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'matches_layout_bloc.dart';

class MatchesLayoutState extends Equatable {
  const MatchesLayoutState({
    this.selectedTab = MatchesTab.live
  });

  final MatchesTab selectedTab;
  
  @override
  List<Object?> get props => [selectedTab];

  MatchesLayoutState copyWith({
    MatchesTab? selectedTab,
  }) {
    return MatchesLayoutState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}
