import 'package:cricbuzz_clone/core/api_status.dart';
import 'package:cricbuzz_clone/core/components/simple_row.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/header.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/stats/bloc/stats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricbuzz_clone/core/components/progress_indicator.dart' as core;

class StatsWidget extends StatefulWidget {
  const StatsWidget({super.key, required this.seriesId});

  final int seriesId;

  @override
  State<StatsWidget> createState() => _StatsWidgetState();
}

class _StatsWidgetState extends State<StatsWidget> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print('initState');
    context.read<StatsBloc>().add(GetStatsFilters(seriesId: widget.seriesId));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: const Color.fromRGBO(227, 234, 235, 1),
      child: BlocConsumer<StatsBloc, StatsState>(
        listener: (context, state) {}, 
        builder: (context, state) {
           if (state.status.isLoading) {
            return const core.ProgressIndicator();
          } else if (state.status.isError) {
            return const Text("Error");
          } else {
            final filterTypes = state.filters?.types ?? [];
            final length = filterTypes.length;
            return ListView.builder(
              itemCount: length,
              itemBuilder: (context, index) {
                final type = filterTypes[index];
                final header = type.header ?? '';
                if (header == "Batting") {
                  return const Header(title: 'Batting');
                } else if (header == "Bowling") {
                  return const Header(title: 'Bowling');
                } else {
                  return SimpleRow(title: header, onTap: () {});
                }
              }
            );
          }
        }
      ),
    );
  }
}