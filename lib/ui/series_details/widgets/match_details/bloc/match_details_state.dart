// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'match_details_bloc.dart';

class MatchDetailsState extends Equatable {
  const MatchDetailsState({
    this.status = ApiStatus.initial,
    this.matchDetails,
    this.shouldScrollToCurrentDate = true,
    this.currentMatchIndex = 0
  });

  final ApiStatus status;
  final MatchDetailsWrapper? matchDetails;
  final bool shouldScrollToCurrentDate;
  final int currentMatchIndex;

  MatchDetailsState copyWith({
    ApiStatus? status,
    MatchDetailsWrapper? matchDetails,
    bool? shouldScrollToCurrentDate,
    int? currentMatchIndex
  }) {
    return MatchDetailsState(
      status: status ?? this.status,
      matchDetails: matchDetails ?? this.matchDetails,
      shouldScrollToCurrentDate: shouldScrollToCurrentDate ?? this.shouldScrollToCurrentDate,
      currentMatchIndex: currentMatchIndex ?? this.currentMatchIndex
    );
  }

  @override
  List<Object?> get props => [status, matchDetails, shouldScrollToCurrentDate];
}
