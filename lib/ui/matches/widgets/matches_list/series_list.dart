import 'package:cricbuzz_clone/repository/models/matches_list.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/series_matches_list.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeriesList extends StatelessWidget {
  const SeriesList({super.key, required this.seriesMatch});

  final List<SeriesMatch> seriesMatch;

  @override
  Widget build(BuildContext context) {
     return Column(
      children: seriesMatch.map((item) {
      final seriesAdWrapper = item.seriesAdWrapper;
      final title = seriesAdWrapper?.seriesName ?? "";
      final matches = seriesAdWrapper?.matches ?? [];
      if (seriesAdWrapper != null) {
        return Column(
          children: [
            Header(title: title, onTap: () {
              context.read<MatchesListBloc>().add(NavigateToSeriesDetail(series: seriesAdWrapper, shouldNavigate: true));
            }),
            SeriesMatchesList(matches: matches),
          ],
        );
       } else {
          return const SizedBox(); // or return an empty widget if you prefer
        }
      }).toList(),
    );
  }
}