// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'squads_bloc.dart';

class SquadsState extends Equatable {
  final ApiStatus status;
  final SquadsWrapper? squadsWrapper;
  const SquadsState({
    this.status = ApiStatus.initial,
    this.squadsWrapper
  });
  
  @override
  List<Object?> get props => [squadsWrapper];

  SquadsState copyWith({
    ApiStatus? status,
    SquadsWrapper? squadsWrapper,
  }) {
    return SquadsState(
      status: status ?? this.status,
      squadsWrapper: squadsWrapper ?? this.squadsWrapper,
    );
  }
}
