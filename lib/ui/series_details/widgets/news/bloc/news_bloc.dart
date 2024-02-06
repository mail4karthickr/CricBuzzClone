import 'package:bloc/bloc.dart';
import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/story_list.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final CricBuzzRepository repository;
  NewsBloc({required this.repository}) : super(const NewsState()) {
    on<GetStories>(_mapGetStoriesEventToState);
  }

  _mapGetStoriesEventToState(GetStories event, Emitter<NewsState> emit) async {
    try {
      emit(state.copyWith(status: ApiStatus.loading));
      final response = await repository.getStoryList(seriesId: event.seriesId);
      emit(state.copyWith(status: ApiStatus.success, stories: response));
    } catch (error) {
      emit(state.copyWith(status: ApiStatus.error));
    }
  }
}
