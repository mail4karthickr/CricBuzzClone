// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'player_info_bloc.dart';

class PlayerInfoState extends Equatable {
  const PlayerInfoState({
    this.status = ApiStatus.initial,
    this.playerInfo
  });

  final ApiStatus status;
  final PlayerInfo? playerInfo;

  PlayerInfoState copyWith({
    ApiStatus? status,
    PlayerInfo? playerInfo
  }) {
    return PlayerInfoState(
      status: status ?? this.status,
      playerInfo: playerInfo ?? this.playerInfo
    );
  }

  @override
  List<Object?> get props => [status, playerInfo];
}
