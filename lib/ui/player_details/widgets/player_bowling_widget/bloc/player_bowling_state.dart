part of 'player_bowling_bloc.dart';

sealed class PlayerBowlingState extends Equatable {
  const PlayerBowlingState();
  
  @override
  List<Object> get props => [];
}

final class PlayerBowlingInitial extends PlayerBowlingState {}
