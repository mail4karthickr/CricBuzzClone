
import 'package:cricbuzz_clone/repository/models/match_details_wrapper.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/header.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/series_matches_list.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/match_details/bloc/match_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:cricbuzz_clone/core/components/progress_indicator.dart' as core;

class MatchDetailsWidget extends StatefulWidget {
  const MatchDetailsWidget({super.key});

  @override
  State<MatchDetailsWidget> createState() => _MatchDetailsWidgetState();
}

class _MatchDetailsWidgetState extends State<MatchDetailsWidget> with AutomaticKeepAliveClientMixin {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<MatchDetailsBloc, MatchDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status.isLoading) {
          return const core.ProgressIndicator();
        } else {
          final matchDetails = state.matchDetails?.matchDetails ?? [];
          return Container(
            color: const Color.fromRGBO(227, 234, 235, 1),
            child: ScrollablePositionedList.builder(
              key: const PageStorageKey<String>('yourListViewKey'),
              initialScrollIndex: state.currentMatchIndex,
              itemScrollController: itemScrollController,
              itemCount: matchDetails.length,
              itemBuilder: (context, index) {
                final type = matchDetails[index];
                final matchDetailsMap = type.matchDetailsMap;
                final adDetails = type.adDetail;
                if (matchDetailsMap != null) {
                  return matchDetailsList(matchDetailsMap);
                } else if (adDetails != null)  {
                  return const Text("Add details");
                } else {
                  return const Text("Error");
                }
              }
            ),
          );
        }
      }
    );
  }

  Widget matchDetailsList(MatchDetailsMap matchDetailsMap) {
    final title = matchDetailsMap.key ?? "";
    final matches = matchDetailsMap.match ?? [];
    return Column(
      children: [
        Header(title: title),
        SeriesMatchesList(matches: matches),
      ]
    );
  }
}