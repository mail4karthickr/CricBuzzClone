import 'package:cricbuzz_clone/repository/models/matches_list.dart';
import 'package:cricbuzz_clone/ui/matches/pages/bloc/matches_layout_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_categories/matches_categories.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/series_list.dart';
import 'package:cricbuzz_clone/ui/series_details/pages/series_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MatchesList extends StatelessWidget {
  MatchesList({Key? key, required this.matchesList}) : super(key: key);

  final MatchTypeList matchesList;
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MatchesListBloc, MatchesListState>(
      listener: (context, state) {
        if (state.scrollToTop) {
          controller.animateTo(0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
          context
              .read<MatchesListBloc>()
              .add(const SetScrollToTop(scrollToTop: false));
        }
        if (state.navigateToSeriesDetail) {
          context.push('/matches/series-details', extra: state.selectedSeries);
          context.read<MatchesListBloc>().add(const NavigateToSeriesDetail(
              series: null, shouldNavigate: false));
        }
      },
      child: Container(
        color: const Color.fromRGBO(227, 234, 235, 1),
        child: ListView.builder(
            controller: controller,
            itemCount: matchesList.typeMatches.length,
            itemBuilder: (BuildContext context, int index) {
              final match = matchesList.typeMatches[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      match.matchType,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SeriesList(seriesMatch: match.seriesMatches)
                ],
              );
            }),
      ),
    );
  }
}

class MatchesListWidget extends StatefulWidget {
  const MatchesListWidget({super.key, this.typeList});

  final MatchTypeList? typeList;

  @override
  State<MatchesListWidget> createState() => _MatchesListWidgetState();
}

class _MatchesListWidgetState extends State<MatchesListWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<MatchesLayoutBloc, MatchesLayoutState>(
      listener: (context, state) {
        context.read<MatchesListBloc>().add(TabChanged(tab: state.selectedTab));
      },
      child: BlocConsumer<MatchesListBloc, MatchesListState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status.isSuccess) {
              final typeList = widget.typeList;
              if (typeList != null) {
                return Column(children: [
                  MatchesCategories(onTap: (category) {
                    final bloc = context.read<MatchesListBloc>();
                    bloc.add(CategorySelected(category: category));
                    bloc.add(const SetScrollToTop(scrollToTop: true));
                  }),
                  Expanded(child: MatchesList(matchesList: typeList))
                ]);
              } else {
                return const Center(child: Text('No Matches Available'));
              }
            } else {
              return const Text("Error");
            }
          }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
