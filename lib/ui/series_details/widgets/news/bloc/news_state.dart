// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

class NewsState extends Equatable {
  const NewsState({
    this.status = ApiStatus.initial,
    this.stories
  });

  final ApiStatus status;
  final StoryList? stories;

  NewsState copyWith({
    ApiStatus? status,
    StoryList? stories,
  }) {
    return NewsState(
      status: status ?? this.status,
      stories: stories ?? this.stories,
    );
  }

  @override
  List<Object?> get props => [stories, status];
}
