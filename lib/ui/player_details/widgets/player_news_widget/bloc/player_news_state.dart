part of 'player_news_bloc.dart';

sealed class PlayerNewsState extends Equatable {
  const PlayerNewsState();
  
  @override
  List<Object> get props => [];
}

final class PlayerNewsInitial extends PlayerNewsState {}
