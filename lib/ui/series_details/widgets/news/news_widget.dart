import 'package:cricbuzz_clone/core/components/detail_row.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/news/bloc/news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricbuzz_clone/core/components/progress_indicator.dart' as core;

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key, required this.seriesId});

  final int seriesId;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> with AutomaticKeepAliveClientMixin {

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(GetStories(seriesId: widget.seriesId));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<NewsBloc, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        final status = state.status;
        final stories = state.stories?.storyList ?? [];
        if (status.isLoading) {
          return const core.ProgressIndicator();
        } else if (status.isError) {
          return const Text("Error");
        } else {
          return Container(
            padding: const EdgeInsets.all(10),
            color: const Color.fromRGBO(227, 234, 235, 1),
            child: ListView.builder(
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index].story;
                if (story != null) {
                  return Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: DetailRow(
                      imageId: story.imageId ?? 0, 
                      title: story.hline ?? '', 
                      subTitle: '8h ago', 
                      description: story.intro ?? ''
                    ),
                  );
                } else {
                  return const Text('Ad');
                }
              }
            ),
          );
        }
      }
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}