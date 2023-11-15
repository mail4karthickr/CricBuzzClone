import 'package:cricbuzz_clone/repository/cricbuzz_repository.dart';
import 'package:cricbuzz_clone/repository/models/match_type.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/matches_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingMatchesWidget extends StatelessWidget {
  const UpcomingMatchesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("Bloc builder build called1");
    return BlocProvider(
      create: (context) =>
          MatchesListBloc(repository: context.read<CricBuzzRepository>())..add(const GetMatches(type: MatchType.upcoming)),
      child: BlocBuilder<MatchesListBloc, MatchesListState>(
        builder: (context, state) {
          print("Bloc builder build called2");
          return MatchesListWidget(typeList: state.filteredUpcomingMatches);
        },
      ),
    );
  }
}
