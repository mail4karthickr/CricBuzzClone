// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'stats_bloc.dart';

sealed class StatsEvent extends Equatable {
  const StatsEvent();

  @override
  List<Object> get props => [];
}

class GetStatsFilters extends StatsEvent {
  final int seriesId;
  const GetStatsFilters({
    required this.seriesId,
  });
}
