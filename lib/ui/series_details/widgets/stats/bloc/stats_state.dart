// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'stats_bloc.dart';

class StatsState extends Equatable {
  const StatsState({
    this.status = ApiStatus.initial,
    this.filters
  });

  final ApiStatus status;
  final StatsFilters? filters;
  
  @override
  List<Object?> get props => [status, filters];

  StatsState copyWith({
    ApiStatus? status,
    StatsFilters? filters,
  }) {
    return StatsState(
      status: status ?? this.status,
      filters: filters ?? this.filters,
    );
  }
}
