part of 'matches_layout_bloc.dart';

sealed class MatchesLayoutEvent extends Equatable {
  const MatchesLayoutEvent();

  @override
  List<Object> get props => [];
}

class LayoutTabChanged extends MatchesLayoutEvent {
  final MatchesTab tab;
  const LayoutTabChanged({
    required this.tab,
  });
}
