part of 'squads_bloc.dart';

sealed class SquadsEvent extends Equatable {
  const SquadsEvent();

  @override
  List<Object> get props => [];
}

class GetSquads extends SquadsEvent {
  final int seriesId;
  const GetSquads({
    required this.seriesId,
  });

  @override
  List<Object> get props => [seriesId];
} 
