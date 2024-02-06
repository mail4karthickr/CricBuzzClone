part of 'player_carrer_bloc.dart';

sealed class PlayerCarrerState extends Equatable {
  const PlayerCarrerState();
  
  @override
  List<Object> get props => [];
}

final class PlayerCarrerInitial extends PlayerCarrerState {}
