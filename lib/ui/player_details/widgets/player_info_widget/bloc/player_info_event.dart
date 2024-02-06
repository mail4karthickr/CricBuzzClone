part of 'player_info_bloc.dart';

sealed class PlayerInfoEvent extends Equatable {
  const PlayerInfoEvent();

  @override
  List<Object> get props => [];
}

class GetPlayerInfo extends PlayerInfoEvent {
  final String playerId;

  const GetPlayerInfo({required this.playerId});

  @override
  List<Object> get props => [playerId];
}