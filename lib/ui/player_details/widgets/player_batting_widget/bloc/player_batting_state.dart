part of 'player_batting_bloc.dart';

sealed class PlayerBattingState extends Equatable {
  const PlayerBattingState();
  
  @override
  List<Object> get props => [];
}

final class PlayerBattingInitial extends PlayerBattingState {}
