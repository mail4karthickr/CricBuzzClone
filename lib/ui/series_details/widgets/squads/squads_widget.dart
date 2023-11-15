import 'package:cricbuzz_clone/core/components/simple_row.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/bloc/matches_list_bloc.dart';
import 'package:cricbuzz_clone/ui/matches/widgets/matches_list/header.dart';
import 'package:cricbuzz_clone/ui/series_details/widgets/squads/bloc/squads_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cricbuzz_clone/core/components/progress_indicator.dart' as core;

class SquadsWidget extends StatefulWidget {
  final int seriesId;
  const SquadsWidget({super.key, required this.seriesId});

  @override
  State<SquadsWidget> createState() => _SquadsWidgetState();
}

class _SquadsWidgetState extends State<SquadsWidget> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    context.read<SquadsBloc>().add(GetSquads(seriesId: widget.seriesId));
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<SquadsBloc, SquadsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status.isLoading) {
          return const core.ProgressIndicator();
        } else if (state.status.isError) {
          return const Text("Error");
        } else {
          return Container(
            color: const Color.fromRGBO(227, 234, 235, 1),
            child: ListView.builder(
              itemCount: state.squadsWrapper?.squads?.length ?? 0,
              itemBuilder: (context, index) {
                final squad = state.squadsWrapper?.squads?[index];
                final title = squad?.squadType ?? '';
                if (squad?.isHeader ?? false) {
                  return const Header(title: 'ODI');
                } else {
                  return SimpleRow(title: title, onTap: () {});
                }
              }
            ),
          );
        }
      }
    );
  }
}