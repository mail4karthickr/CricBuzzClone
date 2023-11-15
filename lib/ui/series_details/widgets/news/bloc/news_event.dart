// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetStories extends NewsEvent {
  final int seriesId;
  const GetStories({
    required this.seriesId,
  });
}
