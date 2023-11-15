// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'match_details_bloc.dart';

sealed class MatchDetailsEvent extends Equatable {
  const MatchDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMatches extends MatchDetailsEvent {
  final int seriesId;
  const GetMatches({
    required this.seriesId,
  });

  @override
  List<Object> get props => [seriesId];
}
